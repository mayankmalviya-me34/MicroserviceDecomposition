import os
import re
import json
import spacy
import networkx as nx

# ---------------------------------------------
# CONFIG
# ---------------------------------------------
PROJECT_PATH = "../"
OUTPUT_DIR = "datasetsCodeT5+/annotations/"
OUTPUT_JSON = OUTPUT_DIR + "spring_semantic_tags.json"
OUTPUT_GML = OUTPUT_DIR + "semantic_graph.gml"
OUTPUT_GRAPHML = OUTPUT_DIR + "semantic_graph.graphml"

os.makedirs(OUTPUT_DIR, exist_ok=True)

nlp = spacy.load("en_core_web_sm")

# ---------------------------------------------
# Helper: Remove License Comments
# ---------------------------------------------
def is_license_comment(text):
    return "apache.org/licenses" in text.lower() or "copyright" in text.lower()

# ---------------------------------------------
# Detect Business Role
# ---------------------------------------------
def detect_business_role(file_path, code):
    file_lower = file_path.lower()

    # Annotation based detection (Spring specific)
    if "@controller" in code.lower() or "@restcontroller" in code.lower():
        return "CONTROLLER"
    elif "@service" in code.lower():
        return "SERVICE"
    elif "@repository" in code.lower():
        return "REPOSITORY"
    elif "@component" in code.lower():
        return "COMPONENT"

    # Folder / filename based detection
    elif "controller" in file_lower:
        return "CONTROLLER"
    elif "service" in file_lower:
        return "SERVICE"
    elif "repository" in file_lower:
        return "REPOSITORY"
    elif "model" in file_lower or "entity" in file_lower:
        return "ENTITY"
    elif "application" in file_lower:
        return "APPLICATION"
    elif "util" in file_lower:
        return "UTILITY"
    else:
        return "UNKNOWN"

# ---------------------------------------------
# Extract Java Functions
# ---------------------------------------------
def extract_functions(code):
    pattern = re.compile(
        r"(public|protected|private)?\s+[\w<>\[\]]+\s+(\w+)\s*\(([^)]*)\)",
        re.MULTILINE
    )
    return [m.group(2) for m in pattern.finditer(code)]

# ---------------------------------------------
# Extract Comments
# ---------------------------------------------
def extract_comments(code):
    single = re.findall(r"//(.*)", code)
    multi = re.findall(r"/\*([\s\S]*?)\*/", code)
    comments = single + multi
    return [c.strip() for c in comments if c.strip() and not is_license_comment(c)]

# ---------------------------------------------
# NLP Annotation
# ---------------------------------------------
def annotate_text(text):
    doc = nlp(text)

    verbs = [t.lemma_ for t in doc if t.pos_ == "VERB"]
    nouns = [t.lemma_ for t in doc if t.pos_ in ("NOUN", "PROPN")]

    named_entities = [
        {"text": ent.text, "label": ent.label_}
        for ent in doc.ents
    ]

    intent = None
    for v in verbs:
        if v in ["create", "add", "insert"]:
            intent = "CREATE"
        elif v in ["get", "read", "fetch", "find", "retrieve"]:
            intent = "READ"
        elif v in ["update", "modify", "set"]:
            intent = "UPDATE"
        elif v in ["delete", "remove"]:
            intent = "DELETE"

    domain_entity = nouns[0] if nouns else None

    return {
        "intent": intent,
        "domain_entity": domain_entity,
        "named_entities": named_entities
    }

# ---------------------------------------------
# Process Java File
# ---------------------------------------------
def process_java_file(file_path):
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            code = f.read()

        comments = extract_comments(code)
        functions = extract_functions(code)
        business_role = detect_business_role(file_path, code)

        file_data = []

        for comment in comments:
            nlp_tags = annotate_text(comment)

            file_data.append({
                "file": file_path,
                "function": functions[0] if functions else "",
                "business_role": business_role,
                "intent": nlp_tags["intent"],
                "domain_entity": nlp_tags["domain_entity"],
                "named_entities": nlp_tags["named_entities"],
                "comment": comment
            })

        return file_data

    except Exception as e:
        return [{"file": file_path, "error": str(e)}]

# ---------------------------------------------
# Build Graph (Without HTTP Routes)
# ---------------------------------------------
def safe_str(value):
    if value is None:
        return ""
    return str(value)

def build_graph(all_data):
    G = nx.DiGraph()

    for item in all_data:
        if "error" in item:
            continue

        file_node = item["file"]
        function_node = file_node + "::" + item["function"]

        G.add_node(file_node, type="file")

        G.add_node(
            function_node,
            type="function",
            intent=safe_str(item.get("intent")),
            domain=safe_str(item.get("domain_entity")),
            business_role=safe_str(item.get("business_role"))
        )

        G.add_edge(file_node, function_node, relation="contains")

    nx.write_gml(G, OUTPUT_GML)
    nx.write_graphml(G, OUTPUT_GRAPHML)

    print("✅ Graph files generated successfully!")

# ---------------------------------------------
# MAIN
# ---------------------------------------------
all_results = []

for root, dirs, files in os.walk(PROJECT_PATH):
    for file in files:
        if file.endswith(".java"):
            full_path = os.path.join(root, file)
            print("Processing:", full_path)
            data = process_java_file(full_path)
            all_results.extend(data)

# Save JSON
with open(OUTPUT_JSON, "w", encoding="utf-8") as f:
    json.dump(all_results, f, indent=4)

print("✅ JSON saved!")

# Build Graph
build_graph(all_results)

print("🔥 ALL DONE")