import os
import re
import json
import networkx as nx
import spacy

print("🚀 Step B2: Semantic Annotation Started")

# =============================
# 1. Load spaCy
# =============================
try:
    nlp = spacy.load("en_core_web_sm")
except:
    raise RuntimeError("❌ spaCy model not found. Run: python -m spacy download en_core_web_sm")

# =============================
# 2. Project Paths
# =============================
PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))
DATASETS_DIR = os.path.join(PROJECT_ROOT, "datasets")

GRAPH_DIR = os.path.join(DATASETS_DIR, "graphs", "spring-petclinic")
STATIC_GRAPH_GML = os.path.join(GRAPH_DIR, "static.gml")

ANNOTATION_DIR = os.path.join(DATASETS_DIR, "annotations")
os.makedirs(ANNOTATION_DIR, exist_ok=True)

ANNOTATED_GML = os.path.join(ANNOTATION_DIR, "spring_semantic_tags.gml")
ANNOTATED_JSON = os.path.join(ANNOTATION_DIR, "spring_semantic_tags.json")
ANNOTATED_GRAPHML = os.path.join(ANNOTATION_DIR, "spring_semantic_tags.graphml")

print("📂 Static graph path:", STATIC_GRAPH_GML)

# =============================
# 3. NLP Utilities
# =============================

def split_identifier(name):
    """Split camelCase / PascalCase identifiers"""
    if not name:
        return []
    name = name.replace("_", " ")
    return re.findall(r'[A-Z](?:[a-z]+)|[A-Z]+(?=[A-Z]|$)|[a-z]+', name)


def normalize_for_nlp(name):
    """Convert method name to NLP friendly text"""
    short = name.split(".")[-1]
    words = split_identifier(short)
    return " ".join(words)


def extract_intent_domain(text):
    """Extract intent (verb) and domain entity"""
    if not text:
        return None, None

    doc = nlp(text)

    intent = None
    domain = None

    # intent = first verb
    for token in doc:
        if token.pos_ == "VERB":
            intent = token.lemma_.lower()
            break

    # domain = first noun
    for token in doc:
        if token.pos_ in ("NOUN", "PROPN"):
            domain = token.lemma_.lower()
            break

    return intent, domain


def extract_named_entities(text):
    """Extract domain entities from identifier"""
    if not text:
        return []

    doc = nlp(text)
    entities = set()

    for token in doc:
        if token.pos_ in ("NOUN", "PROPN"):
            entities.add(token.lemma_.lower())

    return sorted(entities)


def auto_detect_business_role(function_name):
    """Detect architectural layer"""
    lower = function_name.lower()

    if "controller" in lower or "web" in lower or "resource" in lower:
        return "API Layer"

    if "service" in lower or "client" in lower:
        return "Business Logic Layer"

    if "repository" in lower or "dao" in lower:
        return "Data Access Layer"

    if "config" in lower:
        return "Configuration Layer"

    if "model" in lower or "entity" in lower:
        return "Domain Model"

    return "Domain Logic"


# =============================
# 4. Load Graph
# =============================
if not os.path.exists(STATIC_GRAPH_GML):
    raise FileNotFoundError(f"❌ static.gml not found at: {STATIC_GRAPH_GML}")

print("📂 Loading static graph...")

# label=None avoids tokenizer errors
G = nx.read_gml(STATIC_GRAPH_GML, label="label")

print(f"✅ Graph loaded | Nodes: {len(G.nodes)} | Edges: {len(G.edges)}")

# =============================
# 5. Semantic Annotation
# =============================

semantic_json = {}

for node_id, attrs in G.nodes(data=True):

    function_name = attrs.get("label") or str(node_id)
    short_name = function_name.split(".")[-1]

    comment = attrs.get("comment") or ""

    normalized_text = normalize_for_nlp(short_name)

    intent, domain = extract_intent_domain(normalized_text)
    named_entities = extract_named_entities(normalized_text + " " + comment)

    business_role = auto_detect_business_role(function_name)

    # Graph attributes
    G.nodes[node_id]["function"] = short_name
    G.nodes[node_id]["intent"] = intent or ""
    G.nodes[node_id]["domain_entity"] = domain or ""
    G.nodes[node_id]["named_entities"] = ",".join(named_entities)
    G.nodes[node_id]["business_role"] = business_role

    semantic_json[node_id] = {
        "function": short_name,
        "intent": intent,
        "domain_entity": domain,
        "named_entities": named_entities,
        "business_role": business_role,

    }

print("🧠 Semantic enrichment completed")

# =============================
# 6. Write Outputs
# =============================

print("💾 Writing GML:", ANNOTATED_GML)
nx.write_gml(G, ANNOTATED_GML)

print("💾 Writing GraphML:", ANNOTATED_GRAPHML)
nx.write_graphml(G, ANNOTATED_GRAPHML)

print("💾 Writing JSON:", ANNOTATED_JSON)

with open(ANNOTATED_JSON, "w", encoding="utf-8") as f:
    json.dump(semantic_json, f, indent=4)

print("✅ Step B2 completed successfully")