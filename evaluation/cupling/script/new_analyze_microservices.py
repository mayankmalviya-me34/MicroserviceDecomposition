#!/usr/bin/env python3
"""
RUN IN TERMINAL: python .\new_analyze_microservices.py ""F:/Main Project/petclinic-microservices"  


Microservice Architecture Metrics Analyzer
============================================
Computes for each microservice:
  - Cohesion (LCOM-based: how related the methods of a service are via shared fields)
  - Coupling (Ca + Ce combined -> total incoming + outgoing service-level dependencies)
  - Cosine Similarity (TWO kinds):
        1) Text-based: TF-IDF over identifiers (class/method/field/variable names) per service
        2) Dependency-based: one-hot vector of "which services this service depends on"
  - Depends On (list of other services this service imports / uses)

Usage:
    python analyze_microservices.py "F:/Main Project/petclinic-microservices"
    python analyze_microservices.py "F:/Main Project/spring-petclinic-microservices-main"

Output (written next to the script, in a folder named after the project):
    <project_name>_metrics.csv              -> Service, Cohesion, Coupling, Depends_On
    <project_name>_text_cosine_similarity.csv     -> pairwise matrix (identifier/TF-IDF based)
    <project_name>_dependency_cosine_similarity.csv -> pairwise matrix (depends-on based)
    <project_name>_full_report.json         -> everything combined, for inspection / reuse

No external dependencies required (pure Python, uses only standard library).
"""

import os
import re
import sys
import json
import math
import csv
from collections import defaultdict, Counter

# --------------------------------------------------------------------------------------
# CONFIG
# --------------------------------------------------------------------------------------

# Folders that should never be treated as "source" (build artifacts, IDE, git, tests optional)
IGNORE_DIRS = {
    "target", "build", ".git", ".idea", ".mvn", "node_modules",
    ".devcontainer", ".github", "docs", "scripts", "docker"
}

# If True, test sources (src/test/java) are excluded from analysis (recommended: True)
EXCLUDE_TESTS = True

JAVA_FILE_RE = re.compile(r".*\.java$")

# Regex helpers for very lightweight "parsing" (no external AST lib needed)
PACKAGE_RE = re.compile(r"^\s*package\s+([\w\.]+)\s*;", re.MULTILINE)
IMPORT_RE = re.compile(r"^\s*import\s+(?:static\s+)?([\w\.\*]+)\s*;", re.MULTILINE)
CLASS_RE = re.compile(
    r"\b(?:public|private|protected)?\s*(?:static\s+)?(?:final\s+)?"
    r"(?:class|interface|enum|record)\s+(\w+)"
)
METHOD_RE = re.compile(
    r"\b(?:public|private|protected)\s+(?:static\s+)?(?:final\s+)?(?:synchronized\s+)?"
    r"[\w<>\[\],\s\?]+?\s+(\w+)\s*\([^;{}]*\)\s*(?:throws\s+[\w,\s\.]+)?\s*\{"
)
FIELD_RE = re.compile(
    r"\b(?:public|private|protected)\s+(?:static\s+)?(?:final\s+)?"
    r"([\w<>\[\],\.]+)\s+(\w+)\s*[=;]"
)
IDENTIFIER_RE = re.compile(r"[A-Za-z_][A-Za-z0-9_]*")

# Words to drop from identifier text (java/lang noise that doesn't help similarity)
STOPWORDS = {
    "public", "private", "protected", "static", "final", "void", "class",
    "interface", "extends", "implements", "import", "package", "return",
    "this", "new", "if", "else", "for", "while", "throws", "throw", "try",
    "catch", "finally", "int", "long", "double", "float", "boolean", "char",
    "String", "List", "Map", "Set", "Optional", "Override", "the", "and",
    "get", "set", "is", "id", "to", "of", "a", "an", "in", "on", "at"
}


def split_camel_case(identifier: str):
    """Split camelCase / PascalCase / snake_case identifiers into lowercase tokens."""
    s = re.sub(r"(?<=[a-z0-9])(?=[A-Z])", " ", identifier)
    s = re.sub(r"(?<=[A-Z])(?=[A-Z][a-z])", " ", s)
    s = s.replace("_", " ")
    return [t.lower() for t in s.split() if t]


# --------------------------------------------------------------------------------------
# STEP 1: Discover microservice modules
# --------------------------------------------------------------------------------------

def discover_services(root_path: str):
    """
    A 'service' = any direct subdirectory of root_path that contains a pom.xml
    and a src/main/java tree. Returns {service_name: service_path}.
    """
    services = {}
    for entry in sorted(os.listdir(root_path)):
        full = os.path.join(root_path, entry)
        if not os.path.isdir(full):
            continue
        if entry in IGNORE_DIRS or entry.startswith("."):
            continue
        pom = os.path.join(full, "pom.xml")
        src_main_java = os.path.join(full, "src", "main", "java")
        if os.path.isfile(pom) and os.path.isdir(src_main_java):
            services[entry] = full
    return services


def collect_java_files(service_path: str):
    files = []
    for base in ("main", "test") if not EXCLUDE_TESTS else ("main",):
        java_root = os.path.join(service_path, "src", base, "java")
        if not os.path.isdir(java_root):
            continue
        for dirpath, dirnames, filenames in os.walk(java_root):
            dirnames[:] = [d for d in dirnames if d not in IGNORE_DIRS]
            for fname in filenames:
                if fname.endswith(".java"):
                    files.append(os.path.join(dirpath, fname))
    return files


# --------------------------------------------------------------------------------------
# STEP 2: Parse each service -> classes, methods, fields, imports, identifiers
# --------------------------------------------------------------------------------------

def parse_service(service_path: str):
    """
    Returns a dict with:
      classes: list[str]
      methods: list[(class_hint, method_name, field_usage_set)]
      fields: list[(class_hint, field_name)]
      imports: set[str]   (fully qualified import strings)
      identifier_tokens: list[str]  (all tokenized identifiers, for TF-IDF)
      function_count: int
    """
    classes = []
    methods = []  # (method_name, set_of_fields_used_in_body) - simplistic LCOM proxy
    fields = []
    imports = set()
    identifier_tokens = []

    java_files = collect_java_files(service_path)

    for jf in java_files:
        try:
            with open(jf, "r", encoding="utf-8", errors="ignore") as fh:
                content = fh.read()
        except Exception:
            continue

        # imports
        for m in IMPORT_RE.finditer(content):
            imports.add(m.group(1))

        # classes
        file_classes = CLASS_RE.findall(content)
        classes.extend(file_classes)

        # fields (very rough: top-level field declarations across whole file)
        file_fields = [fm[1] for fm in FIELD_RE.findall(content)]
        for f in file_fields:
            fields.append((file_classes[0] if file_classes else jf, f))

        # methods + crude "body" field usage for cohesion proxy
        for m in METHOD_RE.finditer(content):
            method_name = m.group(1)
            # grab a window of text after the match as a stand-in for the method body
            start = m.end()
            # find matching-ish end by counting braces (cheap heuristic, capped length)
            depth = 1
            end = start
            max_scan = min(len(content), start + 4000)
            while end < max_scan and depth > 0:
                if content[end] == "{":
                    depth += 1
                elif content[end] == "}":
                    depth -= 1
                end += 1
            body = content[start:end]
            used_fields = {f for f in file_fields if re.search(r"\b" + re.escape(f) + r"\b", body)}
            methods.append((method_name, used_fields))

        # identifier tokens for TF-IDF (class names, method names, field names, var-ish names)
        for ident in IDENTIFIER_RE.findall(content):
            if ident in STOPWORDS or len(ident) <= 2:
                continue
            identifier_tokens.extend(split_camel_case(ident))

    return {
        "classes": sorted(set(classes)),
        "methods": methods,
        "fields": fields,
        "imports": imports,
        "identifier_tokens": [t for t in identifier_tokens if t not in STOPWORDS],
        "function_count": len(methods),
    }


# --------------------------------------------------------------------------------------
# STEP 3: Cohesion (LCOM4-ish proxy, normalized to 0..1, higher = more cohesive)
# --------------------------------------------------------------------------------------

def compute_cohesion(service_data: dict) -> float:
    """
    Proxy for cohesion: for every pair of methods, do they share at least one field?
    cohesion = (pairs_sharing_a_field) / (total_pairs)
    -> 1.0 means every method-pair shares a field (very cohesive)
    -> 0.0 means no methods share any field (very poor cohesion, LCOM-style)
    Falls back to a neutral 0.5 if there's not enough data (e.g. < 2 methods or no fields).
    """
    methods = service_data["methods"]
    n = len(methods)
    if n < 2:
        return 1.0 if n == 1 else 0.0

    total_pairs = 0
    shared_pairs = 0
    for i in range(n):
        for j in range(i + 1, n):
            total_pairs += 1
            if methods[i][1] & methods[j][1]:  # intersection of used fields
                shared_pairs += 1

    if total_pairs == 0:
        return 0.0
    return round(shared_pairs / total_pairs, 3)


# --------------------------------------------------------------------------------------
# STEP 4: Depends On (service-level dependency graph from imports)
# --------------------------------------------------------------------------------------

def infer_service_package_roots(services: dict, parsed: dict):
    """
    Build a map: package_prefix -> service_name, by scanning each service's java files
    for their 'package' declarations and taking the shortest common root.
    """
    pkg_to_service = {}
    for svc_name, svc_path in services.items():
        java_files = collect_java_files(svc_path)
        pkgs = set()
        for jf in java_files:
            try:
                with open(jf, "r", encoding="utf-8", errors="ignore") as fh:
                    content = fh.read(2000)  # package decl is always near top
            except Exception:
                continue
            m = PACKAGE_RE.search(content)
            if m:
                pkgs.add(m.group(1))
        if pkgs:
            # take the shortest package as the "root" representative for this service
            root = min(pkgs, key=len)
            pkg_to_service[root] = svc_name
    return pkg_to_service


def compute_depends_on(services: dict, parsed: dict, pkg_to_service: dict):
    """
    For each service, look at its imports. If an import's package matches (startswith)
    another service's root package, record a dependency (excluding self).
    """
    depends_on = defaultdict(set)
    for svc_name, data in parsed.items():
        for imp in data["imports"]:
            for root_pkg, owner_service in pkg_to_service.items():
                if owner_service == svc_name:
                    continue
                if imp.startswith(root_pkg):
                    depends_on[svc_name].add(owner_service)
    return {k: sorted(v) for k, v in depends_on.items()}


# --------------------------------------------------------------------------------------
# STEP 5: Coupling = Ca + Ce (combined incoming + outgoing service-level edges)
# --------------------------------------------------------------------------------------

def compute_coupling(services: dict, depends_on: dict):
    coupling = {}
    ca = defaultdict(int)  # afferent: who depends ON me
    ce = defaultdict(int)  # efferent: how many I depend on

    for svc, deps in depends_on.items():
        ce[svc] = len(deps)
        for d in deps:
            ca[d] += 1

    for svc in services:
        coupling[svc] = ca[svc] + ce[svc]
    return coupling, ca, ce


# --------------------------------------------------------------------------------------
# STEP 6a: Cosine similarity - TEXT / TF-IDF based (identifiers)
# --------------------------------------------------------------------------------------

def build_tfidf_vectors(parsed: dict):
    """Standard TF-IDF over the bag of identifier tokens per service."""
    services = list(parsed.keys())
    doc_term_counts = {s: Counter(parsed[s]["identifier_tokens"]) for s in services}

    # document frequency
    df = Counter()
    for s in services:
        for term in doc_term_counts[s]:
            df[term] += 1

    n_docs = len(services)
    vectors = {}
    for s in services:
        tf = doc_term_counts[s]
        total_terms = sum(tf.values()) or 1
        vec = {}
        for term, count in tf.items():
            tf_score = count / total_terms
            idf_score = math.log((n_docs + 1) / (df[term] + 1)) + 1  # smoothed idf
            vec[term] = tf_score * idf_score
        vectors[s] = vec
    return vectors


def cosine_similarity_sparse(vec_a: dict, vec_b: dict) -> float:
    if not vec_a or not vec_b:
        return 0.0
    common = set(vec_a) & set(vec_b)
    dot = sum(vec_a[t] * vec_b[t] for t in common)
    norm_a = math.sqrt(sum(v * v for v in vec_a.values()))
    norm_b = math.sqrt(sum(v * v for v in vec_b.values()))
    if norm_a == 0 or norm_b == 0:
        return 0.0
    return round(dot / (norm_a * norm_b), 4)


# --------------------------------------------------------------------------------------
# STEP 6b: Cosine similarity - DEPENDENCY based (one-hot "depends on" vectors)
# --------------------------------------------------------------------------------------

def build_dependency_vectors(services: dict, depends_on: dict):
    svc_names = sorted(services.keys())
    vectors = {}
    for s in svc_names:
        deps = set(depends_on.get(s, []))
        vec = {other: (1.0 if other in deps else 0.0) for other in svc_names if other != s}
        vectors[s] = vec
    return vectors


def cosine_similarity_dense(vec_a: dict, vec_b: dict) -> float:
    keys = set(vec_a) | set(vec_b)
    if not keys:
        return 0.0
    dot = sum(vec_a.get(k, 0.0) * vec_b.get(k, 0.0) for k in keys)
    norm_a = math.sqrt(sum(v * v for v in vec_a.values()))
    norm_b = math.sqrt(sum(v * v for v in vec_b.values()))
    if norm_a == 0 or norm_b == 0:
        return 0.0
    return round(dot / (norm_a * norm_b), 4)


def pairwise_matrix(services_list, vectors, sim_fn):
    matrix = {}
    for a in services_list:
        matrix[a] = {}
        for b in services_list:
            if a == b:
                matrix[a][b] = 1.0
            else:
                matrix[a][b] = sim_fn(vectors[a], vectors[b])
    return matrix


# --------------------------------------------------------------------------------------
# STEP 7: Output writers
# --------------------------------------------------------------------------------------

def write_main_csv(out_path, services_list, cohesion, coupling, depends_on, ca, ce, cosine_text_avg, cosine_dep_avg):
    with open(out_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow([
            "Service", "Cohesion", "Coupling(Ca+Ce)", "Ca(Incoming)", "Ce(Outgoing)",
            "Avg_Cosine_Similarity_Text", "Avg_Cosine_Similarity_Dependency", "Depends_On"
        ])
        for svc in services_list:
            writer.writerow([
                svc,
                cohesion.get(svc, 0.0),
                coupling.get(svc, 0),
                ca.get(svc, 0),
                ce.get(svc, 0),
                cosine_text_avg.get(svc, 0.0),
                cosine_dep_avg.get(svc, 0.0),
                ", ".join(depends_on.get(svc, [])) if depends_on.get(svc) else "-"
            ])


def write_matrix_csv(out_path, services_list, matrix):
    with open(out_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["Service"] + services_list)
        for a in services_list:
            writer.writerow([a] + [matrix[a][b] for b in services_list])


def print_console_table(services_list, cohesion, coupling, depends_on):
    print("\n{:<22} {:<10} {:<10} {:<40}".format("Service", "Cohesion", "Coupling", "Depends_On"))
    print("-" * 90)
    for svc in services_list:
        deps = ", ".join(depends_on.get(svc, [])) if depends_on.get(svc) else "-"
        print("{:<22} {:<10} {:<10} {:<40}".format(svc, cohesion.get(svc, 0.0), coupling.get(svc, 0), deps))
    print()


# --------------------------------------------------------------------------------------
# MAIN
# --------------------------------------------------------------------------------------

def analyze_project(root_path: str, output_dir: str):
    root_path = os.path.abspath(root_path)
    project_name = os.path.basename(root_path.rstrip("\\/"))
    print(f"\n=== Analyzing project: {project_name} ===")
    print(f"Root: {root_path}")

    services = discover_services(root_path)
    if not services:
        print("No services found (looked for subfolders with pom.xml + src/main/java).")
        return

    print(f"Found {len(services)} services: {', '.join(services.keys())}")

    parsed = {svc: parse_service(path) for svc, path in services.items()}
    pkg_to_service = infer_service_package_roots(services, parsed)
    depends_on = compute_depends_on(services, parsed, pkg_to_service)
    coupling, ca, ce = compute_coupling(services, depends_on)
    cohesion = {svc: compute_cohesion(parsed[svc]) for svc in services}

    services_list = sorted(services.keys())

    # Cosine similarity - text/TF-IDF
    text_vectors = build_tfidf_vectors(parsed)
    text_matrix = pairwise_matrix(services_list, text_vectors, cosine_similarity_sparse)

    # Cosine similarity - dependency vectors
    dep_vectors = build_dependency_vectors(services, depends_on)
    dep_matrix = pairwise_matrix(services_list, dep_vectors, cosine_similarity_dense)

    # average similarity per service (excluding self) -> single summary number for main table
    def avg_excluding_self(matrix, svc):
        others = [matrix[svc][o] for o in services_list if o != svc]
        return round(sum(others) / len(others), 4) if others else 0.0

    cosine_text_avg = {svc: avg_excluding_self(text_matrix, svc) for svc in services_list}
    cosine_dep_avg = {svc: avg_excluding_self(dep_matrix, svc) for svc in services_list}

    os.makedirs(output_dir, exist_ok=True)
    main_csv = os.path.join(output_dir, f"{project_name}_metrics.csv")
    text_sim_csv = os.path.join(output_dir, f"{project_name}_text_cosine_similarity.csv")
    dep_sim_csv = os.path.join(output_dir, f"{project_name}_dependency_cosine_similarity.csv")
    json_path = os.path.join(output_dir, f"{project_name}_full_report.json")

    write_main_csv(main_csv, services_list, cohesion, coupling, depends_on, ca, ce, cosine_text_avg, cosine_dep_avg)
    write_matrix_csv(text_sim_csv, services_list, text_matrix)
    write_matrix_csv(dep_sim_csv, services_list, dep_matrix)

    full_report = {
        "project": project_name,
        "root_path": root_path,
        "services": services_list,
        "cohesion": cohesion,
        "coupling": coupling,
        "ca_incoming": dict(ca),
        "ce_outgoing": dict(ce),
        "depends_on": depends_on,
        "function_count": {s: parsed[s]["function_count"] for s in services_list},
        "classes": {s: parsed[s]["classes"] for s in services_list},
        "cosine_similarity_text_matrix": text_matrix,
        "cosine_similarity_dependency_matrix": dep_matrix,
        "cosine_similarity_text_avg": cosine_text_avg,
        "cosine_similarity_dependency_avg": cosine_dep_avg,
    }
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(full_report, f, indent=2)

    print_console_table(services_list, cohesion, coupling, depends_on)
    print(f"Saved -> {main_csv}")
    print(f"Saved -> {text_sim_csv}")
    print(f"Saved -> {dep_sim_csv}")
    print(f"Saved -> {json_path}")

    return full_report


def main():
    if len(sys.argv) < 2:
        print("Usage: python analyze_microservices.py <project_root_path> [<project_root_path_2> ...]")
        print(r'Example: python analyze_microservices.py "F:\Main Project\petclinic-microservices"')
        sys.exit(1)

    output_dir = os.path.join(os.getcwd(), "..\\new_microservice_metrics_output")
    reports = []
    for project_path in sys.argv[1:]:
        report = analyze_project(project_path, output_dir)
        if report:
            reports.append(report)

    if len(reports) == 2:
        write_comparison(reports[0], reports[1], output_dir)


def write_comparison(report_a: dict, report_b: dict, output_dir: str):
    """If exactly 2 projects were passed, write a side-by-side comparison CSV."""
    path = os.path.join(output_dir, "comparison_summary.csv")
    with open(path, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["Metric", report_a["project"], report_b["project"]])

        def avg(d):
            return round(sum(d.values()) / len(d), 3) if d else 0.0

        writer.writerow(["Service Count", len(report_a["services"]), len(report_b["services"])])
        writer.writerow(["Avg Cohesion", avg(report_a["cohesion"]), avg(report_b["cohesion"])])
        writer.writerow(["Avg Coupling", avg(report_a["coupling"]), avg(report_b["coupling"])])
        writer.writerow([
            "Avg Cosine Similarity (Text)",
            avg(report_a["cosine_similarity_text_avg"]),
            avg(report_b["cosine_similarity_text_avg"])
        ])
        writer.writerow([
            "Avg Cosine Similarity (Dependency)",
            avg(report_a["cosine_similarity_dependency_avg"]),
            avg(report_b["cosine_similarity_dependency_avg"])
        ])
        total_deps_a = sum(len(v) for v in report_a["depends_on"].values())
        total_deps_b = sum(len(v) for v in report_b["depends_on"].values())
        writer.writerow(["Total Depends_On edges", total_deps_a, total_deps_b])

    print(f"\nSaved comparison -> {path}")


if __name__ == "__main__":
    main()