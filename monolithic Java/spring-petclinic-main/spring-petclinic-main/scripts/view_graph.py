import json
import networkx as nx
import matplotlib.pyplot as plt

JSON_PATH = "../datasets/graphs/spring-petclinic/semantics.json"

with open(JSON_PATH, "r", encoding="utf-8") as f:
    data = json.load(f)

# 🔥 Use MultiDiGraph like GraphML often does
G = nx.DiGraph()

# ---- Add nodes with UNIQUE ID (same as LLM) ----
for item in data:
    node = f"{item['class']}::{item['function']}"
    G.add_node(node)

# ---- Add edges without collapsing names ----
function_lookup = {
    (item["class"], item["function"]): f"{item['class']}::{item['function']}"
    for item in data
}

for item in data:
    caller = f"{item['class']}::{item['function']}"
    for called in item.get("calls", []):
        # match by function name only if unique
        for (cls, func), full_name in function_lookup.items():
            if func == called:
                G.add_edge(caller, full_name)

print("Nodes:", G.number_of_nodes())
print("Edges:", G.number_of_edges())

# ---- SAME component logic as LLM ----
largest_cc = max(nx.weakly_connected_components(G), key=len)
subG = G.subgraph(largest_cc).copy()

# ---- Same label extraction ----
labels = {}
for node in subG.nodes():
    labels[node] = node.split("::")[-1]

plt.figure(figsize=(14, 12))

pos = nx.spring_layout(
    subG,
    k=0.6,
    iterations=50,
    seed=42
)

nx.draw(
    subG,
    pos,
    with_labels=False,
    node_size=300,
    alpha=0.8,
    arrows=False
)

nx.draw_networkx_labels(
    subG,
    pos,
    labels,
    font_size=8
)

plt.title("Semantic Graph (JSON – LLM Style)")
plt.axis("off")
plt.show()