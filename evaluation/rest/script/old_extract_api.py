import os
import re
import sys
import json

# INPUT / OUTPUT
#
# Usage (recommended, 2 projects):
#   python extract_api.py "F:\Main Project\spring-petclinic-microservices-main" existing_api.json
#   python extract_api.py "F:\Main Project\petclinic-microservices" generated_api.json
#
# If no arguments given, the defaults below are used.
# =====================================

DEFAULT_PROJECT_PATH = r"F:\Main Project\spring-petclinic-microservices-main"
DEFAULT_OUTPUT_FILE = r"F:\Main Project\evaluation\rest\existing_api.json"

# # =====================================
# # INPUT / OUTPUT
# #
# # Usage:
# #   python extract_api.py "F:\Projects\old-project" existing_api.json
# #   python extract_api.py "F:\Projects\new-project" generated_api.json
# # =====================================

# DEFAULT_PROJECT_PATH = r"F:\Main Project\petclinic-microservices"
# DEFAULT_OUTPUT_FILE  = "generated_api.json"

if len(sys.argv) >= 3:
    PROJECT_PATH = sys.argv[1]
    OUTPUT_FILE  = sys.argv[2]
else:
    PROJECT_PATH = DEFAULT_PROJECT_PATH
    OUTPUT_FILE  = DEFAULT_OUTPUT_FILE

api_list  = []
seen_keys = set()


# ─────────────────────────────────────
# HELPERS
# ─────────────────────────────────────

def extract_annotation_value(text):
    """Pull path string out of @XxxMapping(...) body."""
    if not text:
        return ""
    m = re.search(r'(value|path)\s*=\s*"([^"]*)"', text)
    if m:
        return m.group(2)
    m = re.search(r'"([^"]*)"', text)
    if m:
        return m.group(1)
    return ""


def extract_http_method_from_annotation(text):
    """For @RequestMapping(method = RequestMethod.GET, ...)."""
    if not text:
        return None
    m = re.search(r'RequestMethod\.(\w+)', text)
    return m.group(1).upper() if m else None


def clean_path(path):
    if not path:
        return "/"
    path = re.sub(r"/+", "/", path)
    if not path.startswith("/"):
        path = "/" + path
    if len(path) > 1 and path.endswith("/"):
        path = path[:-1]
    return path


def join_paths(base, endpoint):
    return clean_path(base + "/" + endpoint) if endpoint else clean_path(base)


# ─────────────────────────────────────
# NEW: extract Java method name
# ─────────────────────────────────────

def extract_method_name(code, annotation_end_pos):
    """
    After an annotation ends, find the NEXT Java method/function name.
    Handles: public ResponseEntity<X> myMethod(  or  public List<X> myMethod(
    We skip modifier keywords and generic return types to get the method name.
    """
    snippet = code[annotation_end_pos: annotation_end_pos + 300]

    # Remove newlines for easier parsing
    snippet = snippet.replace("\n", " ").replace("\r", " ")

    # Pattern: optional annotations, then modifiers, then return type, then METHOD_NAME(
    # We want the identifier right before the first '('
    m = re.search(
        r'(?:public|protected|private|static|final|synchronized|\s)+'
        r'[\w<>\[\],\s]+'          # return type (possibly generic)
        r'\s+(\w+)\s*\(',          # METHOD NAME  <-- capture group 1
        snippet
    )
    if m:
        name = m.group(1)
        # Skip if we accidentally grabbed a keyword
        if name not in ("if", "for", "while", "switch", "catch", "class", "return"):
            return name
    return ""


# ─────────────────────────────────────
# NEW: extract return type
# ─────────────────────────────────────

def extract_return_type(code, annotation_end_pos):
    """
    Extract the return type of the method following an annotation.
    Returns a cleaned string like 'Owner', 'List<Owner>', 'ResponseEntity<Owner>'.
    Also tries to unwrap ResponseEntity<X> -> X for better comparison.
    """
    snippet = code[annotation_end_pos: annotation_end_pos + 300]
    snippet = snippet.replace("\n", " ").replace("\r", " ")

    m = re.search(
        r'(?:public|protected|private|static|final|synchronized|\s)+'
        r'([\w<>\[\],\s]+?)'       # return type  <-- capture group 1
        r'\s+\w+\s*\(',            # method name + opening paren
        snippet
    )
    if not m:
        return ""

    raw = m.group(1).strip()

    # Unwrap ResponseEntity<X>  ->  X
    re_match = re.match(r'ResponseEntity\s*<(.+)>', raw)
    if re_match:
        raw = re_match.group(1).strip()

    # Normalize whitespace inside generics
    raw = re.sub(r'\s+', '', raw)

    return raw


def add_api(entry):
    key = (entry["method"], entry["path"], entry["class"], entry["service"])
    if key not in seen_keys:
        seen_keys.add(key)
        api_list.append(entry)


# ─────────────────────────────────────
# SHORTHAND MAPPINGS
# ─────────────────────────────────────

SHORTHAND = {
    "GET":    "GetMapping",
    "POST":   "PostMapping",
    "PUT":    "PutMapping",
    "DELETE": "DeleteMapping",
    "PATCH":  "PatchMapping",
}


# ─────────────────────────────────────
# SCAN PROJECT
# ─────────────────────────────────────

if not os.path.isdir(PROJECT_PATH):
    print(f"ERROR: project path not found: {PROJECT_PATH}")
    sys.exit(1)

for root, dirs, files in os.walk(PROJECT_PATH):
    for file in files:
        if not file.endswith(".java"):
            continue

        file_path = os.path.join(root, file)

        with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
            code = f.read()

        if "@RestController" not in code:
            continue

        class_name = file.replace(".java", "")

        relative = os.path.relpath(file_path, PROJECT_PATH)
        service  = relative.split(os.sep)[0]

        # Split header (before class decl) from body (class body)
        class_decl = re.search(r'\bclass\s+\w+', code)
        header_code = code[:class_decl.start()] if class_decl else code
        body_code   = code[class_decl.start():] if class_decl else ""

        # Class-level base path
        base_path = ""
        class_map = re.search(r'@RequestMapping\b\s*(?:\((.*?)\))?', header_code, re.S)
        if class_map:
            base_path = extract_annotation_value(class_map.group(1))

        # ── Shorthand annotations ──────────────────────────────────
        for method, annotation in SHORTHAND.items():
            pattern = r'@' + annotation + r'\b\s*(?:\((.*?)\))?'
            for match in re.finditer(pattern, body_code, re.S):
                endpoint   = extract_annotation_value(match.group(1))
                final_path = join_paths(base_path, endpoint)

                ann_end     = match.end()
                func_name   = extract_method_name(body_code, ann_end)
                return_type = extract_return_type(body_code, ann_end)

                add_api({
                    "method":      method,
                    "path":        final_path,
                    "class":       class_name,
                    "function":    func_name,
                    "returnType":  return_type,
                    "service":     service,
                    "file":        file_path,
                })

        # ── Explicit @RequestMapping(method=RequestMethod.X) ───────
        for match in re.finditer(r'@RequestMapping\b\s*(?:\((.*?)\))?', body_code, re.S):
            inner       = match.group(1)
            http_method = extract_http_method_from_annotation(inner)
            if not http_method:
                continue
            endpoint   = extract_annotation_value(inner)
            final_path = join_paths(base_path, endpoint)

            ann_end     = match.end()
            func_name   = extract_method_name(body_code, ann_end)
            return_type = extract_return_type(body_code, ann_end)

            add_api({
                "method":      http_method,
                "path":        final_path,
                "class":       class_name,
                "function":    func_name,
                "returnType":  return_type,
                "service":     service,
                "file":        file_path,
            })


# ─────────────────────────────────────
# SAVE
# ─────────────────────────────────────

with open(OUTPUT_FILE, "w") as f:
    json.dump(api_list, f, indent=4)

print("=" * 40)
print("API Extraction Done")
print("=" * 40)
print("Project :", PROJECT_PATH)
print("Total   :", len(api_list), "APIs")
print("Saved   :", OUTPUT_FILE)