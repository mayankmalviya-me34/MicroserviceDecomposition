# generate_ontology.py
import os
import json
from rdflib import Graph, Literal, RDF, RDFS, OWL, Namespace

# === 1. Paths ===
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
ANNOTATION_JSON = os.path.join(BASE_DIR, "datasets", "annotations", "spring_semantic_tags.json")
ONTOLOGY_DIR = os.path.join(BASE_DIR, "datasets", "ontologies")
os.makedirs(ONTOLOGY_DIR, exist_ok=True)
OUTPUT_OWL = os.path.join(ONTOLOGY_DIR, "spring.owl")

# === 2. Load semantic annotations (B2 output) ===
with open(ANNOTATION_JSON, "r", encoding="utf-8") as f:
    semantic_data = json.load(f)

# === 3. Define namespaces ===
EX = Namespace("http://example.com/shopic#")
g = Graph()
g.bind("ex", EX)
g.bind("owl", OWL)
g.bind("rdfs", RDFS)

# === 4. Add ontology classes ===
g.add((EX.Function, RDF.type, OWL.Class))
g.add((EX.DomainConcept, RDF.type, OWL.Class))
g.add((EX.SemanticRole, RDF.type, OWL.Class))
g.add((EX.CRUDIntent, RDF.type, OWL.Class))

# === 5. Map functions to domain concepts & roles ===
for func_name, data in semantic_data.items():
    func_uri = EX[func_name]
    g.add((func_uri, RDF.type, EX.Function))
    g.add((func_uri, RDFS.label, Literal(data.get("label", ""))))

    # Semantic roles
    for role in data.get("semantic_roles", []):
        role_uri = EX[f"{func_name}_{role['text']}"]
        g.add((role_uri, RDF.type, EX.SemanticRole))
        g.add((role_uri, RDFS.label, Literal(role["text"])))
        g.add((func_uri, EX.hasRole, role_uri))

    # Example: CRUD intent mapping
    label_lower = data.get("label", "").lower()
    if any(k in label_lower for k in ["get", "fetch", "read"]):
        intent = EX.Read
    elif any(k in label_lower for k in ["create", "add", "insert"]):
        intent = EX.Create
    elif any(k in label_lower for k in ["update", "modify", "edit"]):
        intent = EX.Update
    elif any(k in label_lower for k in ["delete", "remove"]):
        intent = EX.Delete
    else:
        intent = EX.Unknown

    g.add((intent, RDF.type, EX.CRUDIntent))
    g.add((func_uri, EX.hasIntent, intent))

# === 6. Save ontology ===
g.serialize(destination=OUTPUT_OWL, format="xml")
print(f"✅ Ontology generated! Saved at: {OUTPUT_OWL}")
