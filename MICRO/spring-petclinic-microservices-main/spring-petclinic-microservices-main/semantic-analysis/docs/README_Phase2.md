README.md

Graph-Based Semantic Embedding & Visualization for Microservice Decomposition

📌 Project Overview

This project builds static, API, and semantic graphs from a monolithic Java application (Spring Petclinic) and enriches them with ontology-based semantic information and node embeddings.

The generated graph representations are designed for ML / GNN-based microservice decomposition, clustering, and architectural analysis.

🎯 Motivation

Modern monolithic applications are difficult to decompose into microservices due to:

Tight coupling between classes and methods

Hidden domain semantics

Implicit responsibilities

This project converts structural + semantic code information into graph-based representations, enabling:

Graph Neural Networks (GNNs)

Clustering & community detection

Reinforcement learning–based service extraction

🧠 Research Goals

As a research assistant,
I want to build static and semantic graphs,
So that they can be used for ML/GNN-based microservice decomposition later.

🧩 What This System Builds
1️⃣ Static Code Graph

Represents the structure of the codebase

Nodes

Files

Classes

Methods

Method calls

Edges

contains (file → class / method)

defines (class → method)

calls (method → method)

📁 Output:

/graphs/static.gml

2️⃣ API Call Graph

Represents REST endpoints mapped to business functions

Nodes

API endpoints (HTTP method + path)

Functions (controller/service operations)

Edges

maps_to (endpoint → function)

📁 Output:

/graphs/api.graphml

3️⃣ Semantic Graph

Represents semantic meaning of the code

Nodes

Functions

Ontology concepts (domain entities)

Summaries / responsibilities

Edges

mapsTo (function → ontology concept)

hasSummary (function → semantic description)

📁 Output:

/graphs/semantic.graphml

4️⃣ Ontology (OWL/RDF)

Domain ontology extracted from:

Class names

Comments

NLP noun extraction

API semantics

Used to connect code → domain meaning

📁 Output:

/ontologies/spring-petclinic.owl
/ontologies/code_to_ontology.ttl

5️⃣ Combined Graph

All graphs merged into a single heterogeneous graph

📁 Output:

/graphs/graphs.json


Used for:

Visualization

Neo4j import

ML pipelines

6️⃣ Node Embeddings

Each node is converted into a dense semantic vector using a Transformer model.

Model: sentence-transformers/all-MiniLM-L6-v2

Mean pooling over token embeddings

GPU optional (CPU supported)

📁 Output:

/embeddings/node_embeddings.npy
/embeddings/node_index.json

7️⃣ Neo4j Export

Graph exported as CSV files for Neo4j & Bloom visualization.

📁 Output:

/neo4j/nodes.csv
/neo4j/rels.csv

🧰 Tools & Technologies
Graph Construction

NetworkX

RDFLib

PyDriller (optional extension)

Semantic Processing

NLP-based annotations

OWL / RDF ontology modeling

Graph Learning

PyTorch

Sentence Transformers

(Future) PyTorch Geometric (PyG), DGL

Visualization

GraphML (Cytoscape)

GML (GraphViz)

Neo4j Bloom

📂 Project Structure
semantic-analysis/
│
├── generate_ontology.py
├── generate_graphs.py
│
├── datasetsCodeT5+/
│   ├── graphs/
│   │   └── spring-petclinic/
│   │       ├── semantic.json
│   │       ├── api_semantic.json
│   │       ├── static.gml
│   │       ├── semantic.graphml
│   │       ├── api.graphml
│   │       └── graphs.json
│   │
│   ├── ontologies/
│   │   ├── spring-petclinic.owl
│   │   └── code_to_ontology.ttl
│   │
│   ├── embeddings/
│   │   ├── node_embeddings.npy
│   │   └── node_index.json
│   │
│   └── neo4j/
│       ├── nodes.csv
│       └── rels.csv

⚙️ Installation
pip install networkx rdflib numpy tqdm
pip install sentence-transformers transformers torch


(Optional CPU-only Torch)

pip install torch --index-url https://download.pytorch.org/whl/cpu

▶️ How to Run
Step 1: Generate Ontology
python semantic-analysis/generate_ontology.py

Step 2: Generate Graphs & Embeddings
python semantic-analysis/generate_graphs.py

📊 Visualization Options
GraphViz
dot -Tpng static.gml -o static.png

Cytoscape

Import semantic.graphml

Use layout: Prefuse Force Directed

Neo4j
LOAD CSV WITH HEADERS FROM 'file:///nodes.csv' AS row
CREATE (:Node {id: row.id, label: row.label, type: row.type});

🔍 Querying the Graphs
SPARQL (Ontology)
SELECT ?func ?entity WHERE {
  ?func voc:actsOnEntity ?entity .
}

Graph Queries

Identify highly connected classes

Detect semantic clusters

Extract service candidates

🧪 ML / GNN Readiness

The output graphs can directly be used for:

Node classification

Graph clustering

Service boundary detection

Reinforcement learning–based refactoring

Future extensions:

Convert to PyG HeteroData

Add edge weights

Train GNN for microservice prediction

🏁 Deliverables Checklist

✅ Static code graph
✅ API call graph
✅ Semantic ontology graph
✅ Node & edge embeddings
✅ Neo4j-ready CSVs
✅ Visualization-friendly formats
✅ Research-grade documentation

📌 Conclusion

This project bridges software architecture, semantic analysis, and graph learning, providing a strong foundation for automated microservice decomposition research.