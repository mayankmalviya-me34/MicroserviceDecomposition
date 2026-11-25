# annotate_semantics.py
import os
import json
import spacy

# === 1. Load spaCy English NLP model ===
nlp = spacy.load("en_core_web_sm")

# === 2. Paths ===
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
GRAPH_DIR = os.path.join(BASE_DIR, "datasets", "graphs", "spring-petclinic")
SEMANTIC_JSON = os.path.join(GRAPH_DIR, "semantic.json")
ANNOTATION_DIR = os.path.join(BASE_DIR, "datasets", "annotations")
os.makedirs(ANNOTATION_DIR, exist_ok=True)
OUTPUT_JSON = os.path.join(ANNOTATION_DIR, "spring_semantic_tags.json")

# === 3. Load semantic.json ===
with open(SEMANTIC_JSON, "r", encoding="utf-8") as f:
    data = json.load(f)

functions = data.get("functions", [])

# === 4. Annotate function names using spaCy ===
semantic_data = {}

for func in functions:
    label = func.get("name", "")
    code_snippet = func.get("file", "")

    # Analyze label with spaCy
    doc = nlp(label)
    roles = []
    for token in doc:
        if token.pos_ in ["VERB", "NOUN", "PROPN"]:
            roles.append({
                "text": token.text,
                "lemma": token.lemma_,
                "pos": token.pos_,
                "dep": token.dep_
            })

    semantic_data[label] = {
        "label": label,
        "code": code_snippet,
        "semantic_roles": roles
    }

# === 5. Save semantic tags JSON ===
with open(OUTPUT_JSON, "w", encoding="utf-8") as f:
    json.dump(semantic_data, f, indent=4)

print(f"✅ Semantic annotation complete! Output saved in {OUTPUT_JSON}")
