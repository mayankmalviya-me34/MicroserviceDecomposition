# generate_ontology_final.py

import os
import json
import re
from rdflib import Graph, Namespace, Literal
from rdflib.namespace import RDF, RDFS, OWL, XSD

# -------------------------------------------------
# PATH CONFIG
# -------------------------------------------------
BASE = r"F:\Main Project\monolithic Java\spring-petclinic-main\spring-petclinic-main\semantic-analysis"
PROJECT = "spring-petclinic"

ANNOT_JSON = os.path.join(BASE, "datasetsCodeT5+", "annotations", "spring_semantic_tags.json")

OUT_DIR = os.path.join(BASE, "datasetsCodeT5+", "ontologies")
os.makedirs(OUT_DIR, exist_ok=True)

OWL_OUT = os.path.join(OUT_DIR, f"{PROJECT}_semantic.owl")

# -------------------------------------------------
# NAMESPACE
# -------------------------------------------------
EX = Namespace("http://petclinic.semantic.graph#")

g = Graph()
g.bind("ex", EX)
g.bind("owl", OWL)
g.bind("rdf", RDF)
g.bind("rdfs", RDFS)

# -------------------------------------------------
# CORE CLASSES
# -------------------------------------------------
for cls in ["Function", "BusinessRole", "DomainConcept", "CRUDIntent", "NamedEntity"]:
    g.add((EX[cls], RDF.type, OWL.Class))

# -------------------------------------------------
# OBJECT PROPERTIES
# -------------------------------------------------
for prop in ["hasBusinessRole", "hasDomainConcept", "hasCRUDIntent", "mentionsEntity"]:
    g.add((EX[prop], RDF.type, OWL.ObjectProperty))

# -------------------------------------------------
# DATA PROPERTY
# -------------------------------------------------
g.add((EX["hasComment"], RDF.type, OWL.DatatypeProperty))
g.add((EX["hasComment"], RDFS.range, XSD.string))

# -------------------------------------------------
# LOAD ANNOTATIONS
# -------------------------------------------------
if not os.path.exists(ANNOT_JSON):
    raise FileNotFoundError("Annotation file not found!")

annotations = json.load(open(ANNOT_JSON, encoding="utf-8"))

# -------------------------------------------------
# CLEANING FUNCTIONS
# -------------------------------------------------

def clean_text(text):
    if not text:
        return None
    text = re.sub(r'\s+', ' ', text)
    text = text.replace("\n", " ").replace("\r", " ")
    return text.strip()

def safe_uri(text):
    text = clean_text(text)
    return re.sub(r'[^A-Za-z0-9_]', '_', text)

# To avoid duplicate instances
created_instances = set()

def create_instance(uri_name, class_type, label_text):
    if uri_name in created_instances:
        return EX[uri_name]
    uri = EX[uri_name]
    g.add((uri, RDF.type, class_type))
    g.add((uri, RDFS.label, Literal(label_text)))
    created_instances.add(uri_name)
    return uri

# -------------------------------------------------
# BUILD ONTOLOGY
# -------------------------------------------------

for ann in annotations:

    file_path = ann.get("file")
    function = ann.get("function")

    if not file_path or not function:
        continue

    # Full readable name
    full_name = file_path.replace("\\", ".").replace("/", ".")
    full_name = full_name.replace(".java", "")
    full_name = f"{full_name}.{function}"

    func_uri_name = safe_uri(full_name)
    func_uri = create_instance(func_uri_name, EX.Function, full_name)

    # ------------------------
    # Comments (ALL kept)
    # ------------------------
    comment = ann.get("comment")
    if comment:
        comment_clean = clean_text(comment)
        if comment_clean:
            g.add((func_uri, EX.hasComment, Literal(comment_clean)))

    # ------------------------
    # Domain Entity
    # ------------------------
    domain = ann.get("domain_entity")
    if domain:
        domain_clean = clean_text(domain)
        if domain_clean:
            dom_uri = create_instance(
                safe_uri(domain_clean),
                EX.DomainConcept,
                domain_clean
            )
            g.add((func_uri, EX.hasDomainConcept, dom_uri))

    # ------------------------
    # Business Role
    # ------------------------
    role = ann.get("business_role")
    if role:
        role_clean = clean_text(role)
        if role_clean:
            role_uri = create_instance(
                safe_uri(role_clean),
                EX.BusinessRole,
                role_clean
            )
            g.add((func_uri, EX.hasBusinessRole, role_uri))

    # ------------------------
    # CRUD Intent
    # ------------------------
    intent = ann.get("intent")
    if intent:
        intent_clean = clean_text(intent)
        if intent_clean:
            intent_uri = create_instance(
                safe_uri(intent_clean),
                EX.CRUDIntent,
                intent_clean
            )
            g.add((func_uri, EX.hasCRUDIntent, intent_uri))

    # ------------------------
    # Named Entities (ALL kept)
    # ------------------------
    for ne in ann.get("named_entities", []):
        text = ne.get("text")
        if text:
            text_clean = clean_text(text)
            if text_clean:
                ne_uri = create_instance(
                    safe_uri(text_clean),
                    EX.NamedEntity,
                    text_clean
                )
                g.add((func_uri, EX.mentionsEntity, ne_uri))

# -------------------------------------------------
# SAVE OWL
# -------------------------------------------------

g.serialize(destination=OWL_OUT, format="pretty-xml")

print("✅ FINAL CLEAN SEMANTIC OWL GENERATED")
print("Location:", OWL_OUT)