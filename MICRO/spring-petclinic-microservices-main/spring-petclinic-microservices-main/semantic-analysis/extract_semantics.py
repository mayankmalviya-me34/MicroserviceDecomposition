#!/usr/bin/env python3
"""
Phase 2.1: Code & API Semantics Extraction

Outputs:
  - static.gml
  - semantic.graphml
  - semantic.json

JSON structure remains EXACTLY SAME (flat list of methods)
"""

import os
import json
import re
import argparse
import xml.etree.ElementTree as ET
from xml.dom import minidom
import networkx as nx
import javalang
from transformers import AutoTokenizer, AutoModelForSeq2SeqLM
import torch

# =============================
# LOAD LLM (use small first)
# =============================

MODEL_NAME = "Salesforce/codet5-small"   # change to 770m later if needed
print("Loading CodeT5 model...")
tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME)
model = AutoModelForSeq2SeqLM.from_pretrained(MODEL_NAME)

# =============================
# COMMENT REGEX
# =============================

COMMENT_PATTERN = re.compile(
    r'(/\*.*?\*/)|(?://.*?$)',
    re.DOTALL | re.MULTILINE
)

# =============================
# HELPERS
# =============================

def read_text(path):
    with open(path, "r", encoding="utf-8", errors="ignore") as f:
        return f.read()

def find_comments(source_text):
    return [m.group(0).strip() for m in COMMENT_PATTERN.finditer(source_text)]

# =============================
# LLM SEMANTIC EXTRACTION
# =============================

def extract_semantics_with_llm(code_snippet):

    prompt = f"""
    Extract:
    - Service responsibility
    - Domain terms
    - Functional intent
    From this Java method:

    {code_snippet}
    """

    inputs = tokenizer(prompt, return_tensors="pt", truncation=True, max_length=512)
    outputs = model.generate(**inputs, max_length=128)
    summary = tokenizer.decode(outputs[0], skip_special_tokens=True)

    return summary.strip()

# =============================
# JAVA PARSER (AST BASED)
# =============================

def parse_java_file(path, project_root):
    code = read_text(path)
    rel_path = os.path.relpath(path, project_root)
    rel_path = rel_path.replace("/", "\\") if os.name == "nt" else rel_path

    try:
        tree = javalang.parse.parse(code)
    except Exception:
        return {"file": rel_path, "error": "parse_error"}

    # Package
    package = tree.package.name if tree.package else None

    # ==================== FIXED IMPORTS LOGIC ====================
    imports = []
    for imp in tree.imports:
        if imp.static:
            imp_str = f"import static {imp.path}"
            if hasattr(imp, 'member') and imp.member:
                imp_str += f".{imp.member}"
        else:
            imp_str = f"import {imp.path}"
        imp_str += ";"
        imports.append(imp_str)
    # ============================================================

    methods = []

    for _, class_node in tree.filter(javalang.tree.ClassDeclaration):
        full_class = f"{package}.{class_node.name}" if package else class_node.name

        for method in class_node.methods:
            return_type = method.return_type.name if method.return_type else "void"

            # Method calls
            calls = []
            if method.body:
                for _, node in method.filter(javalang.tree.MethodInvocation):
                    calls.append(node.member)

            # Signature
            if hasattr(method, 'parameters') and method.parameters:
                param_names = [p.name for p in method.parameters 
                               if hasattr(p, 'name') and p.name]
                param_str = ", ".join(param_names)
            else:
                param_str = ""
            signature = f"{method.name}({param_str})"

            # LLM code snippet
            method_start = method.position.line if hasattr(method, 'position') and method.position else 1
            lines = code.splitlines()
            method_code = "\n".join(lines[method_start-1:method_start+60])[:900]

            semantic_summary = extract_semantics_with_llm(method_code)

            methods.append({
                "return_type": return_type,
                "imports": imports,
                "signature": signature,
                "calls": calls,
                "function": method.name,
                "class": full_class,
                "source_file": rel_path,
                "semantic_summary": semantic_summary
            })

    return {
        "file": rel_path,
        "methods": methods
    }

# =============================
# STATIC GRAPH (.gml)
# =============================

def build_static_graph(results, outdir):

    G = nx.DiGraph()

    for r in results:
        if "error" in r:
            continue

        file_node = r["file"]
        G.add_node(file_node, node_type="file")

        for m in r["methods"]:
            method_node = f"{file_node}::{m['class']}::{m['function']}"
            G.add_node(method_node, node_type="method")
            G.add_edge(file_node, method_node, relation="contains")

    nx.write_gml(G, os.path.join(outdir, "static.gml"))
    print("✔ static.gml saved")

# =============================
# SEMANTIC GRAPH (.graphml)
# =============================

def build_semantic_graph(results, outdir):

    graphml = ET.Element("graphml", {
        "xmlns": "http://graphml.graphdrawing.org/xmlns",
        "xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance",
        "xsi:schemaLocation":
            "http://graphml.graphdrawing.org/xmlns "
            "http://graphml.graphdrawing.org/xmlns/1.0/graphml.xsd"
    })

    keys = [
        ("d0", "node", "node_type"),
        ("d1", "node", "text"),
        ("d2", "node", "function_name"),
        ("d3", "node", "signature"),
        ("d4", "edge", "relation")
    ]

    for kid, scope, name in keys:
        ET.SubElement(graphml, "key", {
            "id": kid,
            "for": scope,
            "attr.name": name,
            "attr.type": "string"
        })

    graph = ET.SubElement(graphml, "graph", {"edgedefault": "directed"})

    for r in results:
        if "error" in r:
            continue

        file_node = r["file"]

        node_file = ET.SubElement(graph, "node", {"id": file_node})
        ET.SubElement(node_file, "data", {"key": "d0"}).text = "file"

        for m in r["methods"]:
            method_node = f"{file_node}::{m['class']}::{m['function']}"

            node_method = ET.SubElement(graph, "node", {"id": method_node})
            ET.SubElement(node_method, "data", {"key": "d0"}).text = "method"
            ET.SubElement(node_method, "data", {"key": "d2"}).text = m["function"]
            ET.SubElement(node_method, "data", {"key": "d3"}).text = m["signature"]
            ET.SubElement(node_method, "data", {"key": "d1"}).text = m["semantic_summary"]

            edge = ET.SubElement(graph, "edge", {
                "source": file_node,
                "target": method_node
            })
            ET.SubElement(edge, "data", {"key": "d4"}).text = "contains"

    xmlstr = minidom.parseString(
        ET.tostring(graphml)
    ).toprettyxml(indent="  ")

    with open(os.path.join(outdir, "semantic.graphml"), "w", encoding="utf-8") as f:
        f.write(xmlstr)

    print("✔ semantic.graphml saved")

# =============================
# BUILD + JSON
# =============================

def build_and_write(results, outdir):

    os.makedirs(outdir, exist_ok=True)

    build_static_graph(results, outdir)
    build_semantic_graph(results, outdir)

    all_methods = []
    for r in results:
        if "error" not in r:
            all_methods.extend(r["methods"])

    with open(os.path.join(outdir, "semantic.json"), "w", encoding="utf-8") as f:
        json.dump(all_methods, f, indent=2)

    print("✔ semantic.json saved")

# =============================
# MAIN
# =============================

def main():

    parser = argparse.ArgumentParser()
    parser.add_argument("-p", "--project-root", default="..")
    parser.add_argument("-o", "--outdir",
                        default="datasetsCodeT5+/graphs/spring-petclinic")
    args = parser.parse_args()

    results = []

    for root, _, files in os.walk(args.project_root):
        for f in files:
            if f.endswith(".java"):
                full_path = os.path.join(root, f)
                results.append(parse_java_file(full_path, args.project_root))

    build_and_write(results, args.outdir)

if __name__ == "__main__":
    main()