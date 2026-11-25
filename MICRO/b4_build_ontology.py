# b4_build_ontology.py
import json
import pathlib
from rdflib import Graph, Namespace, RDF, RDFS, Literal, OWL
from rdflib.namespace import XSD

print("🚀 Building HYBRID PetClinic Ontology (Tumhara + Friend ka Best Features)")

# ====================== TUMHARA ORIGINAL PATHS ======================
ROOT = pathlib.Path.cwd()
ANNOTATION_DIR = ROOT / "datasets" / "annotations"
ONT_DIR = ROOT / "datasets" / "ontologies"
ONT_DIR.mkdir(parents=True, exist_ok=True)

INPUT_JSON = ANNOTATION_DIR / "spring_semantic_tags.json"
OUT_TTL = ONT_DIR / "spring1.ttl"
OUT_OWL = ONT_DIR / "spring1.owl"

if not INPUT_JSON.exists():
    print(f"❌ File nahi mila: {INPUT_JSON}")
    raise SystemExit(1)

with open(INPUT_JSON, "r", encoding="utf-8") as f:
    data = json.load(f)          # ← Yeh dict hai {func: entry}

print(f"🧠 Loaded {len(data)} semantic entries for microservice decomposition")

# ====================== NAMESPACE ======================
EX = Namespace("http://petclinic.semantic.graph#")
g = Graph()
g.bind("ex", EX)
g.bind("owl", OWL)
g.bind("rdfs", RDFS)
g.bind("xsd", XSD)

# ====================== ONTOLOGY HEADER ======================
g.add((EX[""], RDF.type, OWL.Ontology))
g.add((EX[""], RDFS.label, Literal("PetClinic Hybrid Ontology - Microservice Decomposition")))

# ====================== CLASSES ======================
g.add((EX.Function, RDF.type, OWL.Class))
g.add((EX.Function, RDFS.label, Literal("Function")))

g.add((EX.DomainConcept, RDF.type, OWL.Class))
g.add((EX.BusinessRole, RDF.type, OWL.Class))
g.add((EX.CRUDIntent, RDF.type, OWL.Class))

# ====================== DYNAMIC DOMAIN CONCEPTS ======================
domain_entities = {entry.get("domain_entity") or "GenericEntity" 
                   for entry in data.values()}   # ← .values() important!

for ent in sorted(domain_entities):
    ent_uri = EX[ent.replace(" ", "_").replace("-", "_")]
    g.add((ent_uri, RDF.type, OWL.Class))
    g.add((ent_uri, RDFS.label, Literal(ent)))

# ====================== OBJECT PROPERTIES ======================
hasDomainConcept = EX.hasDomainConcept
g.add((hasDomainConcept, RDF.type, OWL.ObjectProperty))
g.add((hasDomainConcept, RDFS.label, Literal("hasDomainConcept")))
g.add((hasDomainConcept, RDFS.domain, EX.Function))
g.add((hasDomainConcept, RDFS.range, EX.DomainConcept))

hasBusinessRole = EX.hasBusinessRole
g.add((hasBusinessRole, RDF.type, OWL.ObjectProperty))
g.add((hasBusinessRole, RDFS.label, Literal("hasBusinessRole")))
g.add((hasBusinessRole, RDFS.domain, EX.Function))
g.add((hasBusinessRole, RDFS.range, EX.BusinessRole))

hasCRUDIntent = EX.hasCRUDIntent
g.add((hasCRUDIntent, RDF.type, OWL.ObjectProperty))
g.add((hasCRUDIntent, RDFS.label, Literal("hasCRUDIntent")))
g.add((hasCRUDIntent, RDFS.domain, EX.Function))
g.add((hasCRUDIntent, RDFS.range, EX.CRUDIntent))

# ====================== DATATYPE PROPERTIES ======================
data_props = {
    "businessRole": XSD.string,
    "intent": XSD.string,
    "httpMethod": XSD.string,
    "route": XSD.string,
    "sourceFile": XSD.string
}
for pname, ptype in data_props.items():
    p_uri = EX[pname]
    g.add((p_uri, RDF.type, OWL.DatatypeProperty))
    g.add((p_uri, RDFS.label, Literal(pname)))
    g.add((p_uri, RDFS.domain, EX.Function))
    g.add((p_uri, RDFS.range, ptype))

# ====================== HELPER ======================
def safe_name(name: str) -> str:
    return "".join(c if c.isalnum() else "_" for c in str(name).strip())

# ====================== BUILD FUNCTIONS ======================
for func_full, entry in data.items():          # ← Yeh line sabse important fix hai
    safe_func = safe_name(func_full)
    func_uri = EX[f"fn_{safe_func}"]

    g.add((func_uri, RDF.type, EX.Function))
    g.add((func_uri, RDFS.label, Literal(func_full)))

    # Core mapping
    domain = entry.get("domain_entity") or "GenericEntity"
    domain_uri = EX[safe_name(domain)]
    g.add((func_uri, hasDomainConcept, domain_uri))

    # Business Role
    role = entry.get("business_role") or entry.get("businessRole")
    if role and role != "General Processing":
        role_uri = EX[safe_name(role)]
        g.add((role_uri, RDF.type, EX.BusinessRole))
        g.add((role_uri, RDFS.label, Literal(role.replace("_", " "))))
        g.add((func_uri, hasBusinessRole, role_uri))

    # CRUD Intent
    intent = entry.get("intent")
    if intent in {"Create", "Read", "Update", "Delete"}:
        crud_uri = EX[intent]
        g.add((crud_uri, RDF.type, EX.CRUDIntent))
        g.add((crud_uri, RDFS.label, Literal(intent)))
        g.add((func_uri, hasCRUDIntent, crud_uri))

    # Extra datatype properties
    for pname in data_props.keys():
        val = None
        if pname == "businessRole":
            val = entry.get("business_role") or entry.get("businessRole")
        elif pname == "intent":
            val = entry.get("intent")
        elif pname == "httpMethod":
            val = entry.get("http_method") or entry.get("httpMethod")
        elif pname == "route":
            val = entry.get("route")
        elif pname == "sourceFile":
            val = entry.get("source_file") or entry.get("sourceFile")
        if val:
            g.add((func_uri, EX[pname], Literal(str(val), datatype=XSD.string)))

# ====================== SAVE ======================
g.serialize(destination=str(OUT_TTL), format="turtle")
g.serialize(destination=str(OUT_OWL), format="xml")

print("🎉 HYBRID ONTOLOGY READY FOR MICROSERVICE DECOMPOSITION!")
print(f"   📄 Turtle  → {OUT_TTL}")
print(f"   📄 RDF/XML → {OUT_OWL}")
print(f"   Total Functions     : {len(data)}")
print(f"   Domain Concepts     : {len(domain_entities)}")
print("\n🔥 Ab ise Protégé mein kholo → Graph clean aayega!")