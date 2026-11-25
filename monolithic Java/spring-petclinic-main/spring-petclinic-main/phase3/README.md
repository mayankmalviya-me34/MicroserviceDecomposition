# Phase 3 – LLM-Based Semantic Microservice Decomposition

## Overview

Phase 3 focuses on leveraging **LLM-inspired semantic reasoning** to support
**microservice boundary identification** from existing software systems.

This phase builds on the outputs of Phase 1 (Traditional Extraction) and Phase 2
(LLM / CodeT5+ Semantic Extraction) and consists of three sub-phases:

1. **Phase 3.1** – Semantic Annotation
2. **Phase 3.2** – Semantic Clustering & Boundary Suggestion
3. **Phase 3.3** – API–Domain Function Mapping

The implementation is **architecture-agnostic** and works for both:
- Monolithic Java applications
- Microservice-based Java applications

---

## Phase 3 Folder Structure

phase3/
├── llm_annotations/
│ └── llm_semantic_annotations.json
│
├── clusters/
│ └── llm_service_clusters.json
│
├── api_mapping/
│ ├── api_service_mapping.json
│ └── matching_report.json
│
├── plots/
│ └── umap_clusters.png
│
├── scripts/
│ ├── llm_annotate.py
│ ├── clustering.py
│ └── api_domain_mapping.py
│
└── README.md


---

## Phase 3.1 – LLM-Inspired Semantic Annotation

### Objective
Enrich extracted code elements (functions/classes) with high-level semantics:
- **Intent** (Create, Read, Update, Delete, Process)
- **Domain Entity**
- **Business Role**

### Inputs
- Traditional semantic annotations (Phase 1)
- CodeT5+ semantic annotations (Phase 2)

### Processing
- Symbolic and heuristic inference from function names
- No external LLM API calls
- Deterministic and reproducible

### Output
phase3/llm_annotations/llm_semantic_annotations.json


### Example
```json
{
  "function_fqn": "org.example.order.OrderService.createOrder",
  "intent": "Create",
  "domain_entity": "Order",
  "business_role": "Order Creation Service"
}
Phase 3.2 – Semantic Clustering & Boundary Suggestion
Objective
Group semantically related functions/classes into candidate microservice boundaries.

Tasks Performed
Build shared business vocabulary

Generate function embeddings using Sentence-BERT

Perform clustering using HDBSCAN (hierarchical clustering)

Assign service labels automatically

Optional visualization using UMAP

Tools Used
Sentence-BERT

HDBSCAN

UMAP

scikit-learn

Output
phase3/clusters/llm_service_clusters.json
Example
{
  "function": "processInvoice",
  "cluster_id": "BillingService",
  "business_role": "Invoice Processing"
}
Optional Visualization
phase3/plots/umap_clusters.png
Phase 3.3 – API–Domain Function Mapping
Objective
Align REST API endpoints with domain functions and service clusters so that
microservice boundaries reflect actual system interfaces.

Tasks Performed
Parse REST endpoints from Spring controllers
(Swagger/OpenAPI used when available)

Generate semantic representations of endpoints

Match endpoints to domain functions using cosine similarity

Infer CRUD operations from HTTP methods

Assign service clusters

Tools Used
Sentence-BERT

Cosine similarity

Regex-based controller parsing

Outputs
phase3/api_mapping/
├── api_service_mapping.json
└── matching_report.json
Example
{
  "endpoint": "/orders",
  "method": "POST",
  "business_role": "Order Placement",
  "cluster_id": "OrderService"
}
Why Phase 3 Matters
Traditional architectural artifacts (Swagger, UML, dependency graphs)
capture syntax and structure but lack business semantics.

Phase 3 bridges this gap by:

Enriching code with semantic intent

Identifying latent service boundaries

Aligning APIs with domain-driven microservices

This enables data-driven microservice decomposition from legacy systems.

Execution Order
Run scripts in the following order:

# Phase 3.1
python phase3/scripts/llm_annotate.py

# Phase 3.2
python phase3/scripts/clustering.py

# Phase 3.3
python phase3/scripts/api_domain_mapping.py