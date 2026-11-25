import json
import re
from pathlib import Path
from collections import defaultdict

from sentence_transformers import SentenceTransformer
import umap
import hdbscan
from sklearn.cluster import KMeans
from sklearn.metrics import silhouette_score
from sklearn.feature_extraction.text import TfidfVectorizer
import matplotlib.pyplot as plt

print("PHASE 3.2 – Semantic Clustering & Boundary Suggestion STARTED", flush=True)

# ======================================================
# PATH CONFIG
# ======================================================
ROOT = Path(r"F:\Main Project\MICRO")

INPUT_FILE = ROOT / "phase3" / "llm_annotations" / "llm_semantic_annotations.json"
OUTPUT_FILE = ROOT / "phase3" / "clusters" / "llm_service_clusters.json"
PLOT_DIR = ROOT / "phase3" / "plots"

PLOT_DIR.mkdir(parents=True, exist_ok=True)

# ======================================================
# LOAD PHASE 3.1 OUTPUT
# ======================================================
with open(INPUT_FILE, encoding="utf-8") as f:
    annotations = json.load(f)

print(f"Loaded {len(annotations)} annotated functions", flush=True)

# ======================================================
# BUILD SHARED BUSINESS VOCABULARY
# ======================================================
texts = []
items = []

for a in annotations:
    semantic_text = f"{a['intent']} {a['domain_entity']} {a['business_role']}"
    texts.append(semantic_text)
    items.append(a)

# ======================================================
# SENTENCE-BERT EMBEDDINGS
# ======================================================
model = SentenceTransformer("sentence-transformers/all-MiniLM-L6-v2")
embeddings = model.encode(texts, show_progress_bar=True)

# ======================================================
# UMAP DIMENSIONALITY REDUCTION
# ======================================================
reducer = umap.UMAP(
    n_neighbors=10,
    n_components=2,
    metric="cosine",
    random_state=42
)
reduced_embeddings = reducer.fit_transform(embeddings)

# ======================================================
# HDBSCAN (HIERARCHICAL CLUSTERING)
# ======================================================
hdbscan_clusterer = hdbscan.HDBSCAN(
    min_cluster_size=5,
    metric="euclidean"
)
hdbscan_labels = hdbscan_clusterer.fit_predict(reduced_embeddings)

print("HDBSCAN clustering completed", flush=True)

# ======================================================
# K-MEANS BASELINE (COMPARISON)
# ======================================================
k = 5
kmeans = KMeans(n_clusters=k, random_state=42)
kmeans_labels = kmeans.fit_predict(reduced_embeddings)

kmeans_sil = silhouette_score(reduced_embeddings, kmeans_labels)

valid_mask = hdbscan_labels != -1
if len(set(hdbscan_labels[valid_mask])) > 1:
    hdbscan_sil = silhouette_score(
        reduced_embeddings[valid_mask],
        hdbscan_labels[valid_mask]
    )
else:
    hdbscan_sil = -1

print("\n--- CLUSTERING COMPARISON ---")
print(f"KMeans (k={k}) Silhouette Score   : {kmeans_sil:.3f}")
print(f"HDBSCAN Silhouette Score        : {hdbscan_sil:.3f}")

# ======================================================
# UMAP VISUALIZATION
# ======================================================
plt.figure(figsize=(10, 8))
scatter = plt.scatter(
    reduced_embeddings[:, 0],
    reduced_embeddings[:, 1],
    c=hdbscan_labels,
    cmap="tab10",
    s=15
)
plt.title("UMAP Visualization of Semantic Service Clusters")
plt.xlabel("UMAP-1")
plt.ylabel("UMAP-2")
plt.colorbar(scatter, label="Cluster ID")
plt.tight_layout()
plt.savefig(PLOT_DIR / "umap_clusters.png")
plt.close()

print("UMAP plot saved to phase3/plots/umap_clusters.png", flush=True)

# ======================================================
# CLEAN, CONDITION-FREE SERVICE NAMING (TF-IDF)
# ======================================================
GENERIC_WORDS = {
    "process", "processing", "service", "domain",
    "management", "application", "logic", "general"
}

def clean_token(token: str):
    token = re.sub(r"[^a-zA-Z]", "", token).lower()
    if token in GENERIC_WORDS or len(token) < 4:
        return None
    return token.title()

cluster_texts = defaultdict(list)

for label, text in zip(hdbscan_labels, texts):
    if label != -1:
        cluster_texts[label].append(text)

cluster_service_names = {}
cluster_roles = {}

for label, ctexts in cluster_texts.items():
    vectorizer = TfidfVectorizer(
        stop_words="english",
        ngram_range=(1, 2),
        max_features=30
    )
    X = vectorizer.fit_transform(ctexts)
    terms = vectorizer.get_feature_names_out()
    scores = X.mean(axis=0).A1

    ranked = sorted(zip(terms, scores), key=lambda x: -x[1])

    keywords = []
    for term, _ in ranked:
        cleaned = clean_token(term)
        if cleaned and cleaned not in keywords:
            keywords.append(cleaned)

    service_name = (
        keywords[0] + "Service"
        if keywords else f"ServiceCluster_{label}"
    )

    role_name = (
        " ".join(keywords[:2]) + " Capability"
        if len(keywords) >= 2 else "General Capability"
    )

    cluster_service_names[label] = service_name
    cluster_roles[label] = role_name

# ======================================================
# FINAL OUTPUT
# ======================================================
results = []

for label, item in zip(hdbscan_labels, items):
    if label == -1:
        service = "Unassigned"
        role = "Unassigned"
    else:
        service = cluster_service_names[label]
        role = cluster_roles[label]

    results.append({
        "function": item["function_fqn"],
        "cluster_id": service,
        "business_role": role
    })

OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)
with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
    json.dump(results, f, indent=2)

print("PHASE 3.2 COMPLETED SUCCESSFULLY", flush=True)
print("Clusters written to:", OUTPUT_FILE, flush=True)
print("Total functions clustered:", len(results), flush=True)
