import json
import re
from pathlib import Path
from tqdm import tqdm

print("[Phase 3.1] LLM-Inspired Semantic Annotation STARTED", flush=True)

# =====================================================
# PATH CONFIG (CHANGE ROOT ONLY IF NEEDED)
# =====================================================
ROOT = Path(__file__).resolve().parents[2]

TRAD_ANN_DIR = ROOT / "datasets" / "annotations"
CODET5_ANN_DIR = (
    ROOT / "semantic-analysis"
    / "datasetsCodeT5+"
    / "annotations"
)

OUTPUT_FILE = (
    ROOT / "phase3"
    / "llm_annotations"
    / "llm_semantic_annotations.json"
)

# =====================================================
# UTILITIES
# =====================================================
CRUD_KEYWORDS = {
    "create": "Create",
    "add": "Create",
    "save": "Create",
    "post": "Create",

    "get": "Read",
    "find": "Read",
    "read": "Read",
    "list": "Read",

    "update": "Update",
    "set": "Update",
    "put": "Update",

    "delete": "Delete",
    "remove": "Delete"
}

GENERIC_WORDS = {
    "service", "controller", "application", "impl",
    "config", "test", "main", "manager"
}

def infer_intent(name: str):
    name = name.lower()
    for k, v in CRUD_KEYWORDS.items():
        if k in name:
            return v
    return "Process"

def infer_domain_entity(fqn: str):
    tokens = re.split(r"[.\$_]", fqn.lower())
    for t in tokens[::-1]:
        if t not in GENERIC_WORDS and len(t) > 3:
            return t.capitalize()
    return "General"

def infer_business_role(intent, domain):
    if intent == "Read":
        return f"{domain} Query Service"
    if intent == "Create":
        return f"{domain} Creation Service"
    if intent == "Update":
        return f"{domain} Update Service"
    if intent == "Delete":
        return f"{domain} Deletion Service"
    return f"{domain} Processing Service"

# =====================================================
# LOAD FUNCTIONS FROM JSON FILES
# =====================================================
def load_functions(folder: Path):
    functions = set()
    for file in folder.glob("*.json"):
        with open(file, encoding="utf-8") as f:
            data = json.load(f)

        # Flat dictionary
        if isinstance(data, dict):
            for k in data.keys():
                if "." in k:
                    functions.add(k)

        # Nested structure (modules/functions)
        if isinstance(data, dict) and "modules" in data:
            for _, module in data["modules"].items():
                for fn in module.get("functions", {}).keys():
                    functions.add(fn)

    return functions

print("Loading Traditional annotations...")
trad_funcs = load_functions(TRAD_ANN_DIR)

print("Loading CodeT5+ annotations...")
codet5_funcs = load_functions(CODET5_ANN_DIR)

ALL_FUNCTIONS = sorted(trad_funcs.union(codet5_funcs))
print(f"Total unique functions: {len(ALL_FUNCTIONS)}")

# =====================================================
# SEMANTIC ANNOTATION
# =====================================================
results = []

for fqn in tqdm(ALL_FUNCTIONS, desc="Annotating"):
    intent = infer_intent(fqn)
    domain = infer_domain_entity(fqn)
    role = infer_business_role(intent, domain)

    results.append({
        "function_fqn": fqn,
        "intent": intent,
        "domain_entity": domain,
        "business_role": role
    })

# =====================================================
# SAVE OUTPUT
# =====================================================
OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)
with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
    json.dump(results, f, indent=2)

print("[Phase 3.1] COMPLETED")
print("Output written to:", OUTPUT_FILE)
