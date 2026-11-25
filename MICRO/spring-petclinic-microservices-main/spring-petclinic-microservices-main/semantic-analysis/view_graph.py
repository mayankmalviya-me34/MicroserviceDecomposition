import networkx as nx
import matplotlib.pyplot as plt
import os

G = nx.read_graphml(
    "datasetsCodeT5+/graphs/spring-petclinic/semantic.graphml"
)

print("Total Nodes:", G.number_of_nodes())
print("Total Edges:", G.number_of_edges())

components = list(nx.weakly_connected_components(G))
print("Total Components (Services):", len(components))

plt.figure(figsize=(16, 14))

pos = nx.spring_layout(G, k=0.8, iterations=60)

# Draw each component with different color
colors = ["red", "blue", "green", "orange", "purple",
          "brown", "cyan", "magenta", "yellow"]

for i, comp in enumerate(components):
    sub = G.subgraph(comp)
    nx.draw_networkx_nodes(
        G,
        pos,
        nodelist=sub.nodes(),
        node_size=250,
        node_color=colors[i % len(colors)],
        alpha=0.8
    )

# Draw edges
nx.draw_networkx_edges(G, pos, alpha=0.3, arrows=False)

# Show only short function names
labels = {}
for node in G.nodes():
    if "::" in node:
        name = node.split("::")[-1]
    else:
        name = os.path.basename(node)

    name = name.replace(".java", "")
    labels[node] = name

nx.draw_networkx_labels(G, pos, labels=labels, font_size=7)

plt.title("Microservices Semantic Graph (All Services Visible)")
plt.show()