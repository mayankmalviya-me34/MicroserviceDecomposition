"""
generate_graphs.py
Phase 2.3 - Graph-Based Semantic Embedding & Visualization
COMPLETE VERSION: Static + API Call + Semantic Graphs
"""
import nx
import json, csv, re
from pathlib import Path
import networkx as nx
import numpy as np
from tqdm import tqdm
from transformers import AutoTokenizer, AutoModel
import torch

# -------------------------------------------------
# CONFIG
# -------------------------------------------------
BASE = Path(r"F:\Main Project\monolithic Java\spring-petclinic-main\spring-petclinic-main\semantic-analysis")

SEMANTIC_JSON   = BASE / "datasetsCodeT5+" / "graphs" / "spring-petclinic" / "semantic.json"
ANNOTATION_JSON = BASE / "datasetsCodeT5+" / "annotations" / "spring_semantic_tags.json"

GRAPH_DIR  = BASE / "datasetsCodeT5+" / "enriched1" / "graphs"
EMB_DIR    = BASE / "datasetsCodeT5+" / "enriched1" / "embeddings"
NEO4J_DIR  = BASE / "datasetsCodeT5+" / "enriched1" / "neo4j"
STATIC_DIR = BASE / "datasetsCodeT5+" / "enriched1" / "static"
API_DIR    = BASE / "datasetsCodeT5+" / "enriched1" / "api"
PYG_DIR    = BASE / "datasetsCodeT5+" / "enriched1" / "pyg"

for d in [GRAPH_DIR, EMB_DIR, NEO4J_DIR, STATIC_DIR, API_DIR, PYG_DIR]:
    d.mkdir(parents=True, exist_ok=True)

device     = "cuda" if torch.cuda.is_available() else "cpu"
MODEL_NAME = "sentence-transformers/all-MiniLM-L6-v2"

# -------------------------------------------------
# LOAD INPUT
# -------------------------------------------------
with open(SEMANTIC_JSON, encoding="utf-8") as f:
    semantic = json.load(f)

try:
    with open(ANNOTATION_JSON, encoding="utf-8") as f:
        annotations = json.load(f)
except FileNotFoundError:
    annotations = []
    print("⚠️  annotation JSON not found — skipping semantic enrichment")

print(f"✅ Loaded {len(semantic)} files from semantic.json")

# -------------------------------------------------
# HELPERS
# -------------------------------------------------
CONTROLLER_KEYWORDS = ["Controller"]
API_ENDPOINT_MAP = {
    # Infer REST endpoints from Spring MVC method names
    "initCreationForm":    ("GET",  "/{entity}/new"),
    "processCreationForm": ("POST", "/{entity}/new"),
    "initFindForm":        ("GET",  "/{entity}/find"),
    "processFindForm":     ("GET",  "/{entity}"),
    "initUpdateOwnerForm": ("GET",  "/{entity}/{id}/edit"),
    "initUpdateForm":      ("GET",  "/{entity}/{id}/edit"),
    "processUpdateOwnerForm": ("PUT", "/{entity}/{id}/edit"),
    "processUpdateForm":   ("PUT",  "/{entity}/{id}/edit"),
    "showOwner":           ("GET",  "/{entity}/{id}"),
    "showVetList":         ("GET",  "/vets"),
    "showResourcesVetList":("GET",  "/vets.json"),
    "initNewVisitForm":    ("GET",  "/owners/{ownerId}/pets/{petId}/visits/new"),
    "processNewVisitForm": ("POST", "/owners/{ownerId}/pets/{petId}/visits/new"),
    "triggerException":    ("GET",  "/oups"),
    "welcome":             ("GET",  "/"),
}

def extract_package(file_path: str) -> str:
    """Extract Java package from file path."""
    fp = file_path.replace("\\", "/")
    match = re.search(r"org/springframework/samples/petclinic/([^/]+)/", fp)
    if match:
        return f"org.springframework.samples.petclinic.{match.group(1)}"
    match2 = re.search(r"org/springframework/samples/petclinic/([^/]+\.java)", fp)
    if match2:
        return "org.springframework.samples.petclinic"
    return "unknown"

def sanitize_graph(graph):
    for n, attrs in graph.nodes(data=True):
        for k, v in list(attrs.items()):
            if v is None:
                graph.nodes[n][k] = ""
            elif not isinstance(v, (str, int, float, bool)):
                graph.nodes[n][k] = str(v)
    for u, v, attrs in graph.edges(data=True):
        for k, val in list(attrs.items()):
            if val is None:
                graph.edges[u, v][k] = ""
            elif not isinstance(val, (str, int, float, bool)):
                graph.edges[u, v][k] = str(val)

# -------------------------------------------------
# GRAPH 1: STATIC CODE GRAPH
# Package → Class → Method + import-based class deps
# -------------------------------------------------
print("\n🔨 Building Static Code Graph...")
G_static = nx.DiGraph()

package_registry = {}   # class_name -> package
class_registry   = {}   # class_name -> file_path

for entry in semantic:
    file_path = entry.get("file", "unknown")
    classes   = entry.get("classes", []) or []
    methods   = entry.get("methods", []) or []
    package   = extract_package(file_path)

    # PACKAGE NODE
    if package not in G_static:
        G_static.add_node(package, type="package", label=package)

    # CLASS NODES
    for cls in classes:
        class_label = f"{package}.{cls}"
        G_static.add_node(class_label, type="class", label=cls,
                          package=package, file=file_path)
        G_static.add_edge(package, class_label, relation="contains")
        package_registry[cls] = package
        class_registry[cls]   = file_path

    # METHOD NODES
    for m in methods:
        if isinstance(m, dict):
            method_name = m.get("function", "")
            class_name  = m.get("class", classes[0] if classes else "Unknown")
            signature   = m.get("signature", method_name)
            return_type = m.get("return_type", "")
            calls       = m.get("calls", [])
            imports     = m.get("imports", [])
        else:
            method_name = m
            class_name  = classes[0] if classes else "Unknown"
            signature   = method_name
            return_type = ""
            calls       = []
            imports     = []

        if not method_name:
            continue

        class_label  = f"{package}.{class_name}"
        method_label = f"{package}.{class_name}.{method_name}"

        # Ensure class node exists
        if class_label not in G_static:
            G_static.add_node(class_label, type="class", label=class_name,
                              package=package, file=file_path)
            G_static.add_edge(package, class_label, relation="contains")

        G_static.add_node(method_label, type="method", label=method_name,
                          class_name=class_name, package=package,
                          signature=signature, return_type=return_type,
                          file=file_path)
        G_static.add_edge(class_label, method_label, relation="has_method")

        # IMPORT-BASED DEPENDENCY EDGES (class-to-class)
        for imp in imports:
            parts = imp.split(".")
            if len(parts) >= 2:
                dep_class = parts[-1]
                if dep_class in package_registry and dep_class != class_name:
                    dep_label = f"{package_registry[dep_class]}.{dep_class}"
                    if dep_label in G_static:
                        G_static.add_edge(class_label, dep_label, relation="depends_on")

sanitize_graph(G_static)
nx.write_graphml(G_static, STATIC_DIR / "static.graphml")
nx.write_gml(G_static,     STATIC_DIR / "static.gml")
with open(STATIC_DIR / "static.json", "w") as f:
    json.dump({
        "nodes": [{"id": n, **a} for n, a in G_static.nodes(data=True)],
        "edges": [{"source": u, "target": v, **a} for u, v, a in G_static.edges(data=True)]
    }, f, indent=2)

print(f"   Nodes: {G_static.number_of_nodes()} | Edges: {G_static.number_of_edges()}")
print(f"   Packages: {sum(1 for _,a in G_static.nodes(data=True) if a.get('type')=='package')}")
print(f"   Classes:  {sum(1 for _,a in G_static.nodes(data=True) if a.get('type')=='class')}")
print(f"   Methods:  {sum(1 for _,a in G_static.nodes(data=True) if a.get('type')=='method')}")
print("✅ Static Graph saved →", STATIC_DIR)

# -------------------------------------------------
# GRAPH 2: API CALL GRAPH
# Endpoint → Controller Method → (inferred domain)
# -------------------------------------------------
print("\n🔨 Building API Call Graph...")
G_api = nx.DiGraph()

for entry in semantic:
    file_path = entry.get("file", "unknown")
    classes   = entry.get("classes", []) or []
    methods   = entry.get("methods", []) or []

    # Only process Controller classes
    is_controller = any("Controller" in cls for cls in classes)
    if not is_controller:
        continue

    package    = extract_package(file_path)
    controller = next((c for c in classes if "Controller" in c), classes[0] if classes else "Unknown")

    # Derive domain from controller name
    domain = controller.replace("Controller", "").lower()
    if not domain:
        domain = "system"

    # CONTROLLER NODE
    ctrl_node = f"controller::{controller}"
    G_api.add_node(ctrl_node, type="controller", label=controller, domain=domain, file=file_path)

    for m in methods:
        if isinstance(m, dict):
            method_name = m.get("function", "")
            class_name  = m.get("class", controller)
        else:
            method_name = m
            class_name  = controller

        if not method_name or "Controller" not in class_name:
            continue

        method_node = f"method::{class_name}::{method_name}"
        G_api.add_node(method_node, type="handler", label=method_name,
                       controller=class_name, domain=domain)
        G_api.add_edge(ctrl_node, method_node, relation="handles")

        # Map to REST endpoint if known
        if method_name in API_ENDPOINT_MAP:
            http_method, path_template = API_ENDPOINT_MAP[method_name]
            endpoint_path = path_template.replace("{entity}", domain)
            endpoint_node = f"endpoint::{http_method}::{endpoint_path}"

            if endpoint_node not in G_api:
                G_api.add_node(endpoint_node, type="endpoint",
                               label=f"{http_method} {endpoint_path}",
                               http_method=http_method, path=endpoint_path)

            G_api.add_edge(endpoint_node, method_node, relation="routes_to")

sanitize_graph(G_api)
nx.write_graphml(G_api, API_DIR / "api_call_graph.graphml")
nx.write_gml(G_api,     API_DIR / "api_call_graph.gml")
with open(API_DIR / "api_call_graph.json", "w") as f:
    json.dump({
        "nodes": [{"id": n, **a} for n, a in G_api.nodes(data=True)],
        "edges": [{"source": u, "target": v, **a} for u, v, a in G_api.edges(data=True)]
    }, f, indent=2)

print(f"   Nodes: {G_api.number_of_nodes()} | Edges: {G_api.number_of_edges()}")
endpoints = [n for n, a in G_api.nodes(data=True) if a.get("type") == "endpoint"]
print(f"   Endpoints mapped: {len(endpoints)}")
for ep in sorted(endpoints):
    print(f"     {ep.replace('endpoint::', '')}")
print("✅ API Call Graph saved →", API_DIR)

# -------------------------------------------------
# GRAPH 3: SEMANTIC GRAPH (enriched original)
# Functions ↔ domain entities ↔ responsibilities
# -------------------------------------------------
print("\n🔨 Building Semantic Graph...")
G_sem = nx.DiGraph()

for entry in semantic:
    file_path = entry.get("file", "unknown")
    classes   = entry.get("classes", []) or []
    methods   = entry.get("methods", []) or []
    package   = extract_package(file_path)

    G_sem.add_node(file_path, type="file", label=file_path, package=package)

    for cls in classes:
        class_label = f"{file_path}::{cls}"
        G_sem.add_node(class_label, type="class", label=cls)
        G_sem.add_edge(file_path, class_label, relation="contains")

    for m in methods:
        if isinstance(m, dict):
            method_name = m.get("function", "")
            class_name  = m.get("class", classes[0] if classes else "Unknown")
        else:
            method_name = m
            class_name  = classes[0] if classes else "Unknown"

        if not method_name:
            continue

        method_label = f"{file_path}::{class_name}::{method_name}"
        G_sem.add_node(method_label, type="function", label=method_name,
                       intent="", domain="", role="")
        G_sem.add_edge(file_path, method_label, relation="contains")

# Enrich with annotations
enriched_count = 0
for ann in annotations:
    file_path = ann.get("file")
    function  = ann.get("function")
    if not file_path or not function:
        continue
    for node in list(G_sem.nodes()):
        if node.startswith(file_path) and node.endswith(f"::{function}"):
            G_sem.nodes[node]["intent"] = ann.get("intent") or ""
            G_sem.nodes[node]["domain"] = ann.get("domain_entity") or ""
            G_sem.nodes[node]["role"]   = ann.get("business_role") or ""
            enriched_count += 1

print(f"   Enriched {enriched_count} nodes with annotations")

sanitize_graph(G_sem)
nx.write_graphml(G_sem, GRAPH_DIR / "semantic_enriched.graphml")
nx.write_gml(G_sem,     GRAPH_DIR / "semantic_enriched.gml")
with open(GRAPH_DIR / "semantic_enriched.json", "w") as f:
    json.dump({
        "nodes": [{"id": n, **a} for n, a in G_sem.nodes(data=True)],
        "edges": [{"source": u, "target": v, **a} for u, v, a in G_sem.edges(data=True)]
    }, f, indent=2)

print(f"   Nodes: {G_sem.number_of_nodes()} | Edges: {G_sem.number_of_edges()}")
print("✅ Semantic Graph saved →", GRAPH_DIR)

# -------------------------------------------------
# EMBEDDINGS (on Semantic Graph nodes)
# -------------------------------------------------
print("\n🔄 Loading embedding model...")
tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME)
model     = AutoModel.from_pretrained(MODEL_NAME).to(device)
model.eval()

def mean_pool(out, mask):
    emb  = out.last_hidden_state
    mask = mask.unsqueeze(-1).expand(emb.size()).float()
    return torch.sum(emb * mask, 1) / torch.clamp(mask.sum(1), min=1e-9)

def node_text(n, a):
    return " | ".join(filter(None, [
        a.get("role", ""),
        a.get("intent", ""),
        a.get("domain", ""),
        a.get("label", ""),
        n
    ]))

nodes = list(G_sem.nodes(data=True))
texts = [node_text(n, a) for n, a in nodes]
embeddings = []

for i in tqdm(range(0, len(texts), 8), desc="Embedding"):
    batch = texts[i:i+8]
    enc = tokenizer(batch, padding=True, truncation=True,
                    max_length=256, return_tensors="pt")
    with torch.no_grad():
        out    = model(input_ids=enc["input_ids"].to(device),
                       attention_mask=enc["attention_mask"].to(device))
        pooled = mean_pool(out, enc["attention_mask"].to(device))
        embeddings.extend(pooled.cpu().numpy())

embeddings = np.stack(embeddings)
np.save(EMB_DIR / "node_embeddings.npy", embeddings)

node_index = {n: i for i, (n, _) in enumerate(nodes)}
with open(EMB_DIR / "node_index.json", "w") as f:
    json.dump(node_index, f, indent=2)

print(f"✅ Embeddings saved: shape={embeddings.shape} →", EMB_DIR)

# -------------------------------------------------
# PyTorch Geometric (PyG) EXPORT
# edge_index tensor for GNN training
# -------------------------------------------------
print("\n🔄 Exporting PyG format...")
try:
    import torch
    node_list  = list(node_index.keys())
    edge_index = []
    for u, v in G_sem.edges():
        if u in node_index and v in node_index:
            edge_index.append([node_index[u], node_index[v]])

    if edge_index:
        ei_tensor = torch.tensor(edge_index, dtype=torch.long).t().contiguous()
        torch.save(ei_tensor, PYG_DIR / "edge_index.pt")
        torch.save(torch.tensor(embeddings, dtype=torch.float), PYG_DIR / "node_features.pt")

        # Node labels: 0=file, 1=class, 2=function
        type_map = {"file": 0, "class": 1, "function": 2}
        labels   = [type_map.get(G_sem.nodes[n].get("type", ""), 2) for n in node_list]
        torch.save(torch.tensor(labels, dtype=torch.long), PYG_DIR / "node_labels.pt")

        print(f"   edge_index shape: {ei_tensor.shape}")
        print(f"   node_features shape: {embeddings.shape}")
    print("✅ PyG files saved →", PYG_DIR)
except Exception as e:
    print(f"⚠️  PyG export skipped: {e}")

# -------------------------------------------------
# NEO4J EXPORT: nodes.csv + rels.csv + .cypher
# -------------------------------------------------
print("\n🔄 Exporting Neo4j files...")

# nodes.csv
with open(NEO4J_DIR / "nodes.csv", "w", newline="", encoding="utf-8") as nf:
    writer = csv.writer(nf)
    writer.writerow(["id", "type", "label", "intent", "domain", "role", "package"])
    for n, a in G_sem.nodes(data=True):
        writer.writerow([n, a.get("type",""), a.get("label",""),
                         a.get("intent",""), a.get("domain",""),
                         a.get("role",""), a.get("package","")])

# rels.csv
with open(NEO4J_DIR / "rels.csv", "w", newline="", encoding="utf-8") as rf:
    writer = csv.writer(rf)
    writer.writerow(["start", "type", "end"])
    for u, v, a in G_sem.edges(data=True):
        writer.writerow([u, a.get("relation", "RELATED"), v])

# Cypher import script
cypher_lines = [
    "// Neo4j Cypher Import Script — PetClinic Semantic Graph",
    "// Run via: neo4j-admin database import OR cypher-shell",
    "",
    "// 1. Create constraints",
    "CREATE CONSTRAINT IF NOT EXISTS FOR (n:Node) REQUIRE n.id IS UNIQUE;",
    "",
    "// 2. Load nodes",
    "LOAD CSV WITH HEADERS FROM 'file:///nodes.csv' AS row",
    "MERGE (n:Node {id: row.id})",
    "SET n.type = row.type, n.label = row.label,",
    "    n.intent = row.intent, n.domain = row.domain,",
    "    n.role = row.role, n.package = row.package;",
    "",
    "// 3. Load relationships",
    "LOAD CSV WITH HEADERS FROM 'file:///rels.csv' AS row",
    "MATCH (a:Node {id: row.start})",
    "MATCH (b:Node {id: row.end})",
    "MERGE (a)-[:RELATES {type: row.type}]->(b);",
    "",
    "// 4. Example queries",
    "// Find all Controller classes:",
    "// MATCH (n:Node) WHERE n.label CONTAINS 'Controller' RETURN n;",
    "",
    "// Find all methods of a class:",
    "// MATCH (c:Node {type:'class'})-[:RELATES]->(m:Node {type:'function'}) RETURN c.label, m.label;",
    "",
    "// Find domain-grouped functions:",
    "// MATCH (n:Node {type:'function'}) WHERE n.domain <> '' RETURN n.domain, collect(n.label);",
]
with open(NEO4J_DIR / "import.cypher", "w", encoding="utf-8") as cf:
    cf.write("\n".join(cypher_lines))

print("✅ Neo4j files saved →", NEO4J_DIR)

# -------------------------------------------------
# SUMMARY REPORT
# -------------------------------------------------
print("\n" + "="*55)
print("🎉  PHASE 2.3 — ALL GRAPHS BUILT SUCCESSFULLY")
print("="*55)
print(f"\n📊 Static Code Graph     → {STATIC_DIR}")
print(f"   {G_static.number_of_nodes()} nodes | {G_static.number_of_edges()} edges")
print(f"\n📊 API Call Graph        → {API_DIR}")
print(f"   {G_api.number_of_nodes()} nodes | {G_api.number_of_edges()} edges | {len(endpoints)} endpoints")
print(f"\n📊 Semantic Graph        → {GRAPH_DIR}")
print(f"   {G_sem.number_of_nodes()} nodes | {G_sem.number_of_edges()} edges")
print(f"\n🧠 Embeddings            → {EMB_DIR}")
print(f"   Shape: {embeddings.shape}")
print(f"\n🔥 PyG (GNN-ready)       → {PYG_DIR}")
print(f"   edge_index.pt, node_features.pt, node_labels.pt")
print(f"\n🗄️  Neo4j Export          → {NEO4J_DIR}")
print(f"   nodes.csv, rels.csv, import.cypher")
print("\nFormats: .graphml  .gml  .json  .cypher  .pt  .npy")
print("="*55)