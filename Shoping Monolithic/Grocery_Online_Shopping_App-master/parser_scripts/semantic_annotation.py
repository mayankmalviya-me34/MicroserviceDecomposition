import os
import re
import json
import networkx as nx
import spacy

# =============================
# 1. Load spaCy
# =============================
nlp = spacy.load("en_core_web_sm")

# =============================
# 2. Directories
# =============================
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
GRAPH_DIR = os.path.join(BASE_DIR, "datasets", "graphs")
STATIC_GRAPH_GML = os.path.join(GRAPH_DIR, "static.gml")

ANNOTATION_DIR = os.path.join(BASE_DIR, "datasets", "annotations")
os.makedirs(ANNOTATION_DIR, exist_ok=True)

ANNOTATED_GML = os.path.join(ANNOTATION_DIR, "annotated.gml")
ANNOTATED_JSON = os.path.join(ANNOTATION_DIR, "annotated.json")


# =============================
# 3. Utility Functions
# =============================

def split_identifier(name):
    return re.findall(r"[A-Z]?[a-z]+|[A-Z]+(?=[A-Z]|$)", name)


def detect_intent(name):
    name = name.lower()
    if name.startswith(("get", "fetch", "find", "read")):
        return "READ"
    if name.startswith(("create", "add", "insert")):
        return "CREATE"
    if name.startswith(("update", "edit", "modify")):
        return "UPDATE"
    if name.startswith(("delete", "remove")):
        return "DELETE"
    return None


def detect_domain(name):
    tokens = split_identifier(name)
    if len(tokens) > 1:
        return tokens[-1].lower()
    return None


def detect_business_role(node_type, name):
    name_lower = name.lower()

    if "controller" in name_lower:
        return "CONTROLLER"
    if "service" in name_lower:
        return "SERVICE"
    if "repository" in name_lower or "dao" in name_lower:
        return "REPOSITORY"

    if node_type == "file":
        return "FILE"
    if node_type == "class":
        return "CLASS"
    if node_type == "method":
        return "METHOD"

    return "UNKNOWN"


def extract_named_entities(text):
    if not text:
        return []

    doc = nlp(text)
    entities = []

    for ent in doc.ents:
        entities.append({
            "text": ent.text,
            "label": ent.label_
        })

    return entities


# =============================
# 4. Load Graph
# =============================
def load_graph():
    if not os.path.exists(STATIC_GRAPH_GML):
        print("❌ static.gml not found.")
        return nx.DiGraph()

    print("Loading static.gml...")
    return nx.read_gml(STATIC_GRAPH_GML)


# =============================
# 5. Annotate Graph
# =============================
def annotate_graph(G):

    annotated_list = []

    for node_id, attrs in G.nodes(data=True):

        node_type = attrs.get("node_type", "")

        # ❌ Skip external nodes
        if node_type == "external":
            continue

        # ❌ Skip node_modules noise
        if "node_modules" in node_id:
            continue

        # ---------------- FILE NODE ----------------
        if node_type == "file":
            file_path = node_id
            function_name = os.path.basename(node_id)
            signature = ""

        # ---------------- CLASS NODE ----------------
        elif node_type == "class":
            parts = node_id.split("::")
            file_path = parts[0]
            function_name = parts[-1]
            signature = ""

        # ---------------- METHOD NODE ----------------
        elif node_type == "method":
            parts = node_id.split("::")
            file_path = parts[0]
            function_name = attrs.get("function_name", parts[-1])
            signature = attrs.get("signature", "")

        else:
            continue

        # ---------------- Semantic Extraction ----------------
        intent = detect_intent(function_name)
        domain = detect_domain(function_name)
        business_role = detect_business_role(node_type, function_name)
        named_entities = extract_named_entities(function_name)

        annotated_list.append({
            "file": file_path,
            "function": function_name,
            "business_role": business_role,
            "intent": intent,
            "domain_entity": domain,
            "named_entities": named_entities,
            "signature": signature
        })

        # Add attributes back to graph (GML safe)
        G.nodes[node_id]["intent"] = intent or ""
        G.nodes[node_id]["domain_entity"] = domain or ""
        G.nodes[node_id]["business_role"] = business_role
        G.nodes[node_id]["named_entities"] = json.dumps(named_entities)

    return annotated_list


# =============================
# 6. Main
# =============================
if __name__ == "__main__":

    G = load_graph()

    print("Annotating graph...")
    annotated_data = annotate_graph(G)

    # Make GML safe
    for node_id, attrs in G.nodes(data=True):
        for k, v in attrs.items():
            if v is None:
                G.nodes[node_id][k] = ""
            elif not isinstance(v, str):
                G.nodes[node_id][k] = json.dumps(v)

    print("Saving annotated GML...")
    nx.write_gml(G, ANNOTATED_GML)

    print("Saving annotated JSON...")
    with open(ANNOTATED_JSON, "w", encoding="utf-8") as f:
        json.dump(annotated_data, f, indent=4)

    print("✅ Semantic annotation complete!")