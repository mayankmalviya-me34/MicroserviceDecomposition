import os
import re
import json
import networkx as nx
import spacy

# =============================
# LOAD NLP MODEL
# =============================
nlp = spacy.load("en_core_web_sm")

# =============================
# PATH CONFIG
# =============================
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

STATIC_GRAPH = os.path.join(BASE_DIR, "datasets", "graphs", "spring-petclinic", "static.gml")
ANNOTATION_DIR = os.path.join(BASE_DIR, "datasets", "annotations")
os.makedirs(ANNOTATION_DIR, exist_ok=True)

OUT_JSON = os.path.join(ANNOTATION_DIR, "spring_semantic_tags.json")
OUT_GML = os.path.join(ANNOTATION_DIR, "spring_semantic_tags.gml")

# =============================
# UTIL FUNCTIONS
# =============================
CRUD_MAP = {
    "get": "Read", "find": "Read", "list": "Read", "show": "Read",
    "add": "Create", "create": "Create", "init": "Create", "register": "Create",
    "update": "Update", "set": "Update",
    "delete": "Delete", "remove": "Delete"
}

def split_identifier(name):
    return re.findall(r"[A-Z]?[a-z]+|[A-Z]+(?=[A-Z]|$)", name)

def infer_intent_domain(method_name):
    tokens = split_identifier(method_name)
    intent = None
    domain = None

    for t in tokens:
        low = t.lower()
        if not intent and low in CRUD_MAP:
            intent = CRUD_MAP[low]
        elif not domain and t[0].isupper():
            domain = t

    return intent, domain

def infer_business_role(intent, domain):
    if intent and domain:
        return f"{domain} {intent} Service"
    return "General Processing"

# =============================
# LOAD STATIC GRAPH
# =============================
print("📂 Loading static graph...")
G = nx.read_gml(STATIC_GRAPH)

semantic_json = {}

# =============================
# ANNOTATE NODES
# =============================
for node_id, attrs in G.nodes(data=True):
    label = attrs.get("label", node_id)

    # Extract function name from FQN
    function_name = label.split(".")[-1]

    intent, domain = infer_intent_domain(function_name)

    # Named entities via spaCy
    doc = nlp(function_name)
    named_entities = list(set(ent.text for ent in doc.ents))

    business_role = infer_business_role(intent, domain)

    # --- SAVE JSON ---
    semantic_json[node_id] = {
        "function": function_name,
        "intent": intent,
        "domain_entity": domain,
        "named_entities": named_entities,
        "business_role": business_role,
        "code": ""
    }

    # --- UPDATE GRAPH ATTRS ---
    G.nodes[node_id]["function"] = function_name
    G.nodes[node_id]["intent"] = intent or ""
    G.nodes[node_id]["domain_entity"] = domain or ""
    G.nodes[node_id]["named_entities"] = json.dumps(named_entities)
    G.nodes[node_id]["business_role"] = business_role
    G.nodes[node_id]["code"] = ""

# =============================
# SAVE OUTPUTS
# =============================
with open(OUT_JSON, "w", encoding="utf-8") as f:
    json.dump(semantic_json, f, indent=4)

nx.write_gml(G, OUT_GML)

print("✅ Story B2 completed")
print("→ JSON:", OUT_JSON)
print("→ GML :", OUT_GML)
