// parse_functions.js
const Parser = require("tree-sitter");
const JavaScript = require("tree-sitter-javascript");
const fs = require("fs");
const path = require("path");

// === 1. Setup parser ===
const parser = new Parser();
parser.setLanguage(JavaScript);

// === 2. Project paths ===
const ROOT_DIR = path.resolve(__dirname);
const SERVICE_DIRS = ["customer", "products", "shopping"]; // aapke microservices
const OUT_DIR = path.join(ROOT_DIR, "datasets", "graphs", "spring-petclinic");
if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR, { recursive: true });

const SEMANTIC_JSON_PATH = path.join(OUT_DIR, "semantic.json");
const STATIC_GML_PATH = path.join(OUT_DIR, "static.gml");

// === 3. Get JS/JSX files recursively ===
function getJSFiles(dir) {
  let files = [];
  fs.readdirSync(dir).forEach(f => {
    const full = path.join(dir, f);
    if (fs.statSync(full).isDirectory()) files = files.concat(getJSFiles(full));
    else if (f.endsWith(".js") || f.endsWith(".jsx")) files.push(full);
  });
  return files;
}

// === 4. Parse file for functions and calls ===
function parseFile(filePath) {
  const code = fs.readFileSync(filePath, "utf-8");
  const tree = parser.parse(code);
  const funcs = [];

  function traverse(node, parentFunc = null) {
    if (["function_declaration", "method_definition", "arrow_function"].includes(node.type)) {
      let name = node.childForFieldName("name")?.text || `func_${node.startPosition.row}`;
      funcs.push({ name, calls: [], file: filePath });
      parentFunc = name;
    }
    if (node.type === "call_expression" && parentFunc) {
      const called = node.childForFieldName("function");
      if (called) funcs.find(f => f.name === parentFunc).calls.push(called.text);
    }
    node.namedChildren.forEach(c => traverse(c, parentFunc));
  }

  traverse(tree.rootNode);
  return funcs;
}

// === 5. Scan all services ===
let allFunctions = [];
SERVICE_DIRS.forEach(dir => {
  const fullPath = path.join(ROOT_DIR, dir);
  if (fs.existsSync(fullPath)) {
    const files = getJSFiles(fullPath);
    files.forEach(f => allFunctions = allFunctions.concat(parseFile(f)));
  }
});

// === 6. Save semantic.json ===
fs.writeFileSync(SEMANTIC_JSON_PATH, JSON.stringify({ functions: allFunctions }, null, 2));
console.log("✅ semantic.json saved");

// === 7. Generate static.gml (duplicate-safe) ===
const { execSync } = require("child_process");

// Create temporary Python script for static.gml generation
const tmpPy = `
import json
import networkx as nx

with open(r"${SEMANTIC_JSON_PATH}", "r", encoding="utf-8") as f:
    data = json.load(f)

G = nx.DiGraph()
seen = {}

for func in data["functions"]:
    node_label = func["name"]
    if node_label in seen:
        node_label = f"{node_label}_{seen[node_label]}"
        seen[func["name"]] += 1
    else:
        seen[func["name"]] = 1

    G.add_node(node_label, file=func["file"])
    for callee in func["calls"]:
        callee_label = callee
        if callee in seen:
            callee_label = f"{callee}_{seen[callee]-1}"
        G.add_edge(node_label, callee_label)

nx.write_gml(G, r"${STATIC_GML_PATH}")
print("✅ static.gml saved")
`;

const tmpFilePath = path.join(ROOT_DIR, "tmp_generate_gml.py");
fs.writeFileSync(tmpFilePath, tmpPy);

// Run Python script
execSync(`python "${tmpFilePath}"`, { stdio: "inherit" });

// Delete temporary Python file
fs.unlinkSync(tmpFilePath);
