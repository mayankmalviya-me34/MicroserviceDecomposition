import json
import re
from pathlib import Path
from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity

print("PHASE 3.3 – API–Domain Mapping (WITHOUT SWAGGER)", flush=True)

# ======================================================
# PATH CONFIG
# ======================================================
ROOT = Path(r"F:\Main Project\MICRO")

# Root of Spring project
SPRING_SRC = (
    ROOT / "spring-petclinic-microservices-main"
    / "spring-petclinic-microservices-main"
)

ANNOTATIONS_FILE = ROOT / "phase3" / "llm_annotations" / "llm_semantic_annotations.json"
CLUSTERS_FILE = ROOT / "phase3" / "clusters" / "llm_service_clusters.json"

OUTPUT_DIR = ROOT / "phase3" / "api_mapping"
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

OUTPUT_MAPPING = OUTPUT_DIR / "api_service_mapping.json"
OUTPUT_REPORT = OUTPUT_DIR / "matching_report.json"

# ======================================================
# LOAD PHASE DATA
# ======================================================
with open(ANNOTATIONS_FILE, encoding="utf-8") as f:
    annotations = json.load(f)

with open(CLUSTERS_FILE, encoding="utf-8") as f:
    clusters = json.load(f)

cluster_map = {c["function"]: c["cluster_id"] for c in clusters}

print("Loaded annotations and clusters", flush=True)

# ======================================================
# STEP 1: EXTRACT ENDPOINTS FROM CONTROLLERS
# ======================================================
endpoint_pattern = re.compile(
    r'@(GetMapping|PostMapping|PutMapping|DeleteMapping|RequestMapping)\s*\(\s*(?:value\s*=\s*)?"([^"]*)"'
)

method_map = {
    "GetMapping": "GET",
    "PostMapping": "POST",
    "PutMapping": "PUT",
    "DeleteMapping": "DELETE",
    "RequestMapping": "REQUEST"
}

endpoints = []

for java_file in SPRING_SRC.rglob("*.java"):
    text = java_file.read_text(encoding="utf-8", errors="ignore")

    for match in endpoint_pattern.finditer(text):
        ann, path = match.groups()
        endpoints.append({
            "endpoint": path if path else "/",
            "method": method_map.get(ann, "REQUEST"),
            "source_file": str(java_file)
        })

print(f"Extracted {len(endpoints)} API endpoints", flush=True)

# ======================================================
# STEP 2: BUILD FUNCTION SEMANTIC SPACE
# ======================================================
function_texts = []
function_meta = []

for a in annotations:
    text = f"{a['intent']} {a['domain_entity']} {a['business_role']}"
    function_texts.append(text)
    function_meta.append(a)

model = SentenceTransformer("sentence-transformers/all-MiniLM-L6-v2")
function_embeddings = model.encode(function_texts, show_progress_bar=True)

# ======================================================
# CRUD FROM HTTP METHOD
# ======================================================
def crud_from_method(method):
    if method == "POST":
        return "Create"
    if method == "GET":
        return "Read"
    if method in ("PUT", "PATCH"):
        return "Update"
    if method == "DELETE":
        return "Delete"
    return "Process"

# ======================================================
# STEP 3: SEMANTIC MATCHING
# ======================================================
results = []
report = []

for ep in endpoints:
    crud = crud_from_method(ep["method"])
    endpoint_text = f"{crud} {ep['endpoint']} API"

    ep_embedding = model.encode([endpoint_text])
    sims = cosine_similarity(ep_embedding, function_embeddings)[0]

    best_idx = sims.argmax()
    best_score = float(sims[best_idx])

    best_func = function_meta[best_idx]["function_fqn"]
    best_cluster = cluster_map.get(best_func, "Unassigned")
    best_role = function_meta[best_idx]["business_role"]

    results.append({
        "endpoint": ep["endpoint"],
        "method": ep["method"],
        "business_role": best_role,
        "cluster_id": best_cluster
    })

    report.append({
        "endpoint": f"{ep['method']} {ep['endpoint']}",
        "matched_function": best_func,
        "similarity_score": round(best_score, 3),
        "assigned_cluster": best_cluster
    })

# ======================================================
# SAVE OUTPUT
# ======================================================
with open(OUTPUT_MAPPING, "w", encoding="utf-8") as f:
    json.dump(results, f, indent=2)

with open(OUTPUT_REPORT, "w", encoding="utf-8") as f:
    json.dump(report, f, indent=2)

print("PHASE 3.3 COMPLETED WITHOUT SWAGGER", flush=True)
print("API mapping saved to:", OUTPUT_MAPPING)
print("Matching report saved to:", OUTPUT_REPORT)
