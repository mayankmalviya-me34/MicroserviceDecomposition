import os
import json
from pathlib import Path
from collections import defaultdict

print("[Phase 3.4] Improved Service Metrics STARTED", flush=True)

# ==============================
# PATH CONFIG
# ==============================
ROOT = Path(__file__).resolve().parents[2]

API_FILE = ROOT / "phase3" / "api_mapping" / "api_service_mapping.json"
CLUSTER_FILE = ROOT / "phase3" / "clusters" / "llm_service_clusters.json"
OUTPUT_FILE = ROOT / "phase3" / "metrics" / "service_metrics.json"

# ==============================
# LOAD GRAPH
# ==============================
print("[INFO] Loading enriched graph...")
G = nx.read_graphml(API_FILE)


# ==============================
# LOAD API DATA
# ==============================
print("[INFO] Loading API mapping...")
with open(API_FILE, encoding="utf-8") as f:
    api_data = json.load(f)

# ==============================
# GROUP BY RESOURCE (IMPORTANT)
# ==============================
print("[INFO] Grouping by resource...")

resource_groups = defaultdict(list)

def normalize(endpoint):
    # remove IDs for grouping
    return endpoint.replace("{ownerId}", "").replace("{petId}", "").replace("//", "/")

for item in api_data:
    key = normalize(item["endpoint"])
    resource_groups[key].append(item)

# ==============================
# BUILD DEPENDENCY GRAPH (SMART)
# ==============================
print("[INFO] Building service dependency graph...")

service_edges = defaultdict(set)

for resource, items in resource_groups.items():

    get_services = set()
    post_services = set()

    for item in items:
        if item["method"] == "GET":
            get_services.add(item["cluster_id"])
        elif item["method"] in ["POST", "PUT", "DELETE", "REQUEST"]:
            post_services.add(item["cluster_id"])

    # POST → GET dependency (WRITE → READ)
    for p in post_services:
        for g in get_services:
            if p != g:
                service_edges[p].add(g)

# ==============================
# EXTRACT SERVICES
# ==============================
services = set()
for s in service_edges:
    services.add(s)
    services.update(service_edges[s])

print(f"[INFO] Services detected: {len(services)}")

# ==============================
# COMPUTE Ca & Ce
# ==============================
print("[INFO] Computing Ca & Ce...")

Ca = {}
Ce = {}

for s in services:
    Ce[s] = len(service_edges.get(s, []))
    Ca[s] = sum(1 for x in services if s in service_edges.get(x, []))

# ==============================
# COMPUTE INSTABILITY
# ==============================
print("[INFO] Computing Instability...")

instability = {}
for s in services:
    total = Ca[s] + Ce[s]
    instability[s] = Ce[s] / total if total > 0 else 0

# ==============================
# COMPUTE COHESION (IMPROVED)
# ==============================
print("[INFO] Computing Cohesion...")

with open(CLUSTER_FILE, encoding="utf-8") as f:
    cluster_data = json.load(f)

service_funcs = defaultdict(list)

for item in cluster_data:
    service_funcs[item["cluster_id"]].append(item["function"])

cohesion = {}

for s in services:
    funcs = service_funcs.get(s, [])
    n = len(funcs)

    if n <= 1:
        cohesion[s] = 1.0
    else:
        cohesion[s] = min(1.0, n / 5)  # normalize

# ==============================
# SAVE OUTPUT
# ==============================
print("[INFO] Saving results...")

os.makedirs(OUTPUT_FILE.parent, exist_ok=True)

result = {}

for s in services:
    result[s] = {
        "Ca": Ca[s],
        "Ce": Ce[s],
        "Instability": round(instability[s], 3),
        "Cohesion": round(cohesion[s], 3),
        "Depends_On": list(service_edges.get(s, []))  # 🔥 NEW
    }

with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
    json.dump(result, f, indent=2)

print("\n[SUCCESS] Phase 3.4 Completed")
print("Saved at:", OUTPUT_FILE)

# ==============================
# PRINT CONNECTIONS (DEBUG)
# ==============================
print("\n🔗 SERVICE DEPENDENCIES:\n")

for s in service_edges:
    for target in service_edges[s]:
        print(f"{s}  --->  {target}")