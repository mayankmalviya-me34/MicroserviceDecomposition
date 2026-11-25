import json
import re
from pathlib import Path

from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity
import numpy as np

print("[Phase 3.3] API–Domain Function Mapping STARTED", flush=True)

# ======================================================
# PATH CONFIG
# ======================================================
ROOT = Path(__file__).resolve().parents[2]

SRC_DIR = ROOT / "src" / "main" / "java"

ANN_FILE = ROOT / "phase3" / "llm_annotations" / "llm_semantic_annotations.json"
CLUSTER_FILE = ROOT / "phase3" / "clusters" / "llm_service_clusters.json"

OUTPUT_DIR = ROOT / "phase3" / "api_mapping"
OUTPUT_FILE = OUTPUT_DIR / "api_service_mapping.json"
REPORT_FILE = OUTPUT_DIR / "matching_report.json"

OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

# ======================================================
# LOAD DATA
# ======================================================
with open(ANN_FILE, encoding="utf-8") as f:
    annotations = json.load(f)

with open(CLUSTER_FILE, encoding="utf-8") as f:
    clusters = json.load(f)

func_to_cluster = {
    c["function"]: c["cluster_id"] for c in clusters
}

# ======================================================
# PARSE API ENDPOINTS FROM SPRING CONTROLLERS
# ======================================================
endpoint_pattern = re.compile(
    r"@(GetMapping|PostMapping|PutMapping|DeleteMapping|RequestMapping)\s*"
    r"\(\s*(value\s*=\s*)?\"([^\"]+)\""
)

method_map = {
    "GetMapping": "GET",
    "PostMapping": "POST",
    "PutMapping": "PUT",
    "DeleteMapping": "DELETE",
    "RequestMapping": "REQUEST"
}

api_endpoints = []

for java_file in SRC_DIR.rglob("*.java"):
    if "Controller" not in java_file.name:
        continue

    with open(java_file, encoding="utf-8", errors="ignore") as f:
        content = f.read()

    for match in endpoint_pattern.finditer(content):
        annotation = match.group(1)
        path = match.group(3)

        api_endpoints.append({
            "endpoint": path,
            "method": method_map.get(annotation, "REQUEST"),
            "source_file": java_file.name
        })

print(f"Extracted {len(api_endpoints)} API endpoints", flush=True)

# ======================================================
# BUILD SEMANTIC TEXT
# ======================================================
endpoint_texts = [
    f"{e['method']} {e['endpoint']}"
    for e in api_endpoints
]

function_texts = [
    f"{a['intent']} {a['domain_entity']} {a['business_role']}"
    for a in annotations
]

# ======================================================
# EMBEDDINGS (Sentence-BERT)
# ======================================================
model = SentenceTransformer("sentence-transformers/all-MiniLM-L6-v2")

endpoint_embeddings = model.encode(endpoint_texts, show_progress_bar=True)
function_embeddings = model.encode(function_texts, show_progress_bar=True)

# ======================================================
# SEMANTIC MATCHING (COSINE SIMILARITY)
# ======================================================
similarity = cosine_similarity(endpoint_embeddings, function_embeddings)

results = []
report = []

for i, ep in enumerate(api_endpoints):
    best_idx = int(np.argmax(similarity[i]))
    score = float(similarity[i][best_idx])

    matched_func = annotations[best_idx]["function_fqn"]
    business_role = annotations[best_idx]["business_role"]
    cluster_id = func_to_cluster.get(matched_func, "UnassignedService")

    results.append({
        "endpoint": ep["endpoint"],
        "method": ep["method"],
        "business_role": business_role,
        "cluster_id": cluster_id
    })

    report.append({
        "endpoint": f"{ep['method']} {ep['endpoint']}",
        "matched_function": matched_func,
        "similarity_score": round(score, 3),
        "cluster_id": cluster_id
    })

# ======================================================
# SAVE OUTPUT
# ======================================================
with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
    json.dump(results, f, indent=2)

with open(REPORT_FILE, "w", encoding="utf-8") as f:
    json.dump(report, f, indent=2)

print("[Phase 3.3] COMPLETED SUCCESSFULLY", flush=True)
print("Mapping written to:", OUTPUT_FILE)
print("Matching report written to:", REPORT_FILE)
