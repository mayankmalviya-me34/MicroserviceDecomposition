"""
generate_graphs.py - CPU + LLM Based (Simple & Stable)
Pure Project ki Dependency Graph + Top 10 High Dependency
"""

import json
from pathlib import Path
import networkx as nx
import torch
from transformers import AutoTokenizer, AutoModelForCausalLM

# ====================== PATHS ======================
BASE = Path(r"F:\Main Project\MICRO\spring-petclinic-microservices-main\spring-petclinic-microservices-main\semantic-analysis")
GRAPH_DIR = BASE / "datasetsCodeT5+" / "graphs" / "spring-petclinic"
NEO_DIR = BASE / "datasetsCodeT5+" / "neo4j"

for d in [GRAPH_DIR, NEO_DIR]:
    d.mkdir(parents=True, exist_ok=True)

SEMANTIC_JSON = GRAPH_DIR / "semantic.json"

# ====================== LLM (CPU) ======================
print("[INFO] Loading LLM on CPU...")
tokenizer = AutoTokenizer.from_pretrained("Qwen/Qwen2.5-Coder-1.5B-Instruct")
llm_model = AutoModelForCausalLM.from_pretrained(
    "Qwen/Qwen2.5-Coder-1.5B-Instruct",
    torch_dtype=torch.float32,
    device_map="cpu",
    trust_remote_code=True
)
llm_model.eval()
print("✅ LLM Loaded on CPU!")

def ask_llm_for_graph(semantic_data):
    prompt = f"""You are an expert microservices architect.

Given the enriched function data, create the **full dependency graph** of the entire project.

Return ONLY valid JSON:

{{
  "nodes": [
    {{"id": "...", "label": "...", "type": "function|class|package|service_candidate", 
      "domain_entity": "...", "business_role": "...", "intent": "..." }}
  ],
  "edges": [
    {{"source": "...", "target": "...", "relation": "calls|defines|related_domain|belongs_to"}}
  ]
}}

Data:
{json.dumps(semantic_data[:60], indent=2)}

JSON:"""

    messages = [{"role": "user", "content": prompt}]
    text = tokenizer.apply_chat_template(messages, tokenize=False, add_generation_prompt=True)
    inputs = tokenizer(text, return_tensors="pt").to("cpu")

    outputs = llm_model.generate(
        **inputs,
        max_new_tokens=2200,
        temperature=0.3,
        do_sample=True,
        top_p=0.85,
        pad_token_id=tokenizer.eos_token_id
    )

    response = tokenizer.decode(outputs[0][inputs.input_ids.shape[1]:], skip_special_tokens=True)

    try:
        start = response.find("{")
        end = response.rfind("}") + 1
        return json.loads(response[start:end])
    except:
        print("[WARN] LLM JSON failed, using simple fallback")
        return {"nodes": [], "edges": []}

# ====================== LOAD DATA ======================
with open(SEMANTIC_JSON, encoding="utf-8") as f:
    semantic = json.load(f)

print(f"[INFO] Loaded {len(semantic)} functions")

# ====================== LLM GRAPH ======================
print("[INFO] LLM ab pura project ka dependency graph bana raha hai...")
graph_data = ask_llm_for_graph(semantic)

G = nx.DiGraph()

for node in graph_data.get("nodes", []):
    G.add_node(node["id"], **node)

for edge in graph_data.get("edges", []):
    G.add_edge(edge["source"], edge["target"], relation=edge.get("relation", "related"))

print(f"[OK] Graph Ready → Nodes: {len(G.nodes())} | Edges: {len(G.edges())}")

# ====================== TOP 10 HIGH DEPENDENCY ======================
print("\n🔥 TOP 10 HIGH DEPENDENCY FUNCTIONS (Pure Project ki sabse zyada depend karta hai):")
sorted_nodes = sorted(
    G.nodes(data=True),
    key=lambda x: G.out_degree(x[0]), 
    reverse=True
)[:10]

for n, attrs in sorted_nodes:
    print(f"  {attrs.get('label', n):30} → Depends on {G.out_degree(n)} things")

# ====================== SAVE FILES ======================
nx.write_gml(G, GRAPH_DIR / "dependency_graph.gml")
nx.write_graphml(G, GRAPH_DIR / "dependency_graph.graphml")

with open(GRAPH_DIR / "graphs.json", "w", encoding="utf-8") as f:
    json.dump({
        "nodes": [{"id": n, **a} for n, a in G.nodes(data=True)],
        "edges": [{"source": u, "target": v, **a} for u, v, a in G.edges(data=True)]
    }, f, indent=2)

print("\n🎉 ALL DONE!")
print(f"Full Dependency Graph saved in: {GRAPH_DIR}")
print("Files: dependency_graph.gml, dependency_graph.graphml, graphs.json")