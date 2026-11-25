# ============================================
# Story B4: Setup Ontology and Annotation Tools
# ============================================

import json
from pathlib import Path
from rdflib import Graph, Literal, RDF, RDFS, URIRef, Namespace

print("[B4] Ontology Generation STARTED", flush=True)

# ------------------------------------------------
# PATH CONFIG
# ------------------------------------------------
BASE_DIR = Path(__file__).resolve().parents[1]

ANNOTATIONS_DIR = BASE_DIR / "datasets" / "annotations"
ONTOLOGY_DIR = BASE_DIR / "datasets" / "ontologies"
ONTOLOGY_DIR.mkdir(parents=True, exist_ok=True)

SEMANTIC_JSON = ANNOTATIONS_DIR / "spring_semantic_tags.json"
ONTOLOGY_FILE = ONTOLOGY_DIR / "spring.owl"

if not SEMANTIC_JSON.exists():
    raise FileNotFoundError(f"Semantic JSON not found: {SEMANTIC_JSON}")

# ------------------------------------------------
# LOAD SEMANTIC TAGS
# ------------------------------------------------
with open(SEMANTIC_JSON, "r", encoding="utf-8") as f:
    semantic_tags = json.load(f)

print(f"[B4] Loaded {len(semantic_tags)} semantic nodes")

# ------------------------------------------------
# RDF / OWL GRAPH SETUP
# ------------------------------------------------
g = Graph()

EX = Namespace("http://petclinic.semantic.graph#")
g.bind("ex", EX)
g.bind("rdf", RDF)
g.bind("rdfs", RDFS)

# ------------------------------------------------
# DEFINE CLASSES
# ------------------------------------------------
g.add((EX.Function, RDF.type, RDFS.Class))
g.add((EX.DomainConcept, RDF.type, RDFS.Class))
g.add((EX.BusinessRole, RDF.type, RDFS.Class))
g.add((EX.APIEndpoint, RDF.type, RDFS.Class))
g.add((EX.CRUDIntent, RDF.type, RDFS.Class))

# ------------------------------------------------
# DEFINE PROPERTIES
# ------------------------------------------------
g.add((EX.hasDomainConcept, RDF.type, RDF.Property))
g.add((EX.hasBusinessRole, RDF.type, RDF.Property))
g.add((EX.hasCRUDIntent, RDF.type, RDF.Property))

# ------------------------------------------------
# CRUD INTENTS
# ------------------------------------------------
CRUD_INTENTS = ["Create", "Read", "Update", "Delete", "Process"]

for intent in CRUD_INTENTS:
    intent_uri = EX[intent]
    g.add((intent_uri, RDF.type, EX.CRUDIntent))

# ------------------------------------------------
# ADD FUNCTIONS, DOMAINS, ROLES
# ------------------------------------------------
for func_id, attrs in semantic_tags.items():

    domain = attrs.get("domain_entity") or "Unknown"
    role = attrs.get("business_role") or "Unknown"
    intent = attrs.get("intent")

    # ---- SAFE URIs (NO COLLISION) ----
    func_uri = EX[func_id.replace(".", "_")]
    domain_uri = EX[domain.replace(" ", "_")]
    role_uri = EX[role.replace(" ", "_")]

    # ---- Function Instance ----
    g.add((func_uri, RDF.type, EX.Function))
    g.add((func_uri, RDFS.label, Literal(func_id)))

    # ---- Domain Concept ----
    g.add((domain_uri, RDF.type, EX.DomainConcept))
    g.add((domain_uri, RDFS.label, Literal(domain)))

    # ---- Business Role ----
    g.add((role_uri, RDF.type, EX.BusinessRole))
    g.add((role_uri, RDFS.label, Literal(role)))

    # ---- Relationships ----
    g.add((func_uri, EX.hasDomainConcept, domain_uri))
    g.add((func_uri, EX.hasBusinessRole, role_uri))

    if intent:
        intent_uri = EX[intent]
        g.add((func_uri, EX.hasCRUDIntent, intent_uri))

# ------------------------------------------------
# EXAMPLE API ENDPOINT (OPTIONAL)
# ------------------------------------------------
example_api = EX["addPetEndpoint"]
g.add((example_api, RDF.type, EX.APIEndpoint))
g.add((example_api, EX.hasCRUDIntent, EX.Create))
g.add((example_api, RDFS.label, Literal("POST /owners/{ownerId}/pets")))

# ------------------------------------------------
# SAVE OWL FILE
# ------------------------------------------------
g.serialize(destination=str(ONTOLOGY_FILE), format="xml")

print("[B4] Ontology created successfully")
print("[B4] Output:", ONTOLOGY_FILE)
