import os
import json
import networkx as nx

# Base project directory
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Input graph files
STATIC_GML = os.path.join(BASE_DIR, "datasets", "graphs", "static.gml")
SEMANTIC_JSON = os.path.join(BASE_DIR, "datasets", "annotations", "spring_semantic_tags.json")

# Output enriched graph directory
ENRICHED_DIR = os.path.join(BASE_DIR, "datasets", "graphs_enriched")
os.makedirs(ENRICHED_DIR, exist_ok=True)

OUT_GML = os.path.join(ENRICHED_DIR, "enriched_graph.gml")
OUT_GRAPHML = os.path.join(ENRICHED_DIR, "enriched_graph.graphml")
OUT_CYPHER = os.path.join(ENRICHED_DIR, "enriched_graph.cypher")


def load_static_graph():
    """Load static structural graph (from B1)"""
    if not os.path.exists(STATIC_GML):
        raise FileNotFoundError(f"Static graph not found: {STATIC_GML}")
    return nx.read_gml(STATIC_GML)


def load_semantic_annotations():
    """Load semantic roles (from B2)"""
    if not os.path.exists(SEMANTIC_JSON):
        raise FileNotFoundError(f"Semantic JSON not found: {SEMANTIC_JSON}")
    with open(SEMANTIC_JSON, "r", encoding="utf-8") as f:
        return json.load(f)


def build_enriched_graph(static_graph, semantic_data):
    """Combine static + semantic graphs into enriched graph"""
    G = nx.DiGraph()

    # Add static nodes + edges
    for node, attrs in static_graph.nodes(data=True):
        G.add_node(node, **attrs, type="static")

    for u, v in static_graph.edges():
        G.add_edge(u, v, relation="structural")

    # Add semantic roles as new nodes + edges
    for node_id, data in semantic_data.items():
        function_label = data.get("label", "")
        semantic_roles = data.get("semantic_roles", [])

        for role in semantic_roles:
            role_node = f"{node_id}_{role['text']}"
            G.add_node(role_node,
                       text=role["text"],
                       lemma=role["lemma_"],
                       pos=role["pos"],
                       dep=role["dep"],
                       type="semantic")

            # Connect function → semantic role
            G.add_edge(node_id, role_node, relation="semantic")

    return G


def export_graphs(G):
    """Save graph in multiple formats"""
    # Save GML
    nx.write_gml(G, OUT_GML)

    # Save GraphML
    nx.write_graphml(G, OUT_GRAPHML)

    # Save Cypher script for Neo4j
    with open(OUT_CYPHER, "w", encoding="utf-8") as f:
        for node, attrs in G.nodes(data=True):
            f.write(f"CREATE (:Node {{id:'{node}', type:'{attrs.get('type','')}', label:'{attrs.get('text','')}'}});\n")

        for u, v, attrs in G.edges(data=True):
            f.write(f"MATCH (a:Node {{id:'{u}'}}), (b:Node {{id:'{v}'}}) "
                    f"CREATE (a)-[:{attrs.get('relation','RELATED')}]->(b);\n")


if __name__ == "__main__":
    print("Loading static + semantic data...")
    static_graph = load_static_graph()
    semantic_data = load_semantic_annotations()

    print("Building enriched graph...")
    enriched_graph = build_enriched_graph(static_graph, semantic_data)

    print("Exporting graphs (GML, GraphML, Cypher)...")
    export_graphs(enriched_graph)

    print(f"✅ Enriched graph saved in: {ENRICHED_DIR}")
