import json
import networkx as nx
import os

# =============================
# PATH CONFIG
# =============================
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

ANNOTATION_DIR = os.path.join(BASE_DIR, "datasets", "annotations")
ENRICHED_DIR = os.path.join(BASE_DIR, "datasets", "enriched")
os.makedirs(ENRICHED_DIR, exist_ok=True)

SEMANTIC_GML = os.path.join(ANNOTATION_DIR, "spring_semantic_tags.gml")
SEMANTIC_JSON = os.path.join(ANNOTATION_DIR, "spring_semantic_tags.json")

OUT_GML = os.path.join(ENRICHED_DIR, "semantic_enriched.gml")
OUT_GRAPHML = os.path.join(ENRICHED_DIR, "semantic_enriched.graphml")

# =============================
# LOAD FILES
# =============================
print("📂 Loading semantic graph...")
G = nx.read_gml(SEMANTIC_GML)

with open(SEMANTIC_JSON, "r", encoding="utf-8") as f:
    semantic_data = json.load(f)

# =============================
# INJECT SEMANTICS
# =============================
updated = 0
for node, attrs in G.nodes(data=True):
    if node in semantic_data:
        data = semantic_data[node]
        attrs["function"] = data["function"]
        attrs["intent"] = data["intent"] or ""
        attrs["domain_entity"] = data["domain_entity"] or ""
        attrs["business_role"] = data["business_role"]
        attrs["named_entities"] = json.dumps(data["named_entities"])
        attrs["code"] = data["code"]
        updated += 1

print(f"✅ Injected semantic data into {updated} nodes")

# =============================
# SAVE ENRICHED GRAPHS
# =============================
nx.write_gml(G, OUT_GML)
nx.write_graphml(G, OUT_GRAPHML)

print("💾 Enriched graphs saved:")
print("→", OUT_GML)
print("→", OUT_GRAPHML)
