#!/usr/bin/env python3
# generate_ontology.py (updated robust version)
import os, re, json, argparse
from rdflib import Graph, Namespace, Literal
from rdflib.namespace import RDF, RDFS, OWL, XSD

# ---------------------------
# CLI / Base defaults
# ---------------------------
parser = argparse.ArgumentParser(description="Generate OWL ontology from semantic outputs")
parser.add_argument('--base', '-b', default=r"F:\Main Project\MICRO\spring-petclinic-microservices-main\spring-petclinic-microservices-main\semantic-analysis", help='Base path')
parser.add_argument('--project', '-n', default="spring-petclinic", help='Project name')
args = parser.parse_args()

BASE = os.path.abspath(args.base)
PROJECT_NAME = args.project

# Input files
SEMANTIC_JSON = os.path.join(BASE, "datasetsCodeT5+", "graphs", PROJECT_NAME, "semantic.json")
if not os.path.exists(SEMANTIC_JSON):
    alt = os.path.join(BASE, "datasetsCodeT5+", "semantic.json")
    if os.path.exists(alt): SEMANTIC_JSON = alt

ANNOTATIONS_JSON = None
for f in ["spring_microservice_semantic_tags.json", "spring_semantic_tags.json"]:
    path = os.path.join(BASE, "datasetsCodeT5+", "annotations", f)
    if os.path.exists(path):
        ANNOTATIONS_JSON = path
        break

API_JSON = None
for f in ["spring_microservice_api_map.json", "api_semantic.json", "api_map.json"]:
    path = os.path.join(BASE, "datasetsCodeT5+", "api", f)
    if os.path.exists(path):
        API_JSON = path
        break

# Output directories
OUT_DIR = os.path.join(BASE, "datasetsCodeT5+", "ontologies")
os.makedirs(OUT_DIR, exist_ok=True)
OWL_OUT = os.path.join(OUT_DIR, f"{PROJECT_NAME}.owl")
MAPPING_TTL = os.path.join(OUT_DIR, "code_to_ontology.ttl")
SPARQL_OUT = os.path.join(OUT_DIR, "sparql_example.json")

print("Paths used:\n", SEMANTIC_JSON, ANNOTATIONS_JSON, API_JSON, OUT_DIR)

# ---------------------------
# Namespaces
# ---------------------------
EX = Namespace(f"http://example.org/{PROJECT_NAME}#")
VOC = Namespace(f"http://example.org/{PROJECT_NAME}/vocab#")
CODE = Namespace(f"http://example.org/{PROJECT_NAME}/code#")
API = Namespace(f"http://example.org/{PROJECT_NAME}/api#")
SCHEMA = Namespace("http://schema.org/")

# Create RDF graph
g = Graph()
for ns, prefix in [(EX,"ex"), (VOC,"voc"), (CODE,"code"), (API,"api"), (SCHEMA,"schema")]:
    g.bind(prefix, ns)
g.bind("rdfs", RDFS); g.bind("owl", OWL); g.bind("xsd", XSD)

# ---------------------------
# Utilities
# ---------------------------
def safe_local(name):
    if not name: return "unknown"
    s = str(name)
    s = re.sub(r'[\s/\\{}():,"\'\[\]]+', "_", s)
    s = re.sub(r'__+', "_", s).strip("_")
    return s if s else "unknown"

def camel_split_tokens(s):
    if not s: return []
    parts = re.findall(r'[A-Z]?[a-z]+|[A-Z]+(?![a-z])|\d+', s)
    return [t.lower() for p in parts for t in p.split('_') if t]

def load_json_flex(path):
    if not path or not os.path.exists(path): return []
    try:
        with open(path,"r",encoding="utf-8") as f: data=json.load(f)
        if isinstance(data,list): return data
        if isinstance(data,dict):
            if 'records' in data and isinstance(data['records'], list): return data['records']
            return [data]
        return [{"text":str(data)}]
    except: return []

# ---------------------------
# Load input data
# ---------------------------
semantic_data = load_json_flex(SEMANTIC_JSON)
annotations_data = load_json_flex(ANNOTATIONS_JSON) if ANNOTATIONS_JSON else []
api_data = load_json_flex(API_JSON) if API_JSON else []

# ---------------------------
# Core ontology classes
# ---------------------------
def add_core_schema():
    classes = ["DomainEntity","BusinessRole","Function","Service","APIEndpoint","Process","Action","Comment"]
    props = ["implementedBy","actsOnEntity","hasBusinessRole","exposesEndpoint","belongsToService",
             "mapsToOntology","hasIntentLiteral","hasSummary"]
    for c in classes: g.add((VOC[c], RDF.type, OWL.Class))
    for p in props: g.add((VOC[p], RDF.type, OWL.ObjectProperty if "has" not in p else OWL.DatatypeProperty))
add_core_schema()

# ---------------------------
# Domain terms extraction
# ---------------------------
domain_terms=set()
# semantic classes/methods/entities
for e in semantic_data:
    if isinstance(e,dict):
        for cls in e.get("classes",[]):
            if isinstance(cls,dict): name=cls.get("name") or cls.get("className"); domain_terms.add(name) if name else None
            elif isinstance(cls,str): domain_terms.add(cls)
        for m in e.get("methods",[]):
            if isinstance(m,dict): de=m.get("domain_entity") or m.get("domainEntity"); domain_terms.add(de) if de else None
        for ent in e.get("entities",[])+e.get("domain_terms",[])+e.get("domainEntities",[]): domain_terms.add(str(ent))
# annotations
for a in annotations_data:
    if isinstance(a,dict):
        for c in a.get("comments",[]):
            for n in c.get("nlp_tags",{}).get("nouns",[]): domain_terms.add(str(n).capitalize())
# API paths
for spec in api_data:
    apis=[]
    if isinstance(spec,dict): apis = spec.get("apis") or spec.get("paths") or spec.get("endpoints") or []
    elif isinstance(spec,list): apis=spec
    for a in apis:
        path = a.get("path") or a.get("endpoint") or a.get("url") or ""
        for p in [x for x in path.split("/") if x and not x.startswith("{")]:
            if len(p)>1 and p.lower() not in ("api","v1","v2","service"): domain_terms.add(p.capitalize())
if not domain_terms: domain_terms.update(["Owner","Pet","Visit","Vet","Appointment","Bill","Clinic","Customer"])
for term in sorted(domain_terms): g.add((VOC[safe_local(term)], RDF.type, OWL.Class),); g.add((VOC[safe_local(term)], RDFS.label, Literal(term)))

# ---------------------------
# Functions / code artifacts
# ---------------------------
def mk_file_node(file_path):
    fnode = CODE[safe_local(os.path.basename(file_path) if file_path else "unknown_file")]
    g.add((fnode,RDF.type,CODE.CodeArtifact))
    g.add((fnode,RDFS.label,Literal(os.path.basename(file_path) if file_path else "unknown_file")))
    return fnode

for e in semantic_data:
    if not isinstance(e,dict): continue
    file_path = e.get("file") or e.get("source_file")
    fnode = mk_file_node(file_path)
    summary = e.get("summary") or e.get("semantics") or None
    for m in e.get("methods",[]):
        if isinstance(m,str):
            fname=m
            func_uri=CODE[safe_local(os.path.basename(file_path)+"_"+fname)]
            g.add((func_uri,RDF.type,VOC.Function))
            g.add((func_uri,RDFS.label,Literal(fname)))
            g.add((func_uri,VOC.implementedBy,fnode))
            if summary: g.add((func_uri,VOC.hasSummary,Literal(summary)))
        elif isinstance(m,dict):
            fname = m.get("name") or "unnamed"
            func_uri = CODE[safe_local(os.path.basename(file_path)+"_"+fname)]
            g.add((func_uri,RDF.type,VOC.Function))
            g.add((func_uri,RDFS.label,Literal(fname)))
            g.add((func_uri,VOC.implementedBy,fnode))
            for prop in [("business_role","hasBusinessRole"),("domain_entity","actsOnEntity"),("intent","hasIntentLiteral")]:
                val = m.get(prop[0]) or m.get(prop[0].capitalize())
                if val:
                    node = VOC[safe_local(str(val).capitalize())] if "Entity" in prop[1] else VOC[safe_local(str(val))]
                    g.add((node,RDF.type,VOC.BusinessRole if "Role" in prop[1] else VOC.Function if "Function" in prop[1] else VOC.Action))
                    g.add((func_uri,VOC[prop[1]],node))
            if summary: g.add((func_uri,VOC.hasSummary,Literal(summary)))

# ---------------------------
# Annotations mapping
# ---------------------------
for a in annotations_data:
    if not isinstance(a,dict): continue
    file_rel=a.get("file")
    for c in a.get("comments",[]):
        text=c.get("comment") or ""
        tags=c.get("nlp_tags",{})
        comment_node=EX[safe_local("comment_"+(text[:40] or "c"))]
        g.add((comment_node,RDF.type,VOC.Comment))
        g.add((comment_node,RDFS.label,Literal(text)))
        if file_rel:
            g.add((comment_node,VOC.mapsToOntology,CODE[safe_local(os.path.basename(file_rel))]))
        for n in tags.get("nouns",[]): g.add((comment_node,VOC.mapsToOntology,VOC[safe_local(str(n).capitalize())]))
        for v in tags.get("verbs",[]): g.add((comment_node,VOC.mapsToOntology,VOC[safe_local(str(v))]))
        for ent in tags.get("entities",[]):
            et=ent.get("text",""); lbl=ent.get("label","")
            if et: enode=VOC[safe_local(et)]; g.add((enode,RDF.type,OWL.Class)); g.add((comment_node,VOC.mapsToOntology,enode))
            if lbl: g.add((enode,RDFS.comment,Literal(lbl)))

# ---------------------------
# API endpoints mapping
# ---------------------------
for spec in api_data:
    apis=[]
    if isinstance(spec,dict): apis = spec.get("apis") or spec.get("paths") or spec.get("endpoints") or []
    elif isinstance(spec,list): apis=spec
    for a in apis:
        path=a.get("path") or a.get("endpoint") or a.get("url") or ""
        method=(a.get("method") or "GET").upper()
        label=f"{method} {path}"; ep=API[safe_local(label)]
        g.add((ep,RDF.type,VOC.APIEndpoint)); g.add((ep,RDFS.label,Literal(label)))
        crud="UNKNOWN"
        if method=="GET": crud="Read" if "{" in path else "List"
        elif method=="POST": crud="Create"
        elif method in ("PUT","PATCH"): crud="Update"
        elif method=="DELETE": crud="Delete"
        g.add((ep,VOC.hasIntentLiteral,Literal(crud)))
        toks=[t for t in re.split(r'[/{}]+',path) if t and not t.isdigit()]
        for tk in toks:
            for dt in list(domain_terms):
                if tk.lower() in dt.lower() or dt.lower() in tk.lower(): g.add((ep,VOC.exposesEndpoint,VOC[safe_local(dt)]))

# ---------------------------
# Mapping TTL (file/method -> ontology)
# ---------------------------
mapping_graph=Graph()
mapping_graph.bind("voc",VOC); mapping_graph.bind("code",CODE)
for e in semantic_data:
    if not isinstance(e,dict): continue
    file_path=e.get("file"); file_node=CODE[safe_local(os.path.basename(file_path))] if file_path else None
    if file_node: mapping_graph.add((file_node,RDF.type,CODE.File))
    for c in e.get("classes",[]): cname=c.get("name") if isinstance(c,dict) else c; mapping_graph.add((file_node,VOC.mapsToOntology,VOC[safe_local(cname)])) if cname else None
    for m in e.get("methods",[]):
        mname = m.get("name") if isinstance(m,dict) else m
        if mname: mapping_graph.add((CODE[safe_local(os.path.basename(file_path)+"_"+str(mname))],RDF.type,VOC.Function)); mapping_graph.add((CODE[safe_local(os.path.basename(file_path)+"_"+str(mname))],VOC.mapsToOntology,file_node))

# ---------------------------
# Save outputs
# ---------------------------
g.serialize(OWL_OUT,format="pretty-xml"); print("Saved OWL:",OWL_OUT)
mapping_graph.serialize(MAPPING_TTL,format="turtle"); print("Saved mapping TTL:",MAPPING_TTL)

# SPARQL example
sparql_q=f"""SELECT ?s ?p ?o WHERE {{ ?s ?p ?o . FILTER(STRSTARTS(STR(?s),"http://example.org/{PROJECT_NAME}/code")) }} LIMIT 200"""
try:
    res=mapping_graph.query(sparql_q); out=[{"s":str(r[0]),"p":str(r[1]),"o":str(r[2])} for r in res]
    with open(SPARQL_OUT,"w",encoding="utf-8") as fh: json.dump(out,fh,indent=2)
    print("Saved SPARQL example:",SPARQL_OUT)
except Exception as e: print("SPARQL query failed:",e)
