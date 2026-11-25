import os
import json
import networkx as nx

print("🚀 Step B3: Build Semantic & Structural Graphs")

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

DATASETS_DIR = os.path.join(BASE_DIR, "datasets")
GRAPH_DIR = os.path.join(DATASETS_DIR, "graphs", "spring-petclinic")
ANNOTATION_DIR = os.path.join(DATASETS_DIR, "annotations")
ENRICHED_DIR = os.path.join(DATASETS_DIR, "enriched")

os.makedirs(ENRICHED_DIR, exist_ok=True)

STATIC_GRAPH_PATH = os.path.join(GRAPH_DIR, "static.gml")
SEMANTIC_JSON_PATH = os.path.join(ANNOTATION_DIR, "spring_semantic_tags.json")

OUTPUT_GRAPHML = os.path.join(ENRICHED_DIR, "semantic_enriched.graphml")
OUTPUT_GML = os.path.join(ENRICHED_DIR, "semantic_enriched.gml")
OUTPUT_JSON = os.path.join(ENRICHED_DIR, "semantic_enriched.json")
OUTPUT_CYPHER = os.path.join(ENRICHED_DIR, "semantic_enriched.cypher")


# =============================
# Load static graph
# =============================

G = nx.read_gml(STATIC_GRAPH_PATH)
print(f"📂 Static graph loaded: {len(G.nodes)} nodes, {len(G.edges)} edges")


# =============================
# Load semantic annotations
# =============================

with open(SEMANTIC_JSON_PATH, "r", encoding="utf-8") as f:
    semantic_data = json.load(f)

print(f"📘 Semantic JSON loaded: {len(semantic_data)} entries")


# =============================
# Enrich graph
# =============================

for node_id, sem in semantic_data.items():

    function_name = sem.get("function", node_id)

    intent = (sem.get("intent") or "").lower()
    domain = (sem.get("domain_entity") or "").lower()
    role = sem.get("business_role", "")
    named_entities = sem.get("named_entities", [])

    node = node_id if node_id in G else function_name

    if node not in G:
        G.add_node(node)

    # function attributes
    G.nodes[node]["label"] = function_name
    G.nodes[node]["node_type"] = "function"
    G.nodes[node]["function"] = function_name
    G.nodes[node]["intent"] = intent
    G.nodes[node]["domain_entity"] = domain
    G.nodes[node]["named_entities"] = json.dumps(named_entities)
    G.nodes[node]["business_role"] = role

    # Domain node
    if domain:

        if domain not in G:
            G.add_node(domain)

        G.nodes[domain]["node_type"] = "domain_entity"
        G.nodes[domain]["label"] = domain

        G.add_edge(node, domain, relation="RELATES_TO")

    # Action node
    if intent:

        if intent not in G:
            G.add_node(intent)

        G.nodes[intent]["node_type"] = "action"
        G.nodes[intent]["label"] = intent

        G.add_edge(node, intent, relation="PERFORMS")

        if domain:
            G.add_edge(domain, intent, relation="INVOLVES_ACTION")


print("🧠 Semantic relationships added")


# =============================
# GraphML safe conversion
# =============================

for node, data in G.nodes(data=True):
    for key, value in data.items():

        if value is None:
            G.nodes[node][key] = ""

        elif not isinstance(value, str):
            G.nodes[node][key] = json.dumps(value)


# =============================
# Save graphs
# =============================

nx.write_graphml(G, OUTPUT_GRAPHML)
nx.write_gml(G, OUTPUT_GML)


# =============================
# Save JSON
# =============================

graph_json = nx.node_link_data(G)

with open(OUTPUT_JSON, "w", encoding="utf-8") as f:
    json.dump(graph_json, f, indent=4)


# =============================
# Export Cypher for Neo4j
# =============================

with open(OUTPUT_CYPHER, "w", encoding="utf-8") as f:

    for node, data in G.nodes(data=True):

        label = data.get("node_type", "Node")

        f.write(f'MERGE (n:{label} {{id: "{node}"}});\n')

    for source, target, data in G.edges(data=True):

        rel = data.get("relation", "CALLS")

        f.write(
            f'MATCH (a {{id: "{source}"}}), (b {{id: "{target}"}}) '
            f'MERGE (a)-[:{rel}]->(b);\n'
        )


print("✅ Step B3 Completed Successfully")
print(f"📄 GraphML → {OUTPUT_GRAPHML}")
print(f"📄 GML     → {OUTPUT_GML}")
print(f"📄 JSON    → {OUTPUT_JSON}")
print(f"📄 Cypher  → {OUTPUT_CYPHER}")