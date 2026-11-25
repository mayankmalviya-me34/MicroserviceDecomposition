from __future__ import annotations

import csv
import time
from pathlib import Path
from urllib.parse import urljoin

import requests
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry

# ==========================================================================
# CONFIG — Edit these before running
# ==========================================================================

SONAR_URL: str = "http://localhost:9000"

TOKEN: str = "squ_504be067a72779b90b8846d87685253c5134a20d"

# Your root project key — visible in SonarQube dashboard URL or Settings > General
ROOT_PROJECT_KEY: str = "pet_monolithic"

# Output CSV path — change if needed
OUTPUT_CSV: Path = Path(__file__).resolve().parent.parent / "monolithic_sonar_metrics.csv"

# ==========================================================================
# FIXED — Do not change below
# ==========================================================================

METRIC_KEYS: list[str] = [
    "ncloc",
    "complexity",
    "cognitive_complexity",
    "sqale_debt_ratio",
]

COL_HEADERS = [
    "Service",
    "LOC",
    "Cyclomatic Complexity",
    "Cognitive Complexity",
    "Maintainability (%)",
]


def make_session(token: str) -> requests.Session:
    session = requests.Session()
    session.auth = (token, "")
    retry = Retry(total=3, backoff_factor=1, status_forcelist=[500, 502, 503, 504])
    adapter = HTTPAdapter(max_retries=retry)
    session.mount("http://", adapter)
    session.mount("https://", adapter)
    return session


def get_components(session: requests.Session, base_url: str, project_key: str) -> list[dict]:
    """Fetch all file/module level components under the project."""
    components = []
    page = 1
    while True:
        url = urljoin(base_url, "/api/measures/component_tree")
        params = {
            "component": project_key,
            "metricKeys": ",".join(METRIC_KEYS),
            "qualifiers": "FIL,UTS",   # FIL = source files, UTS = unit test files
            "ps": 500,
            "p": page,
        }
        resp = session.get(url, params=params, timeout=30)
        resp.raise_for_status()
        data = resp.json()

        components.extend(data.get("components", []))

        paging = data.get("paging", {})
        total = paging.get("total", 0)
        page_size = paging.get("pageSize", 500)
        if page * page_size >= total:
            break
        page += 1
        time.sleep(0.2)

    return components


def get_project_metrics(session: requests.Session, base_url: str, project_key: str) -> dict:
    """Fetch overall project-level metrics."""
    url = urljoin(base_url, "/api/measures/component")
    params = {
        "component": project_key,
        "metricKeys": ",".join(METRIC_KEYS),
    }
    resp = session.get(url, params=params, timeout=30)
    resp.raise_for_status()
    return resp.json().get("component", {})


def extract_metric(component: dict, key: str) -> str:
    for m in component.get("measures", []):
        if m["metric"] == key:
            return m.get("value", "0")
    return "0"


def maintainability_percent(debt_ratio_str: str) -> str:
    """Convert sqale_debt_ratio (0-100 debt%) to maintainability % (100 - debt%)."""
    try:
        return str(round(100 - float(debt_ratio_str), 2))
    except (ValueError, TypeError):
        return "100.0"


def build_rows(components: list[dict], project_component: dict, project_key: str) -> list[dict]:
    rows = []

    # Overall project row first
    row = {
        "Service": f"{project_key} (Overall)",
        "LOC": extract_metric(project_component, "ncloc"),
        "Cyclomatic Complexity": extract_metric(project_component, "complexity"),
        "Cognitive Complexity": extract_metric(project_component, "cognitive_complexity"),
        "Maintainability (%)": maintainability_percent(
            extract_metric(project_component, "sqale_debt_ratio")
        ),
    }
    rows.append(row)

    # Per-file rows
    for comp in components:
        name = comp.get("name", comp.get("key", "unknown"))
        row = {
            "Service": name,
            "LOC": extract_metric(comp, "ncloc"),
            "Cyclomatic Complexity": extract_metric(comp, "complexity"),
            "Cognitive Complexity": extract_metric(comp, "cognitive_complexity"),
            "Maintainability (%)": maintainability_percent(
                extract_metric(comp, "sqale_debt_ratio")
            ),
        }
        rows.append(row)

    return rows


def save_csv(rows: list[dict], output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w", newline="", encoding="utf-8-sig") as f:
        writer = csv.DictWriter(f, fieldnames=COL_HEADERS)
        writer.writeheader()
        writer.writerows(rows)


def main() -> None:
    print(f"Connecting to SonarQube at {SONAR_URL} ...")
    session = make_session(TOKEN)

    print(f"Fetching project metrics for: {ROOT_PROJECT_KEY}")
    project_component = get_project_metrics(session, SONAR_URL, ROOT_PROJECT_KEY)

    print("Fetching per-file components ...")
    components = get_components(session, SONAR_URL, ROOT_PROJECT_KEY)
    print(f"  Found {len(components)} files/components")

    rows = build_rows(components, project_component, ROOT_PROJECT_KEY)

    save_csv(rows, OUTPUT_CSV)

    print(f"\n✅ Done! CSV saved to: {OUTPUT_CSV}")
    print(f"   Total rows: {len(rows)} (1 overall + {len(components)} files)")

    print("\n--- Preview (first 10 rows) ---")
    print(f"{'Service':<50} {'LOC':>6} {'CC':>6} {'CogC':>6} {'Maint%':>9}")
    print("-" * 80)
    for r in rows[:10]:
        print(
            f"{r['Service']:<50} "
            f"{r['LOC']:>6} "
            f"{r['Cyclomatic Complexity']:>6} "
            f"{r['Cognitive Complexity']:>6} "
            f"{r['Maintainability (%)']:>9}"
        )


if __name__ == "__main__":
    main()