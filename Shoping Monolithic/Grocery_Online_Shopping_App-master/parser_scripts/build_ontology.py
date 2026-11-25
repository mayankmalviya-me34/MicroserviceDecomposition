import os
import json
from rdflib import Graph, Namespace, URIRef, RDF, RDFS

# ----------------------------
# Absolute paths for your setup
# ----------------------------
DATASETS_DIR = r"F:\Main Project\Shoping Monolithic\Grocery_Online_Shopping_App-master\datasets"
SEMANTIC_JSON = os.path.join(DATASETS_DIR, "spring_semantic_tags.json")
ONTOLOGY_DIR = os.path.join(DATASETS_DIR, "ontologies")
os.makedirs(ONTOLOGY_DIR, exist_ok=True)
print(f"Ontology directory will be created at: {ONTOLOGY_DIR}")
OUT_OWL = os.path.join(ONTOLOGY_DIR, "spring.owl")

# ----------------------------
# Example semantic JSON (if file doesn't exist)
# ----------------------------
example_semantic_data = {
    "placeOrder": {"semantic_roles": [{"lemma_": "order"}, {"lemma_": "customer"}]},
    "listOrders": {"semantic_roles": [{"lemma_": "order"}]},
    "updateOrder": {"semantic_roles": [{"lemma_": "order"}]},
    "cancelOrder": {"semantic_roles": [{"lemma_": "order"}]},
    "listCustomers": {"semantic_roles": [{"lemma_": "customer"}]}
}

if not os.path.exists(SEMANTIC_JSON):
    with open(SEMANTIC_JSON, "w", encoding="utf-8") as f:
        json.dump(example_semantic_data, f, indent=2)
    print(f"Example semantic JSON created at: {SEMANTIC_JSON}")

# ----------------------------
# Load semantic annotations
# ----------------------------
def load_semantic_annotations():
    with open(SEMANTIC_JSON, "r", encoding="utf-8") as f:
        return json.load(f)

# ----------------------------
# Build ontology
# ----------------------------
def build_ontology(semantic_data):
    g = Graph()
    NS = Namespace("http://example.org/ontology#")
    g.bind("ex", NS)
    g.bind("rdf", RDF)
    g.bind("rdfs", RDFS)

    # Classes
    for cls in ["Function", "DomainConcept", "APIEndpoint", "CRUDIntent"]:
        g.add((NS[cls], RDF.type, RDFS.Class))

    # Properties
    for prop in ["implements", "hasIntent"]:
        g.add((NS[prop], RDF.type, RDF.Property))

    # Functions & DomainConcepts
    for func_id, data in semantic_data.items():
        func_uri = URIRef(NS + func_id)
        g.add((func_uri, RDF.type, NS.Function))
        for role in data.get("semantic_roles", []):
            concept_uri = URIRef(NS + role["lemma_"].capitalize())
            g.add((concept_uri, RDF.type, NS.DomainConcept))
            g.add((func_uri, NS.implements, concept_uri))

    # Predefine CRUDIntent individuals
    crud_intents = ["Create", "Read", "Update", "Delete"]
    for intent in crud_intents:
        g.add((NS[intent], RDF.type, NS.CRUDIntent))

    # API endpoints & CRUD mapping
    api_crud_mapping = {
        "/api/products": [("GET", "Read"), ("POST", "Create")],
        "/api/orders": [("DELETE", "Delete")],
        "/api/customers": [("GET", "Read")]
    }

    for path, methods in api_crud_mapping.items():
        endpoint_uri = URIRef(NS + path.strip("/").replace("/", "_"))
        g.add((endpoint_uri, RDF.type, NS.APIEndpoint))
        for method, intent_name in methods:
            g.add((endpoint_uri, NS.hasIntent, NS[intent_name]))

    return g

# ----------------------------
# Export ontology
# ----------------------------
def export_ontology(g):
    g.serialize(destination=OUT_OWL, format="xml")
    print(f"✅ Ontology saved at: {OUT_OWL}")

# ----------------------------
# Main
# ----------------------------
if __name__ == "__main__":
    semantic_data = load_semantic_annotations()
    ontology_graph = build_ontology(semantic_data)
    export_ontology(ontology_graph)
