import json
from pathlib import Path
import re

print("PHASE 3.1 SCRIPT STARTED", flush=True)

# =====================================================
# PATH CONFIG
# =====================================================
ROOT = Path(r"F:\Main Project\MICRO")

TRAD_ANN_DIR = ROOT / "datasets" / "annotations"
CODET5_ANN_DIR = (
    ROOT / "spring-petclinic-microservices-main"
    / "spring-petclinic-microservices-main"
    / "semantic-analysis"
    / "datasetsCodeT5+"
    / "annotations"
)

OUTPUT = ROOT / "phase3" / "llm_annotations" / "llm_semantic_annotations.json"

# =====================================================
# LOAD ALL FUNCTIONS (ROBUST)
# =====================================================
def load_all_functions(folder: Path):
    data = {}
    print(f"\nREADING FROM: {folder}", flush=True)

    for file in folder.glob("*.json"):
        print("  FILE:", file.name, flush=True)

        with open(file, encoding="utf-8") as f:
            obj = json.load(f)

        # Flat structure
        if isinstance(obj, dict):
            for k, v in obj.items():
                if isinstance(k, str) and "." in k:
                    data[k] = v

        # CodeT5+ nested structure
        if isinstance(obj, dict) and "modules" in obj:
            for _, service_data in obj["modules"].items():
                funcs = service_data.get("functions", {})
                for fqn, meta in funcs.items():
                    data[fqn] = meta

    print(f"TOTAL FUNCTIONS LOADED: {len(data)}", flush=True)
    return data

# =====================================================
# SEMANTIC INFERENCE (RESEARCH-GRADE)
# =====================================================

# Noise words — NEVER domain entities
STOP_WORDS = {
    "main","test","tests","context","load","default","config",
    "application","service","client","controller","repository",
    "impl","web","api","admin","model"
}

# Known bounded contexts (PetClinic-like but extensible)
BOUNDED_CONTEXTS = {
    "customers": ("Customers", "Customers Domain Service"),
    "visits": ("Visits", "Visits Domain Service"),
    "vets": ("Vets", "Vets Domain Service"),
    "billing": ("Billing", "Billing Domain Service"),
}

def split_camel(name: str):
    return re.findall(r"[A-Z][a-z]*|[a-z]+", name)

def infer_intent(method: str) -> str:
    m = method.lower()
    if m.startswith(("create","add","save","register")):
        return "Create"
    if m.startswith(("get","find","read","fetch")):
        return "Read"
    if m.startswith(("set","update","modify")):
        return "Update"
    if m.startswith(("delete","remove")):
        return "Delete"
    return "Process"

def infer_domain_and_role(fqn: str):
    fqn_lower = fqn.lower()
    parts = fqn.split(".")
    class_name = parts[-2] if len(parts) > 1 else parts[-1]
    method_name = parts[-1]

    # -------- 1. Bounded Context detection --------
    for key, (domain, role) in BOUNDED_CONTEXTS.items():
        if key in fqn_lower:
            return domain, role

    # -------- 2. Infrastructure / Architecture --------
    if "gateway" in class_name.lower():
        return "API Gateway", "Gateway Service"

    if "admin" in class_name.lower():
        return "Administration", "Admin Service"

    if "config" in fqn_lower:
        return "Infrastructure", "Infrastructure Service"

    if class_name.endswith("Application"):
        return "Infrastructure", "Infrastructure Service"

    # -------- 3. Entity / Model classes --------
    if ".model." in fqn_lower:
        entity = split_camel(class_name)[-1]
        return entity, "Domain Entity"

    # -------- 4. Class-centric semantic inference --------
    tokens = split_camel(class_name) + split_camel(method_name)
    tokens = [t for t in tokens if t.lower() not in STOP_WORDS]

    if tokens:
        domain = tokens[0]
        return domain, f"{domain} Service"

    # -------- 5. Safe fallback --------
    return "Infrastructure", "Infrastructure Service"

# =====================================================
# PIPELINE
# =====================================================
print("\n--- LOADING TRADITIONAL DATA ---", flush=True)
trad_data = load_all_functions(TRAD_ANN_DIR)

print("\n--- LOADING CODET5+ DATA ---", flush=True)
codet5_data = load_all_functions(CODET5_ANN_DIR)

all_functions = set(trad_data) | set(codet5_data)
print("\nFINAL UNIQUE FUNCTIONS:", len(all_functions), flush=True)

results = []

for fqn in sorted(all_functions):
    method = fqn.split(".")[-1]
    intent = infer_intent(method)
    domain, role = infer_domain_and_role(fqn)

    results.append({
        "function_fqn": fqn,
        "intent": intent,
        "domain_entity": domain,
        "business_role": role
    })

# =====================================================
# OUTPUT
# =====================================================
OUTPUT.parent.mkdir(parents=True, exist_ok=True)

with open(OUTPUT, "w", encoding="utf-8") as f:
    json.dump(results, f, indent=2)

print("\nPHASE 3.1 COMPLETED SUCCESSFULLY", flush=True)
print("OUTPUT FILE:", OUTPUT, flush=True)
print("TOTAL ANNOTATED FUNCTIONS:", len(results), flush=True)
