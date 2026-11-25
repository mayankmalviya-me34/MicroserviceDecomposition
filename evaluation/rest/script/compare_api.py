import json
import csv
import re
import sys
from difflib import SequenceMatcher


# =====================================
# FILES
#
# Usage:
#   python compare_apis.py existing_api.json generated_api.json report.csv
# =====================================

OLD_FILE = sys.argv[1] if len(sys.argv) > 1 else "../existing_api.json"
NEW_FILE = sys.argv[2] if len(sys.argv) > 2 else "../generated_api.json"
OUTPUT   = sys.argv[3] if len(sys.argv) > 3 else "../smart_api_comparison_report.csv"


# ─────────────────────────────────────
# WEIGHTS
# ─────────────────────────────────────

W_METHOD   = 0.20
W_PATH     = 0.30
W_FUNCTION = 0.25
W_RETURN   = 0.25


# ─────────────────────────────────────
# THRESHOLDS
# ─────────────────────────────────────

THRESHOLD_MIN_CONSIDER = 0.55


# ─────────────────────────────────────
# LOAD
# ─────────────────────────────────────

with open(OLD_FILE) as f:
    old_apis = json.load(f)

with open(NEW_FILE) as f:
    new_apis = json.load(f)


# ─────────────────────────────────────
# HELPERS
# ─────────────────────────────────────

def normalize_path(path):
    path = path.lower()
    path = re.sub(r"\{.*?\}", "{param}", path)
    path = path.replace("*", "{param}")
    parts = path.split("/")
    clean = []
    for p in parts:
        if p.endswith("s") and len(p) > 3:
            p = p[:-1]
        clean.append(p)
    return "/".join(clean)


def str_sim(a, b):
    if not a and not b:
        return 1.0
    if not a or not b:
        return 0.0
    return SequenceMatcher(None, a.lower(), b.lower()).ratio()


_STRIP_SUFFIXES = (
    "details", "info", "dto", "response", "request",
    "payload", "data", "model", "view", "resource",
    "summary", "result", "wrapper", "object",
)

def normalize_return_type(rt):
    """
    Strip generics + common DTO suffixes to get core domain entity.
    e.g. Mono<OwnerDetails> → owner
         List<Owner>        → owner
         PetDetails         → pet
         Visits             → visit
    """
    if not rt:
        return ""
    rt = rt.lower().strip()
    m = re.search(r'<(.+?)>', rt)
    if m:
        rt = m.group(1).strip()
    rt = rt.replace("[]", "").strip()
    for suffix in _STRIP_SUFFIXES:
        if rt.endswith(suffix) and len(rt) > len(suffix):
            rt = rt[: -len(suffix)].strip()
            break
    if rt.endswith("s") and len(rt) > 3:
        rt = rt[:-1]
    return rt


# ─────────────────────────────────────
# COLLECTION TYPE CHECK
# ─────────────────────────────────────

def is_collection(rt):
    """
    Returns True if the return type is a collection / list.
    e.g. List<Owner>, Set<Vet>, Flux<Pet>, Owner[] → True
         Owner, Mono<Owner>, Optional<Owner>       → False
    """
    if not rt or rt == '-':
        return False
    rt = rt.lower().strip()
    return (
        any(rt.startswith(p) for p in
            ('list<', 'set<', 'collection<', 'page<', 'flux<', 'iterable<'))
        or rt.endswith('[]')
    )


# ─────────────────────────────────────
# WEIGHTED SCORE
# ─────────────────────────────────────

def compute_score(old, new):
    # HTTP method must match — hard requirement
    if old["method"] != new["method"]:
        return 0.0, 0.0

    old_norm = normalize_path(old["path"])
    new_norm = normalize_path(new["path"])
    path_sim = str_sim(old_norm, new_norm)

    func_sim = str_sim(
        old.get("function", ""),
        new.get("function", "")
    )

    old_entity = normalize_return_type(old.get("returnType", ""))
    new_entity = normalize_return_type(new.get("returnType", ""))
    rt_sim     = str_sim(old_entity, new_entity)

    # ── Hard reject Rule 1 ────────────────────────────────────────
    # Both path AND entity low → reject.
    # Catches: /vets (List<Vet>) vs mismatched low-path endpoint.
    if path_sim < 0.58 and rt_sim < 0.50 and old_entity and new_entity:
        return 0.0, 0.0

    # ── Hard reject Rule 2 ────────────────────────────────────────
    # Path low AND function name low → reject.
    # Catches: /api/gateway/owners/{id} (getOwnerDetails)
    #       vs /owners/*/lastname/{name} (getOwnersByLastName)
    # Entity is both "owner" so Rule 1 doesn't fire, but both
    # path (0.49) and function (0.46) clearly point to different ops.
    if path_sim < 0.58 and func_sim < 0.50:
        return 0.0, 0.0

    # ── Hard reject Rule 3 ────────────────────────────────────────
    # Collection vs single mismatch with low path → reject.
    #
    # Core idea: "get one by ID" (Mono<X>, X) can NEVER be the same
    # operation as "search/list all" (List<X>, Flux<X>) if the paths
    # are also clearly different.
    #
    # Catches:
    #   Mono<OwnerDetails> vs List<Owner>  path=0.49 → REJECT ✅
    #   List<Vet>          vs Vets         path=0.57 → REJECT ✅
    # Does NOT affect:
    #   same-path matches (path_sim=1.0 → rule doesn't fire)
    #   both collections or both singles → old_coll==new_coll → no reject
    old_coll = is_collection(old.get("returnType", ""))
    new_coll = is_collection(new.get("returnType", ""))
    if old_coll != new_coll and path_sim < 0.65:
        return 0.0, 0.0
    # ─────────────────────────────────────────────────────────────

    weighted = (
        W_METHOD   * 1.0
        + W_PATH     * path_sim
        + W_FUNCTION * func_sim
        + W_RETURN   * rt_sim
    )

    return round(weighted, 4), round(path_sim, 4)


# ─────────────────────────────────────
# STATUS DECISION
# ─────────────────────────────────────

def decide_status(old, new, path_sim):
    """
    SAME           → path identical + same service + same core entity
    MOVED          → path identical + different service + same core entity
    MODIFIED_MOVED → path identical but core entity changed
                     OR path different (renaming/restructuring)
    """
    service_changed = old.get("service", "") != new.get("service", "")

    old_entity = normalize_return_type(old.get("returnType", ""))
    new_entity = normalize_return_type(new.get("returnType", ""))

    return_changed = (
        old_entity != ""
        and new_entity != ""
        and old_entity != new_entity
    )

    if path_sim == 1.0:
        if return_changed:
            return "MODIFIED_MOVED"
        elif not service_changed:
            return "SAME"
        else:
            return "MOVED"
    else:
        return "MODIFIED_MOVED"


# ─────────────────────────────────────
# BUILD ALL CANDIDATE PAIRS
# Global-best assignment — no greedy order dependency
# ─────────────────────────────────────

candidates = []

for oi, old in enumerate(old_apis):
    for ni, new in enumerate(new_apis):
        weighted, path_sim = compute_score(old, new)
        if weighted >= THRESHOLD_MIN_CONSIDER:
            candidates.append((weighted, path_sim, oi, ni))

candidates.sort(key=lambda c: (c[0], c[1]), reverse=True)

old_match = {}
new_used  = set()

for weighted, path_sim, oi, ni in candidates:
    if oi in old_match or ni in new_used:
        continue
    old_match[oi] = (ni, weighted, path_sim)
    new_used.add(ni)


# ─────────────────────────────────────
# BUILD RESULTS
# ─────────────────────────────────────

results  = []
same = moved = modified = new_count = missing = 0

for oi, old in enumerate(old_apis):

    if oi in old_match:
        ni, weighted, path_sim = old_match[oi]
        new    = new_apis[ni]
        status = decide_status(old, new, path_sim)

        if status == "SAME":             same     += 1
        elif status == "MOVED":          moved    += 1
        elif status == "MODIFIED_MOVED": modified += 1

        results.append({
            "method":         old["method"],
            "old_path":       old["path"],
            "new_path":       new["path"],
            "old_function":   old.get("function", ""),
            "new_function":   new.get("function", ""),
            "old_returnType": old.get("returnType", ""),
            "new_returnType": new.get("returnType", ""),
            "old_service":    old.get("service", ""),
            "new_service":    new.get("service", ""),
            "old_class":      old.get("class", ""),
            "new_class":      new.get("class", ""),
            "weighted_score": weighted,
            "path_sim":       path_sim,
            "status":         status,
        })

    else:
        missing += 1
        results.append({
            "method":         old["method"],
            "old_path":       old["path"],
            "new_path":       "-",
            "old_function":   old.get("function", ""),
            "new_function":   "-",
            "old_returnType": old.get("returnType", ""),
            "new_returnType": "-",
            "old_service":    old.get("service", ""),
            "new_service":    "-",
            "old_class":      old.get("class", ""),
            "new_class":      "-",
            "weighted_score": 0,
            "path_sim":       0,
            "status":         "MISSING",
        })

for ni, new in enumerate(new_apis):
    if ni not in new_used:
        new_count += 1
        results.append({
            "method":         new["method"],
            "old_path":       "-",
            "new_path":       new["path"],
            "old_function":   "-",
            "new_function":   new.get("function", ""),
            "old_returnType": "-",
            "new_returnType": new.get("returnType", ""),
            "old_service":    "-",
            "new_service":    new.get("service", ""),
            "old_class":      "-",
            "new_class":      new.get("class", ""),
            "weighted_score": 0,
            "path_sim":       0,
            "status":         "NEW",
        })


# ─────────────────────────────────────
# SAVE CSV
# ─────────────────────────────────────

FIELDNAMES = [
    "method",
    "old_path",       "new_path",
    "old_function",   "new_function",
    "old_returnType", "new_returnType",
    "old_service",    "new_service",
    "old_class",      "new_class",
    "weighted_score", "path_sim",
    "status",
]

with open(OUTPUT, "w", newline="") as f:
    writer = csv.DictWriter(f, fieldnames=FIELDNAMES)
    writer.writeheader()
    writer.writerows(results)


# ─────────────────────────────────────
# SUMMARY
# ─────────────────────────────────────

total_old = len(old_apis)
preserved = same + moved + modified

print("\n========== API COMPARISON REPORT ==========")
print(f"  Existing APIs  : {total_old}")
print(f"  Generated APIs : {len(new_apis)}")
print("--------------------------------------------")
print(f"  ✅ SAME           : {same}")
print(f"  🔀 MOVED          : {moved}")
print(f"  ✏️  MODIFIED_MOVED : {modified}")
print(f"  🆕 NEW            : {new_count}")
print(f"  ❌ MISSING        : {missing}")
print("--------------------------------------------")

if total_old:
    coverage = (preserved / total_old) * 100
    print(f"  API Preservation : {round(coverage, 2)}%")
else:
    print("  API Preservation : N/A")

print(f"\n  Report saved → {OUTPUT}")
print("============================================\n")

modified_rows = [r for r in results if r["status"] == "MODIFIED_MOVED"]
if modified_rows:
    print("── MODIFIED_MOVED Detail ──────────────────")
    for r in modified_rows:
        print(f"  {r['method']}  {r['old_path']}  →  {r['new_path']}")
        print(f"       func   : {r['old_function']} → {r['new_function']}")
        print(f"       return : {r['old_returnType']} → {r['new_returnType']}")
        print(f"       score  : {r['weighted_score']}  (path_sim={r['path_sim']})")
        print()

missing_rows = [r for r in results if r["status"] == "MISSING"]
if missing_rows:
    print("── MISSING Detail ─────────────────────────")
    for r in missing_rows:
        print(f"  {r['method']}  {r['old_path']}  [{r['old_service']}]")
    print()