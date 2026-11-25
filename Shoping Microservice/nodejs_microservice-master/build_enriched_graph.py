# build_enriched_graph.py
import os
import json
import networkx as nx

# === 1. Paths ===
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

STATIC_JSON = os.path.join(BASE_DIR, "datasets", "graphs", "spring-petclinic", "semantic.json")
SEMANTIC_JSON = os.path.join(BASE_DIR, "datasets", "annotations", "spring_semantic_tags.json")
ENRICHED_DIR = os.path.join(BASE_DIR, "datasets", "graphs_enriched")
os.makedirs(ENRICHED_DIR, exist_ok=True)

OUT_GML = os.path.join(ENRICHED_DIR, "enriched_graph.gml")
OUT_GRAPHML = os.path.join(ENRICHED_DIR, "enriched_graph.graphml")
OUT_CYPHER = os.path.join(ENRICHED_DIR, "enriched_graph.cypher")

# === 2. Load semantic JSON (B1/B2 output) ===
with open(SEMANTIC_JSON, "r", encoding="utf-8") as f:
    semantic_data = json.load(f)

# === 3. Build enriched graph ===
G = nx.DiGraph()

seen_nodes = {}  # Duplicate-safe node labels

for func_name, data in semantic_data.items():
    # Add function node
    node_id = func_name
    if node_id in seen_nodes:
        node_id = f"{node_id}_{seen_nodes[node_id]}"
        seen_nodes[func_name] += 1
    else:
        seen_nodes[func_name] = 1

    G.add_node(node_id, label=data["label"], file=data["code"], type="function")

    # Add semantic role nodes
    for role in data.get("semantic_roles", []):
        role_id = f"{node_id}_{role['text']}"
        G.add_node(role_id,
                   text=role["text"],
                   lemma=role["lemma"],
                   pos=role["pos"],
                   dep=role["dep"],
                   type="semantic")
        G.add_edge(node_id, role_id, relation="semantic")

# === 4. Optionally add call edges if available in STATIC_JSON ===
with open(STATIC_JSON, "r", encoding="utf-8") as f:
    static_data = json.load(f)

for func in static_data.get("functions", []):
    src_name = func.get("name")
    if src_name not in seen_nodes:
        continue
    src_node = src_name if seen_nodes[src_name] == 1 else f"{src_name}_{seen_nodes[src_name]-1}"

    for callee in func.get("calls", []):
        if callee not in seen_nodes:
            continue
        tgt_node = callee if seen_nodes[callee] == 1 else f"{callee}_{seen_nodes[callee]-1}"
        G.add_edge(src_node, tgt_node, relation="call")

# === 5. Export graphs ===
nx.write_gml(G, OUT_GML)
nx.write_graphml(G, OUT_GRAPHML)

with open(OUT_CYPHER, "w", encoding="utf-8") as f:
    for node, attrs in G.nodes(data=True):
        label = attrs.get("label", attrs.get("text", ""))
        node_type = attrs.get("type", "Node")
        f.write(f"CREATE (:Node {{id:'{node}', type:'{node_type}', label:'{label}'}});\n")
    for u, v, attrs in G.edges(data=True):
        rel = attrs.get("relation", "RELATED")
        f.write(f"MATCH (a:Node {{id:'{u}'}}), (b:Node {{id:'{v}'}}) CREATE (a)-[:{rel}]->(b);\n")

print(f"✅ Enriched graph saved in: {ENRICHED_DIR}")
