import os
os.environ["HF_HUB_DISABLE_SYMLINKS_WARNING"] = "1"
os.environ["TRANSFORMERS_NO_ADVISORY_WARNINGS"] = "1"

import json
import javalang
import networkx as nx
from transformers import AutoTokenizer, AutoModelForSeq2SeqLM

print("Loading CodeT5+ model…")
MODEL_NAME = "Salesforce/codet5p-770m-py"
tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME)
model = AutoModelForSeq2SeqLM.from_pretrained(MODEL_NAME)

PROJECT_PATH = "../"
OUTPUT_DIR = "datasetsCodeT5+/graphs/spring-petclinic/"

STATIC_GML = os.path.join(OUTPUT_DIR, "semantic.gml")
SEM_GRAPHML = os.path.join(OUTPUT_DIR, "semantic.graphml")
SEM_JSON = os.path.join(OUTPUT_DIR, "semantic.json")

os.makedirs(OUTPUT_DIR, exist_ok=True)

# ------------------------------
# Summarization
# ------------------------------
def summarize_code(code):
    inputs = tokenizer(code, return_tensors="pt", truncation=True, max_length=512)
    outputs = model.generate(**inputs, max_length=256)
    return tokenizer.decode(outputs[0], skip_special_tokens=True)

# ------------------------------
# Parse Java
# ------------------------------
def parse_java_file(file_path):
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            code = f.read()

        tree = javalang.parse.parse(code)

        imports = [imp.path for imp in tree.imports]
        classes = []
        methods_data = []

        for path, node in tree.filter(javalang.tree.ClassDeclaration):
            classes.append(node.name)
            for method in node.methods:
                # Function-level semantic details
                signature = method.name + "(" + ", ".join(p.name for p in method.parameters) + ")"
                calls = [m.member for m in method.body if isinstance(m, javalang.tree.MethodInvocation)]
                return_type = method.return_type.name if method.return_type else "void"

                methods_data.append({
                    "function": method.name,
                    "class": node.name,
                    "source_file": os.path.basename(file_path),
                    "signature": signature,
                    "calls": calls,
                    "return_type": return_type,
                    "imports": imports
                })

        semantic_summary = summarize_code(code)

        return {
            "file": file_path,
            "classes": classes,
            "methods": methods_data,
            "summary": semantic_summary
        }

    except Exception as e:
        return {"file": file_path, "error": str(e)}

# ------------------------------
# Build Static Graph
# ------------------------------
def build_static_graph(results):
    G = nx.DiGraph()

    for r in results:
        if "error" in r:
            continue

        file_node = r["file"]
        G.add_node(file_node, 
                   node_type="file",
                   path=r["file"])

        # Classes
        for cls in r.get("classes", []):
            class_node = file_node + "::" + cls
            G.add_node(class_node,
                       node_type="class",
                       class_name=cls)

            G.add_edge(file_node, class_node, relation="contains")

        # Methods
        for method in r.get("methods", []):
            method_node = file_node + "::" + method["function"]

            G.add_node(method_node,
                       node_type="method",
                       function_name=method["function"],
                       signature=method["signature"],
                       return_type=method["return_type"],
                       source_file=method["source_file"])

            G.add_edge(file_node, method_node, relation="declares")

            # Method calls
            for call in method["calls"]:
                call_node = "call::" + call
                G.add_node(call_node,
                           node_type="method_call",
                           call_name=call)

                G.add_edge(method_node, call_node, relation="calls")

            # Return type node
            return_node = "type::" + method["return_type"]
            G.add_node(return_node,
                       node_type="return_type",
                       type_name=method["return_type"])

            G.add_edge(method_node, return_node, relation="returns")

    nx.write_graphml(G, STATIC_GML)
    print("Improved static graph generated!")

# ------------------------------
# Build Semantic Graph
# ------------------------------
def build_semantic_graph(results):
    G = nx.DiGraph()

    for r in results:
        if "error" in r:
            continue

        file_node = r["file"]
        summary_node = file_node + "::summary"

        G.add_node(file_node,
                   node_type="file")

        G.add_node(summary_node,
                   node_type="summary",
                   text=r["summary"])

        G.add_edge(file_node, summary_node,
                   relation="describes")

        # Also attach summary to methods
        for method in r.get("methods", []):
            method_node = file_node + "::" + method["function"]

            G.add_node(method_node,
                       node_type="method",
                       function_name=method["function"],
                       signature=method["signature"])

            G.add_edge(method_node, summary_node,
                       relation="explained_by")

    nx.write_graphml(G, SEM_GRAPHML)
    print("Improved semantic graph generated!")

# ------------------------------
# Process all Java files
# ------------------------------
results = []

for root, dirs, files in os.walk(PROJECT_PATH):
    for file in files:
        if file.endswith(".java"):
            full_path = os.path.join(root, file)
            print(f"Processing: {full_path}")
            results.append(parse_java_file(full_path))

# ------------------------------
# Save JSON with detailed function info
# ------------------------------
with open(SEM_JSON, "w", encoding="utf-8") as f:
    json.dump(results, f, indent=4)

print("semantic.json created!")

# ------------------------------
# Build Graphs
# ------------------------------
build_static_graph(results)
build_semantic_graph(results)

print("\nALL DONE ✔")
