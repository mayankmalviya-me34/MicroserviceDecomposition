"""
compute_service_metrics.py
Phase 3.4 — Business-Oriented Metrics (Ca / Ce / Instability / Cohesion)

FIXED APPROACH: Class-level dependencies (not method-level)
- Group methods by their CLASS → domain microservice
- Build class→class deps from imports in semantic.json
- Aggregate to service level → real Ca/Ce
"""

import os
import json
from pathlib import Path
from collections import defaultdict

print("[Phase 3.4] Business-Oriented Metrics STARTED", flush=True)

# ==============================
# PATHS
# ==============================
BASE = Path(__file__).resolve().parents[2]

CLUSTER_FILE  = BASE / "phase3"  / "clusters" / "llm_service_clusters.json"
OUTPUT_FILE   = BASE / "phase3"  / "metric1"  / "service_metrics1.json"
SEMANTIC_JSON = BASE / "semantic-analysis" / "datasetsCodeT5+" / "graphs" / "spring-petclinic" / "semantic.json"

with open(SEMANTIC_JSON, encoding="utf-8") as f:
    semantic = json.load(f)

with open(CLUSTER_FILE, encoding="utf-8") as f:
    cluster_data = json.load(f)

# ==============================
# STEP 1: Domain-level class grouping
# Microservice candidates for PetClinic
# ==============================
DOMAIN_GROUPS = {
    # Owner microservice
    "Owner":             "OwnerService",
    "OwnerController":   "OwnerService",
    "OwnerRepository":   "OwnerService",
    "Pet":               "OwnerService",
    "PetController":     "OwnerService",
    "PetType":           "OwnerService",
    "PetTypeFormatter":  "OwnerService",
    "PetTypeRepository": "OwnerService",
    "PetValidator":      "OwnerService",
    "Visit":             "OwnerService",
    "VisitController":   "OwnerService",

    # Vet microservice
    "Vet":               "VetService",
    "VetController":     "VetService",
    "VetRepository":     "VetService",
    "Vets":              "VetService",
    "Specialty":         "VetService",

    # Shared model
    "BaseEntity":        "ModelService",
    "NamedEntity":       "ModelService",
    "Person":            "ModelService",

    # System / infra
    "CrashController":   "SystemService",
    "WebConfiguration":  "SystemService",
    "WelcomeController": "SystemService",
    "CacheConfiguration":"SystemService",

    # App bootstrap
    "PetClinicApplication":  "ApplicationService",
    "PetClinicRuntimeHints": "ApplicationService",
}

print(f"[INFO] Domain mappings: {len(DOMAIN_GROUPS)} classes → {len(set(DOMAIN_GROUPS.values()))} services")

# ==============================
# STEP 2: Class-level import-based deps
# OwnerController imports Owner → OwnerController depends on Owner
# But both are OwnerService → no cross-service dep
# VetController imports Person → VetService depends on ModelService ✅
# ==============================
class_deps = defaultdict(set)

for entry in semantic:
    methods = entry.get("methods", []) or []
    for m in methods:
        if not isinstance(m, dict):
            continue
        cls     = m.get("class", "")
        imports = m.get("imports", [])
        for imp in imports:
            dep = imp.split(".")[-1]
            if dep and dep[0].isupper() and dep != cls:
                class_deps[cls].add(dep)

# ==============================
# STEP 3: Aggregate to service level
# ==============================
service_deps = defaultdict(set)

for cls, deps in class_deps.items():
    src = DOMAIN_GROUPS.get(cls)
    if not src:
        continue
    for dep_cls in deps:
        tgt = DOMAIN_GROUPS.get(dep_cls)
        if tgt and tgt != src:
            service_deps[src].add(tgt)

all_services = set(DOMAIN_GROUPS.values())

print(f"[INFO] Cross-service dependency pairs: {sum(len(v) for v in service_deps.values())}")

# ==============================
# STEP 4: Function count per service
# ==============================
service_funcs  = defaultdict(list)
service_classes = defaultdict(set)

for item in cluster_data:
    raw   = item.get("function", "")
    parts = raw.split(".")
    if len(parts) < 2:
        continue
    cls  = parts[-2] if len(parts) >= 2 and parts[-2][0:1].isupper() else ""
    func = parts[-1]
    svc  = DOMAIN_GROUPS.get(cls) or DOMAIN_GROUPS.get(func)
    if svc:
        service_funcs[svc].append(f"{cls}.{func}")
        service_classes[svc].add(cls)

# ==============================
# STEP 5: Compute Ca / Ce / Instability / Cohesion
# ==============================
result = {}

for svc in sorted(all_services):
    Ce = len(service_deps.get(svc, set()))
    Ca = sum(1 for other in all_services
             if other != svc and svc in service_deps.get(other, set()))

    total       = Ca + Ce
    instability = round(Ce / total, 3) if total > 0 else 0.0
    n           = len(service_funcs.get(svc, []))
    # Cohesion: more classes in one service = lower cohesion
    c           = len(service_classes.get(svc, set()))
    cohesion    = round(1.0 if c <= 1 else max(0.3, 1.0 - (c - 1) * 0.1), 3)

    result[svc] = {
        "Ca":             int(Ca),
        "Ce":             int(Ce),
        "Instability":    instability,
        "Cohesion":       cohesion,
        "Depends_On":     sorted(service_deps.get(svc, set())),
        "Depended_By":    sorted(o for o in all_services
                                 if o != svc and svc in service_deps.get(o, set())),
        "Function_Count": n,
        "Classes":        sorted(service_classes.get(svc, set())),
    }

# ==============================
# SAVE
# ==============================
os.makedirs(OUTPUT_FILE.parent, exist_ok=True)
with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
    json.dump(result, f, indent=2, ensure_ascii=False)

# ==============================
# PRINT
# ==============================
print(f"\n{'='*80}")
print(f"  MICROSERVICE DEPENDENCY METRICS — Spring PetClinic")
print(f"{'='*80}")
print(f"\n{'Service':<22} {'Ca':>4} {'Ce':>4} {'Instab':>8} {'Cohesion':>9}  Depends_On")
print("-" * 80)

for svc in sorted(result.keys()):
    m   = result[svc]
    dep = ", ".join(m["Depends_On"]) if m["Depends_On"] else "—"
    print(f"{svc:<22} {m['Ca']:>4} {m['Ce']:>4} {m['Instability']:>8.3f} {m['Cohesion']:>9.3f}  {dep}")

print(f"\n{'='*80}")
print(f"Total Microservices: {len(result)}")
print(f"Saved → {OUTPUT_FILE}")

stable   = [s for s, m in result.items() if m["Instability"] == 0.0 and m["Ca"] > 0]
unstable = [s for s, m in result.items() if m["Instability"] >= 0.7]
isolated = [s for s, m in result.items() if m["Ca"] == 0 and m["Ce"] == 0]

print(f"\n📌 ARCHITECTURE INSIGHTS:")
print(f"  Stable   (depended on, not depending): {stable}")
print(f"  Unstable (depends on many, no one depends on it): {unstable}")
print(f"  Isolated (no deps either way): {isolated}")