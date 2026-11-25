#!/usr/bin/env python3
"""
annotations_extractor.py

LLM + NLP based Java Semantic Annotation Extractor for Spring Microservices
Outputs: JSON, GML, GraphML
"""

import os
import re
import json
import argparse
import networkx as nx
import spacy
import nltk
from transformers import AutoTokenizer, AutoModelForSeq2SeqLM
import javalang

# ---------------------------------------------------
# ARGUMENTS
# ---------------------------------------------------
parser = argparse.ArgumentParser()
parser.add_argument("--project-root", "-p", required=True, help="Java project root")
args = parser.parse_args()

PROJECT_ROOT = os.path.abspath(args.project_root)
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
OUT_DIR = os.path.join(SCRIPT_DIR, "datasetsCodeT5+", "annotations")
os.makedirs(OUT_DIR, exist_ok=True)

JSON_OUT = os.path.join(OUT_DIR, "spring_microservice_semantic_tags.json")
GML_OUT = os.path.join(OUT_DIR, "spring_microservice_semantic_tags.gml")
GRAPHML_OUT = os.path.join(OUT_DIR, "spring_microservice_semantic_tags.graphml")

# ---------------------------------------------------
# LOAD NLP + MODEL (once only)
# ---------------------------------------------------
nltk.download("punkt", quiet=True)
nltk.download("stopwords", quiet=True)

try:
    nlp = spacy.load("en_core_web_sm")
except:
    raise RuntimeError("Run: python -m spacy download en_core_web_sm")

print("Loading CodeT5+ model (this may take 10-20 seconds)...")
MODEL_NAME = "Salesforce/codet5p-220m"
tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME, use_fast=False)
model = AutoModelForSeq2SeqLM.from_pretrained(MODEL_NAME)

# ---------------------------------------------------
# HELPERS
# ---------------------------------------------------
COMMENT_REGEX = re.compile(r"//.*?$|/\*[\s\S]*?\*/", re.MULTILINE)

def extract_comments(code: str) -> list[str]:
    comments = []
    for m in COMMENT_REGEX.finditer(code):
        text = m.group(0).replace("/*", "").replace("*/", "").replace("//", "").strip()
        if text:
            comments.append(text)
    return comments

def extract_named_entities(text: str):
    doc = nlp(text)
    return [{"text": e.text, "label": e.label_} for e in doc.ents]

def guess_domain_entity(text: str):
    if not text:
        return None
    words = [w for w in nltk.word_tokenize(text) if w.isalpha() and len(w) > 2]
    # Ignore common words like author, license, simple etc.
    ignore = {"author", "copyright", "license", "apache", "simple", "java", "bean"}
    clean_words = [w for w in words if w.lower() not in ignore]
    return clean_words[0].lower() if clean_words else None

def detect_business_role(class_name: str, file_path: str = ""):
    name = class_name.lower()
    file_lower = file_path.lower()

    if "controller" in name or "resource" in name:
        return "CONTROLLER"
    if "service" in name or "client" in name:
        return "SERVICE"
    if "repository" in name or "repo" in name:
        return "REPOSITORY"
    if "entity" in name or "model" in name or "bean" in name:
        return "ENTITY"
    if any(x in name for x in ["validator", "formatter", "component", "config", "configuration"]):
        return "COMPONENT"
    if "application" in name or "main" in name:
        return "APPLICATION"
    if "test" in name or "test" in file_lower:
        return "TEST"

    # Default for domain classes (Owner, Pet, Vet, Visit etc.)
    return "DOMAIN"

def detect_intent(method_name: str, comment: str):
    text = (method_name + " " + comment).lower()
    if any(w in text for w in ["create", "add", "save", "insert", "post"]): return "CREATE"
    if any(w in text for w in ["update", "edit", "modify", "put"]): return "UPDATE"
    if any(w in text for w in ["delete", "remove"]): return "DELETE"
    if any(w in text for w in ["get", "find", "fetch", "retrieve"]): return "READ"
    return "UNKNOWN"

def llm_semantic_hint(comment: str, class_name: str, method_name: str):
    prompt = f"Class: {class_name}\nMethod: {method_name}\nComment: {comment}\nWhat does this method do?"
    inputs = tokenizer(prompt, return_tensors="pt", truncation=True, max_length=512)
    outputs = model.generate(**inputs, max_length=120, num_beams=2)
    return tokenizer.decode(outputs[0], skip_special_tokens=True)

# ---------------------------------------------------
# MAIN EXTRACTION
# ---------------------------------------------------
results = []
G = nx.DiGraph()

print(f"Scanning project: {PROJECT_ROOT}")

for root, dirs, files in os.walk(PROJECT_ROOT):
    if any(ignore in root for ignore in ["node_modules", "target", ".git", "__pycache__"]):
        continue

    for file in files:
        if not file.endswith(".java"):
            continue

        full_path = os.path.join(root, file)
        rel_path = os.path.relpath(full_path, PROJECT_ROOT)

        try:
            with open(full_path, encoding="utf-8", errors="ignore") as f:
                code = f.read()
            tree = javalang.parse.parse(code)
        except:
            continue

        # ←←←←← YE LINE AB SAHI INDENTATION PE HAI ←←←←←
        file_comments = extract_comments(code)

        # ====================== JAVA AST PARSING ======================
        for _, class_node in tree.filter(javalang.tree.ClassDeclaration):  # type: ignore
            class_name = class_node.name          # type: ignore[attr-defined]
            business_role = detect_business_role(class_name, rel_path)

            for method in class_node.methods:     # type: ignore[attr-defined]
                method_name = method.name         # type: ignore[attr-defined]

                # ================== IMPROVED COMMENT EXTRACTION ==================
                method_comment = ""

                # 1. Javadoc comment (method ke upar)
                if hasattr(method, 'documentation') and method.documentation:
                    method_comment = method.documentation.strip()

                # 2. License comment skip karke normal comment lo
                if not method_comment and file_comments:
                    for c in file_comments:
                        c_lower = c.lower()
                        if not any(word in c_lower for word in ["copyright", "license", "apache", "2002-2021"]):
                            method_comment = c.strip()
                            break

                if not method_comment:
                    method_comment = ""

                # =================================================================

                named_entities = extract_named_entities(method_comment)
                domain_entity = guess_domain_entity(method_comment)
                intent = detect_intent(method_name, method_comment)

                llm_hint = llm_semantic_hint(method_comment, class_name, method_name)

                record = {
                    "file": rel_path,
                    "class": class_name,
                    "function": method_name,
                    "business_role": business_role,
                    "intent": intent,
                    "domain_entity": domain_entity,
                    "named_entities": named_entities,
                    "comment": method_comment,
                    "llm_hint": llm_hint
                }

                results.append(record)

                # Graph
                file_node = rel_path
                method_node = f"{rel_path}::{method_name}"

                G.add_node(file_node, type="file")
                G.add_node(
                    method_node,
                    type="method",
                    intent=intent,
                    domain=domain_entity or "",
                    business_role=business_role,
                    llm_hint=llm_hint[:100]
                )
                G.add_edge(file_node, method_node)

print(f"Processed {len(results)} methods")

# ---------------------------------------------------
# SAVE OUTPUTS
# ---------------------------------------------------
with open(JSON_OUT, "w", encoding="utf-8") as f:
    json.dump(results, f, indent=2, ensure_ascii=False)

nx.write_gml(G, GML_OUT)
nx.write_graphml(G, GRAPHML_OUT)

print("\n DONE!")
print(f"   JSON    → {JSON_OUT}")
print(f"   GML     → {GML_OUT}")
print(f"   GraphML → {GRAPHML_OUT}")