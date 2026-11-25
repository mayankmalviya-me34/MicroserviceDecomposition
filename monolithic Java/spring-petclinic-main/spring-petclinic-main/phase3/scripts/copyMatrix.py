import os
import json
from pathlib import Path
from collections import defaultdict
import networkx as nx
import re

print("[Phase 3.4] Business-Oriented Metrics STARTED", flush=True)

# ==============================
# PATHS
# ==============================
ROOT = Path(__file__).resolve().parents[2]

CLUSTER_FILE = ROOT / "phase3" / "clusters" / "llm_service_clusters.json"
OUTPUT_FILE = ROOT / "phase3" / "metrics" / "service_metrics4.json"
GRAPH_PATH = ROOT / "datasets" / "enriched" / "semantic_enriched.graphml"

# ==============================
# LOAD DATA
# ==============================
G = nx.read_graphml(GRAPH_PATH)
print(f"[INFO] Graph Nodes: {len(G.nodes())}, Edges: {len(G.edges())}")

with open(CLUSTER_FILE, encoding="utf-8") as f:
    cluster_data = json.load(f)

# Mapping function → service
func_to_service = {}
service_funcs = defaultdict(list)

for item in cluster_data:
    func = item.get("function")
    service = item.get("cluster_id")
    if func and service:
        clean_func = func.split("::")[-1] if "::" in func else func
        func_to_service[clean_func] = service
        service_funcs[service].append(clean_func)

# ==============================
# REMOVE GARBAGE SERVICES
# ==============================
garbage_keywords = [
    "export", "parse", "graph", "extractor", "tool", "test", "main", 
    "unassigned", "petclinicgraphextractor", "cacheconfiguration", 
    "semantic", "static", "file"
]

def is_business_service(name: str) -> bool:
    if not name or not name.endswith("Service"):
        return False
    lower = name.lower()
    if any(kw in lower for kw in garbage_keywords):
        return False
    # Remove very generic or too small names
    if len(name) < 10 and "service" in lower:
        return False
    return True

# ==============================
# BUILD DEPENDENCIES
# ==============================
service_edges = defaultdict(set)

for u, v, data in G.edges(data=True):
    if str(data.get("relation", "")).upper() in ["CALLS", "", "NONE"] or data.get("relation") is None:
        f1 = str(u).split("::")[-1] if "::" in str(u) else str(u)
        f2 = str(v).split("::")[-1] if "::" in str(v) else str(v)

        if f1 in func_to_service and f2 in func_to_service:
            s1 = func_to_service[f1]
            s2 = func_to_service[f2]
            if s1 != s2 and is_business_service(s1) and is_business_service(s2):
                service_edges[s1].add(s2)

# ==============================
# COMPUTE METRICS
# ==============================
result = {}

for s in list(service_funcs.keys()):
    if not is_business_service(s):
        continue

    Ce = len(service_edges.get(s, set()))
    Ca = sum(1 for x in service_funcs.keys() if is_business_service(x) and s in service_edges.get(x, set()))

    if Ca > 0 or Ce > 0:
        total = Ca + Ce
        instability = Ce / total if total > 0 else 0.0
        n = len(service_funcs.get(s, []))

        result[s] = {
            "Ca": int(Ca),
            "Ce": int(Ce),
            "Instability": round(instability, 3),
            "Cohesion": round(1.0 if n <= 1 else min(1.0, n / 5.0), 3),
            "Depends_On": sorted(service_edges.get(s, set())),
            "Function_Count": n
        }

# ==============================
# SAVE
# ==============================
os.makedirs(OUTPUT_FILE.parent, exist_ok=True)
with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
    json.dump(result, f, indent=2, ensure_ascii=False)

print(f"\n[SUCCESS] Business Services Saved: {len(result)}")
print("Saved at:", OUTPUT_FILE)

print("\nFinal Services:")
for s in sorted(result.keys()):
    print(f"  • {s}")