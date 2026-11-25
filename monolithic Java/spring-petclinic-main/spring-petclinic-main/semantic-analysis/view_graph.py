import json
import networkx as nx
import matplotlib.pyplot as plt
import os

# ---- Load JSON instead of GraphML ----
with open("../datasets/graphs/spring-petclinic/semantics.json", "r", encoding="utf-8") as f:
    data = json.load(f)

# ---- Build Graph (same type as before) ----
G = nx.DiGraph()

# Add nodes
for item in data:
    node = f"{item['class']}::{item['function']}"
    G.add_node(node)

# Add edges
function_lookup = {
    item["function"]: f"{item['class']}::{item['function']}"
    for item in data
}

for item in data:
    caller = f"{item['class']}::{item['function']}"
    for called in item.get("calls", []):
        if called in function_lookup:
            callee = function_lookup[called]
            G.add_edge(caller, callee)

print("Nodes:", G.number_of_nodes())
print("Edges:", G.number_of_edges())
print("Graph Type:", type(G))

# ---- SAME component logic ----
largest_cc = max(nx.weakly_connected_components(G), key=len)
subG = G.subgraph(largest_cc).copy()

# ---- SAME label extraction ----
labels = {}

for node in subG.nodes():
    if "::" in node:
        func = node.split("::")[-1]
    else:
        func = os.path.basename(node)
    labels[node] = func

# ---- SAME plotting style ----
plt.figure(figsize=(14, 12))
pos = nx.spring_layout(subG, k=0.6, iterations=50)

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
    labels=labels,
    font_size=8
)

plt.title("Semantic Graph (Function Names Only)")
plt.show()