"""
new_project_sonar_metrics.py
----------------------
Fetches metrics from an already-analyzed SonarQube project
and saves them to a CSV file. No Maven re-analysis is run.

Usage:
    python fetch_sonar_metrics.py

Edit the CONFIG section below before running.
"""

from __future__ import annotations

import csv
import sys
from pathlib import Path
from typing import Optional
from urllib.parse import urljoin

import requests
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry

# ===========================================================================
# CONFIG — Edit these before running
# ===========================================================================

SONAR_URL: str = "http://localhost:9000"

TOKEN: str = "squ_dcf494aedc3d7c3fcda63c7f10fa796edc9612d4"

# Your root project key — visible in SonarQube dashboard URL or Settings > General
# Example: "org.springframework.samples:spring-petclinic-microservices"
ROOT_PROJECT_KEY: str = "petclinic"

# Output CSV path — change if needed
OUTPUT_CSV: Path = Path(__file__).resolve().parent.parent / "new_sonar_metrics.csv"

# ===========================================================================
# FIXED — Do not change below
# ===========================================================================

METRIC_KEYS: list[str] = [
    "ncloc",
    "complexity",
    "cognitive_complexity",
    "sqale_debt_ratio",
]

CSV_HEADERS: list[str] = [
    "Service",
    "LOC",
    "Cyclomatic Complexity",
    "Cognitive Complexity",
    "Maintainability (%)",
]

HTTP_TIMEOUT: int = 30


# ---------------------------------------------------------------------------
# HTTP session
# ---------------------------------------------------------------------------

def build_session(token: str) -> requests.Session:
    """Build a requests session with auth and auto-retry."""
    session = requests.Session()
    session.auth = (token, "")
    retry = Retry(
        total=5,
        backoff_factor=1.0,
        status_forcelist=[429, 500, 502, 503, 504],
        allowed_methods=["GET"],
    )
    adapter = HTTPAdapter(max_retries=retry)
    session.mount("http://", adapter)
    session.mount("https://", adapter)
    return session


# ---------------------------------------------------------------------------
# Step 1 — Validate config
# ---------------------------------------------------------------------------

def validate_config() -> None:
    """Exit early if token or project key is empty."""
    if not TOKEN or not TOKEN.strip():
        print("ERROR: TOKEN is empty. Set your SonarQube token in CONFIG.")
        sys.exit(1)
    if not ROOT_PROJECT_KEY or not ROOT_PROJECT_KEY.strip():
        print("ERROR: ROOT_PROJECT_KEY is empty. Set it in CONFIG.")
        sys.exit(1)


# ---------------------------------------------------------------------------
# Step 2 — Check SonarQube
# ---------------------------------------------------------------------------

def check_sonarqube(session: requests.Session) -> None:
    """
    Verify SonarQube is reachable.

    Uses /api/system/status (no admin rights needed) instead of
    /api/system/health (requires system-admin — causes 403 on most tokens).
    """
    print("Checking SonarQube...")
    url = urljoin(SONAR_URL, "/api/system/status")
    try:
        resp = session.get(url, timeout=HTTP_TIMEOUT)
        if resp.status_code == 401:
            print("ERROR: Invalid token (HTTP 401). Check your TOKEN.")
            sys.exit(1)
        if resp.status_code == 403:
            # Should not happen for /status, but guard anyway
            print("ERROR: Access denied (HTTP 403). Check token permissions.")
            sys.exit(1)
        resp.raise_for_status()
        status = resp.json().get("status", "DOWN")
        if status != "UP":
            print(f"SonarQube not ready (status: {status})")
            sys.exit(1)
        print(f"SonarQube Running (status: {status})")
    except requests.exceptions.ConnectionError:
        print("ERROR: Cannot connect to SonarQube at", SONAR_URL)
        sys.exit(1)
    except requests.exceptions.Timeout:
        print("ERROR: SonarQube connection timed out.")
        sys.exit(1)


# ---------------------------------------------------------------------------
# Step 3 — Discover all modules under the root project
# ---------------------------------------------------------------------------

def get_all_modules(session: requests.Session) -> list[dict]:
    """
    Fetch top-level service modules from SonarQube using component_tree API.

    Uses qualifier=DIR and filters to only direct children of root project
    (path contains no '/' — e.g. "owner-service" yes, "owner-service/src" no).
    This gives exactly one row per microservice in the CSV.
    """
    url = urljoin(SONAR_URL, "/api/measures/component_tree")
    all_components: list[dict] = []
    page = 1
    page_size = 100

    while True:
        resp = session.get(
            url,
            params={
                "component": ROOT_PROJECT_KEY,
                "qualifiers": "DIR",
                "metricKeys": "ncloc",
                "strategy": "all",
                "ps": page_size,
                "p": page,
            },
            timeout=HTTP_TIMEOUT,
        )

        if resp.status_code == 404:
            print(f"  ERROR: Project '{ROOT_PROJECT_KEY}' not found in SonarQube.")
            print("  Verify ROOT_PROJECT_KEY in CONFIG section.")
            sys.exit(1)
        if resp.status_code == 403:
            print("  ERROR: Token lacks Browse permission on this project.")
            sys.exit(1)

        resp.raise_for_status()
        data = resp.json()
        components: list[dict] = data.get("components", [])
        all_components.extend(components)

        paging = data.get("paging", {})
        total = paging.get("total", 0)
        if page * page_size >= total or not components:
            break
        page += 1

    # Filter: only direct children of root — path has NO slash
    # "owner-service"          -> keep  (top-level service)
    # "owner-service/src/main" -> skip  (nested sub-directory)
    top_level = [
        {"key": c["key"], "name": c["name"]}
        for c in all_components
        if "/" not in c.get("path", "")
    ]

    if not top_level:
        print(f"  No top-level modules found. Falling back to root project.")
        top_level = [{"key": ROOT_PROJECT_KEY, "name": ROOT_PROJECT_KEY}]

    return top_level


# ---------------------------------------------------------------------------
# Step 4 — Fetch metrics for one component
# ---------------------------------------------------------------------------

def fetch_metrics_for_component(
    session: requests.Session,
    component_key: str,
    display_name: str,
) -> Optional[dict[str, str]]:
    """
    Call /api/measures/component for one component.
    Returns a raw metric dict or None on failure.
    """
    url = urljoin(SONAR_URL, "/api/measures/component")
    try:
        resp = session.get(
            url,
            params={
                "component": component_key,
                "metricKeys": ",".join(METRIC_KEYS),
            },
            timeout=HTTP_TIMEOUT,
        )
    except requests.exceptions.RequestException as exc:
        print(f"  WARNING: Network error for '{display_name}': {exc}")
        return None

    if resp.status_code == 404:
        print(f"  WARNING: Component not found in SonarQube: '{component_key}'")
        return None
    if not resp.ok:
        print(f"  WARNING: API error {resp.status_code} for '{display_name}'")
        return None

    data = resp.json()
    component = data.get("component")
    if not component:
        print(f"  WARNING: Empty response for '{display_name}'")
        return None

    measures: list[dict] = component.get("measures", [])
    return {m["metric"]: m.get("value", "0") for m in measures}


# ---------------------------------------------------------------------------
# Step 5 — Build CSV row from raw metrics
# ---------------------------------------------------------------------------

def build_row(name: str, metric_map: dict[str, str]) -> dict[str, str]:
    """Convert raw metric values into a formatted CSV row."""
    def safe_int(key: str) -> str:
        try:
            return str(int(float(metric_map.get(key, "0"))))
        except ValueError:
            return "0"

    def maintainability() -> str:
        try:
            debt = float(metric_map.get("sqale_debt_ratio", "0"))
            return f"{round(100.0 - debt, 2):.2f}"
        except ValueError:
            return "100.00"

    return {
        "Service": name,
        "LOC": safe_int("ncloc"),
        "Cyclomatic Complexity": safe_int("complexity"),
        "Cognitive Complexity": safe_int("cognitive_complexity"),
        "Maintainability (%)": maintainability(),
    }


# ---------------------------------------------------------------------------
# Step 6 — Save CSV
# ---------------------------------------------------------------------------

def save_csv(rows: list[dict[str, str]], output_path: Path) -> None:
    """Write rows to CSV with UTF-8 BOM (Excel-friendly on Windows)."""
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w", newline="", encoding="utf-8-sig") as f:
        writer = csv.DictWriter(f, fieldnames=CSV_HEADERS)
        writer.writeheader()
        writer.writerows(rows)


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main() -> None:
    print("=" * 50)
    print("  SONARQUBE METRICS FETCHER")
    print("=" * 50)
    print()

    validate_config()

    session = build_session(TOKEN)
    check_sonarqube(session)
    print()

    print(f"Root project : {ROOT_PROJECT_KEY}")
    print("Discovering modules...")
    modules = get_all_modules(session)
    print(f"Found {len(modules)} module(s):")
    for m in modules:
        print(f"  - {m['name']}  ({m['key']})")
    print()

    print("Fetching metrics...")
    rows: list[dict[str, str]] = []

    for module in modules:
        key = module["key"]
        name = module["name"]
        print(f"  Fetching: {name}")
        metric_map = fetch_metrics_for_component(session, key, name)
        if metric_map is not None:
            rows.append(build_row(name, metric_map))

    if not rows:
        print("\nERROR: No metrics collected. Nothing to save.")
        sys.exit(1)

    print()
    print("Saving CSV...")
    save_csv(rows, OUTPUT_CSV)

    print()
    print("=" * 50)
    print("Done!")
    print(f"CSV saved at:\n{OUTPUT_CSV.resolve()}")
    print("=" * 50)
    print()

    # Print preview table
    print(f"{'Service':<30} {'LOC':>6} {'CC':>6} {'CogC':>6} {'Maint%':>10}")
    print("-" * 65)
    for row in rows:
        print(
            f"{row['Service']:<30} "
            f"{row['LOC']:>6} "
            f"{row['Cyclomatic Complexity']:>6} "
            f"{row['Cognitive Complexity']:>6} "
            f"{row['Maintainability (%)']:>10}"
        )


if __name__ == "__main__":
    main()