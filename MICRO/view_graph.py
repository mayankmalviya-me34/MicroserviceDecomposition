import json
import networkx as nx
import matplotlib.pyplot as plt
import os
from collections import defaultdict

JSON_PATH = "datasets/graphs/spring-petclinic/semantic.json"

with open(JSON_PATH, "r", encoding="utf-8") as f:
    data = json.load(f)

G = nx.DiGraph()

# ---------------------------------------
# 1️⃣ Extract Service Name from Path
# ---------------------------------------
def extract_service(path):
    # Example path:
    # .\spring-petclinic-api-gateway\src\main\...
    parts = path.replace("\\", "/").split("/")
    for part in parts:
        if "spring-petclinic" in part:
            return part
    return "unknown-service"

# ---------------------------------------
# 2️⃣ Add Nodes + Store Service Info
# ---------------------------------------
node_service = {}

for item in data:
    node = f"{item['class']}::{item['function']}"
    service = extract_service(item["source_file"])
    
    G.add_node(node)
    node_service[node] = service

# ---------------------------------------
# 3️⃣ Add Edges (Only if target exists)
# ---------------------------------------
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

# ---------------------------------------
# 4️⃣ Unique Services = Unique Colors
# ---------------------------------------
services = list(set(node_service.values()))
color_palette = [
    "red", "blue", "green", "orange", "purple",
    "brown", "cyan", "magenta", "yellow", "pink",
    "lime", "gold", "teal"
]

service_color = {
    service: color_palette[i % len(color_palette)]
    for i, service in enumerate(services)
}

# ---------------------------------------
# 5️⃣ Draw Graph
# ---------------------------------------
plt.figure(figsize=(20, 17))
pos = nx.spring_layout(G, k=0.9, iterations=80, seed=42)

for service in services:
    nodes_in_service = [
        node for node in G.nodes()
        if node_service[node] == service
    ]
    
    nx.draw_networkx_nodes(
        G,
        pos,
        nodelist=nodes_in_service,
        node_size=350,
        node_color=service_color[service],
        alpha=0.9,
        label=service
    )

nx.draw_networkx_edges(G, pos, alpha=0.25, arrows=False)

# Short labels
labels = {node: node.split("::")[-1] for node in G.nodes()}
nx.draw_networkx_labels(G, pos, labels, font_size=7)

plt.legend(fontsize=8)
plt.title("Microservices Semantic Call Graph (Service-wise Colored)", fontsize=16)
plt.axis("off")
plt.tight_layout()
plt.show()