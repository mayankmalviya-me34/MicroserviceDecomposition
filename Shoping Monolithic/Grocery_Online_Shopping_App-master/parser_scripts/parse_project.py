#!/usr/bin/env python3

import os
import json
import networkx as nx
from tree_sitter import Parser, Language
import tree_sitter_javascript as ts_js


# ===============================
# 1. Setup Parser (LATEST API SAFE)
# ===============================

# Convert PyCapsule -> Language object
JS_LANGUAGE = Language(ts_js.language())

parser = Parser()
parser.language = JS_LANGUAGE


# ===============================
# 2. Project Paths
# ===============================

ROOT_DIR = os.path.abspath(os.path.join(".."))
BACKEND_DIR = os.path.join(ROOT_DIR, "online_shopping_monolithic")
FRONTEND_DIR = os.path.join(ROOT_DIR, "frontend")


# ===============================
# 3. Helpers
# ===============================

BUILTINS = {
    "map", "push", "splice", "toString",
    "indexOf", "filter", "keys", "parseInt"
}



def get_js_files(folder):
    files = []
    
    if not os.path.exists(folder):
        return files

    for root, _, filenames in os.walk(folder):

        if "node_modules" in root:
            continue

        for f in filenames:
            if f.endswith((".js", ".jsx")):
                files.append(os.path.join(root, f))
    return files


def text(node, code):
    if node is None:
        return ""
    return code[node.start_byte:node.end_byte].decode("utf-8")


# ===============================
# 4. Parse File
# ===============================

def parse_file(file_path):

    with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
        code = f.read().encode("utf-8")

    tree = parser.parse(code)
    root = tree.root_node

    imports = []
    results = []
    current_class = None
    relative_path = os.path.relpath(file_path, ROOT_DIR)

    def traverse(node, current_func=None):
        nonlocal current_class

        # =======================
        # IMPORT (ES6)
        # =======================
        if node.type == "import_statement":
            imp = text(node, code).strip()
            if imp not in imports:
                imports.append(imp)

        # -----------------------
        # require() Imports
        # -----------------------
        if node.type == "call_expression":
            fn = node.child_by_field_name("function")
            if fn and text(fn, code) == "require":
                imp = text(node, code)
                if imp not in imports:
                    imports.append(imp)

        # CLASS
        if node.type == "class_declaration":
            name_node = node.child_by_field_name("name")
            current_class = text(name_node, code)

        # FUNCTIONS / METHODS
        if node.type in ("function_declaration", "method_definition"):
            name_node = node.child_by_field_name("name")
            if not name_node:
                return

            func_name = text(name_node, code)
            params = []

            params_node = node.child_by_field_name("parameters")
            if params_node:
                for p in params_node.children:
                    if p.type == "identifier":
                        params.append(text(p, code))

            entry = {
                "function": func_name,
                "class": current_class or "",
                "signature": f"{func_name}({', '.join(params)})",
                "return_type": "unknown",
                "calls": [],
                "imports": imports.copy(),
                "source_file": relative_path
            }

            results.append(entry)
            current_func = entry

        if node.type == "call_expression" and current_func:
            fn = node.child_by_field_name("function")
            called = ""

            if fn:
                if fn.type == "identifier":
                    called = text(fn, code)

                elif fn.type == "member_expression":
                    prop = fn.child_by_field_name("property")
                    if prop:
                        called = text(prop, code)

            if called and called not in BUILTINS:
                current_func["calls"].append(called)


        # =======================
        # RETURN TYPE DETECTION
        # =======================
        if node.type == "return_statement" and current_func:
            return_expr = node.child_by_field_name("argument")

            if return_expr:
                if return_expr.type == "object":
                    current_func["return_type"] = "object"
                elif return_expr.type == "array":
                    current_func["return_type"] = "array"
                elif return_expr.type == "string":
                    current_func["return_type"] = "string"
                elif return_expr.type == "number":
                    current_func["return_type"] = "number"
                elif return_expr.type == "await_expression":
                    current_func["return_type"] = "promise"
                elif return_expr.type == "call_expression":
                    current_func["return_type"] = "function_call"
                else:
                    current_func["return_type"] = return_expr.type

        for child in node.children:
            traverse(child, current_func)

    traverse(root)

    # remove duplicate calls
    for f in results:
        f["calls"] = list(set(f["calls"]))


    return results


# ===============================
# 5. Scan Project
# ===============================

all_files = get_js_files(BACKEND_DIR) + get_js_files(FRONTEND_DIR)
all_functions = []

for file in all_files:
    all_functions.extend(parse_file(file))


# ===============================
# 6. Build Structured Graph
# ===============================


function_map = {}

for f in all_functions:
    file_path = f["source_file"]
    class_name = f["class"]
    func_name = f["function"]

    if class_name:
        method_id = f"{file_path}::{class_name}::{func_name}"
        key = f"{class_name}.{func_name}"
    else:
        method_id = f"{file_path}::{func_name}"
        key = func_name

    # key = f"{class_name}.{func_name}" if class_name else func_name
    function_map.setdefault(key, []).append(method_id)

# ===============================
# 6A. Build Function Map (PASS 1)
# ===============================

G = nx.DiGraph()

for f in all_functions:
    file_path = f["source_file"]
    class_name = f["class"]
    func_name = f["function"]

    # METHOD ID
    if class_name:
        method_id = f"{file_path}::{class_name}::{func_name}"
    else:
        method_id = f"{file_path}::{func_name}"

    # FILE NODE
    G.add_node(file_path, node_type="file")

    # CLASS NODE
    class_id = None
    if class_name:
        class_id = f"{file_path}::{class_name}"
        G.add_node(class_id, node_type="class")
        G.add_edge(file_path, class_id, relation="contains")

    G.add_node(method_id, node_type="method")


    if class_id:
        G.add_edge(class_id, method_id, relation="contains")
    else:
        G.add_edge(file_path, method_id, relation="contains")

    # CALL EDGES
    for called in f["calls"]:
        key = f"{class_name}.{called}" if class_name else called

        if key in function_map:
            for target in function_map[key]:
                G.add_edge(method_id, target, relation="calls")

        # elif called in function_map:
        #     for target in function_map[called]:
        #         G.add_edge(method_id, target, relation="calls")

        else:
            # 2. Cross-class match
            matches = [v for k, v in function_map.items() if k.endswith(f".{called}")]
            
            if matches:
                for group in matches:
                    for target in group:
                        G.add_edge(method_id, target, relation="calls")

            else:
                # 3. External

                G.add_node(called, node_type="external")
                G.add_edge(method_id, called, relation="calls")


# ===============================
# 7. Save Outputs
# ===============================

OUT_DIR = os.path.join(ROOT_DIR, "datasets", "graphs")
os.makedirs(OUT_DIR, exist_ok=True)

# GML
nx.write_gml(G, os.path.join(OUT_DIR, "static1.gml"))

# GRAPHML (safe clean)
G_clean = nx.DiGraph()
for n, data in G.nodes(data=True):
    G_clean.add_node(n, **{k: str(v) for k, v in data.items()})

for u, v, data in G.edges(data=True):
    G_clean.add_edge(u, v, **{k: str(val) for k, val in data.items()})

nx.write_graphml(G_clean, os.path.join(OUT_DIR, "semantic1.graphml"))

# JSON
with open(os.path.join(OUT_DIR, "semantic1.json"), "w", encoding="utf-8") as f:
    json.dump({"functions": all_functions}, f, indent=4)

print("✅ Parsing complete!")
print("📁 Generated:")
print("   - static.gml")
print("   - semantic.graphml")
print("   - semantic.json")