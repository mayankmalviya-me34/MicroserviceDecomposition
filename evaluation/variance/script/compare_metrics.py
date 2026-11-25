"""
compare_metrics.py
-------------------
Compares two SonarQube metrics CSV files (old monolith vs new
decomposed-microservices). Produces a single combined CSV report
containing:
    1. Old project — full service-wise table
    2. New project — full service-wise table
    3. Summary comparison — totals/averages with difference and % change

File paths are hardcoded below in the CONFIG section — just run:
    python compare_metrics.py
"""

from __future__ import annotations

import csv
from pathlib import Path
from typing import Any

# ===========================================================================
# CONFIG — Edit these paths if your files move
# ===========================================================================

OLD_CSV: Path = Path(r"F:\Main Project\evaluation\variance\old_sonar_metrics.csv")
NEW_CSV: Path = Path(r"F:\Main Project\evaluation\variance\new_sonar_metrics.csv")
OUTPUT_CSV: Path = Path(r"F:\Main Project\evaluation\variance\comparison_result.csv")

OLD_LABEL: str = "Old Project (Monolith Services)"
NEW_LABEL: str = "New Project (Decomposed Microservices)"

# ===========================================================================

ROW_COLUMNS = ["Service", "LOC", "Cyclomatic Complexity", "Cognitive Complexity", "Maintainability (%)"]


def read_csv(path: Path) -> list[dict[str, str]]:
    """Read a SonarQube metrics CSV into a list of row dicts."""
    with open(path, newline="", encoding="utf-8-sig") as f:
        reader = csv.DictReader(f)
        return list(reader)


def to_float(value: str) -> float:
    """Safely convert a string to float, default 0.0 on failure."""
    try:
        return float(value)
    except (ValueError, TypeError):
        return 0.0


def compute_summary(rows: list[dict[str, str]]) -> dict[str, float]:
    """Compute aggregate metrics for a set of service rows."""
    if not rows:
        return {
            "total_loc": 0.0,
            "avg_cyclomatic": 0.0,
            "avg_cognitive": 0.0,
            "avg_maintainability": 0.0,
            "service_count": 0,
        }

    total_loc = sum(to_float(r.get("LOC", "0")) for r in rows)
    avg_cyclomatic = sum(to_float(r.get("Cyclomatic Complexity", "0")) for r in rows) / len(rows)
    avg_cognitive = sum(to_float(r.get("Cognitive Complexity", "0")) for r in rows) / len(rows)
    avg_maintainability = sum(to_float(r.get("Maintainability (%)", "0")) for r in rows) / len(rows)

    return {
        "total_loc": total_loc,
        "avg_cyclomatic": avg_cyclomatic,
        "avg_cognitive": avg_cognitive,
        "avg_maintainability": avg_maintainability,
        "service_count": len(rows),
    }


def percent_change(old: float, new: float) -> str:
    """Compute percentage change from old to new, formatted as a string."""
    if old == 0:
        return "N/A"
    change = ((new - old) / old) * 100
    sign = "+" if change >= 0 else ""
    return f"{sign}{change:.2f}%"


def print_table(rows: list[dict[str, str]], title: str) -> None:
    """Print a formatted table of service-level metrics to console."""
    print(f"\n{title}")
    print("-" * 80)
    print(f"{'Service':<35} {'LOC':>6} {'CC':>6} {'CogC':>6} {'Maint%':>9}")
    print("-" * 80)
    for r in rows:
        print(
            f"{r.get('Service', ''):<35} "
            f"{r.get('LOC', '0'):>6} "
            f"{r.get('Cyclomatic Complexity', '0'):>6} "
            f"{r.get('Cognitive Complexity', '0'):>6} "
            f"{r.get('Maintainability (%)', '0'):>9}"
        )


def write_section_header(writer: Any, title: str) -> None:
    """Write a section title row followed by a blank line."""
    writer.writerow([title])


def write_service_table(writer: Any, rows: list[dict[str, str]], summary: dict[str, float]) -> None:
    """Write a service-wise table block (header + rows + totals row)."""
    writer.writerow(ROW_COLUMNS)
    for r in rows:
        writer.writerow([
            r.get("Service", ""),
            r.get("LOC", "0"),
            r.get("Cyclomatic Complexity", "0"),
            r.get("Cognitive Complexity", "0"),
            r.get("Maintainability (%)", "0"),
        ])
    writer.writerow([
        "TOTAL / AVERAGE",
        f"{summary['total_loc']:.2f}",
        f"{summary['avg_cyclomatic']:.2f}",
        f"{summary['avg_cognitive']:.2f}",
        f"{summary['avg_maintainability']:.2f}",
    ])


def write_summary_table(
    writer: Any,
    old_summary: dict[str, float],
    new_summary: dict[str, float],
) -> None:
    """Write the summary comparison table block."""
    writer.writerow(["Metric", "Old", "New", "Difference", "% Change"])

    metrics = [
        ("Total LOC", old_summary["total_loc"], new_summary["total_loc"]),
        ("Avg Cyclomatic Complexity", old_summary["avg_cyclomatic"], new_summary["avg_cyclomatic"]),
        ("Avg Cognitive Complexity", old_summary["avg_cognitive"], new_summary["avg_cognitive"]),
        ("Avg Maintainability (%)", old_summary["avg_maintainability"], new_summary["avg_maintainability"]),
        ("Number of Services", old_summary["service_count"], new_summary["service_count"]),
    ]

    for label, old_val, new_val in metrics:
        diff = new_val - old_val
        pct = percent_change(old_val, new_val)
        writer.writerow([label, f"{old_val:.2f}", f"{new_val:.2f}", f"{diff:.2f}", pct])


def save_full_report(
    old_rows: list[dict[str, str]],
    new_rows: list[dict[str, str]],
    old_summary: dict[str, float],
    new_summary: dict[str, float],
    output_path: Path,
) -> None:
    """Save a single CSV containing both project tables and the summary comparison."""
    with open(output_path, "w", newline="", encoding="utf-8-sig") as f:
        writer = csv.writer(f)

        write_section_header(writer, OLD_LABEL)
        write_service_table(writer, old_rows, old_summary)
        writer.writerow([])

        write_section_header(writer, NEW_LABEL)
        write_service_table(writer, new_rows, new_summary)
        writer.writerow([])

        write_section_header(writer, "Summary Comparison")
        write_summary_table(writer, old_summary, new_summary)


def main() -> None:
    """Entry point: read two CSVs, compute comparison, print and save full report."""
    if not OLD_CSV.exists():
        print(f"ERROR: File not found: {OLD_CSV}")
        return
    if not NEW_CSV.exists():
        print(f"ERROR: File not found: {NEW_CSV}")
        return

    old_rows = read_csv(OLD_CSV)
    new_rows = read_csv(NEW_CSV)

    print_table(old_rows, f"{OLD_LABEL} ({OLD_CSV.name}) — {len(old_rows)} services")
    print_table(new_rows, f"{NEW_LABEL} ({NEW_CSV.name}) — {len(new_rows)} services")

    old_summary = compute_summary(old_rows)
    new_summary = compute_summary(new_rows)

    print("\n" + "=" * 80)
    print("SUMMARY COMPARISON")
    print("=" * 80)
    print(f"{'Metric':<30} {'Old':>12} {'New':>12} {'Difference':>12} {'% Change':>12}")
    print("-" * 80)

    metrics = [
        ("Total LOC", old_summary["total_loc"], new_summary["total_loc"]),
        ("Avg Cyclomatic Complexity", old_summary["avg_cyclomatic"], new_summary["avg_cyclomatic"]),
        ("Avg Cognitive Complexity", old_summary["avg_cognitive"], new_summary["avg_cognitive"]),
        ("Avg Maintainability (%)", old_summary["avg_maintainability"], new_summary["avg_maintainability"]),
        ("Number of Services", old_summary["service_count"], new_summary["service_count"]),
    ]

    for label, old_val, new_val in metrics:
        diff = new_val - old_val
        pct = percent_change(old_val, new_val)
        print(f"{label:<30} {old_val:>12.2f} {new_val:>12.2f} {diff:>12.2f} {pct:>12}")

    save_full_report(old_rows, new_rows, old_summary, new_summary, OUTPUT_CSV)

    print("\n" + "=" * 80)
    print(f"Full comparison report saved to: {OUTPUT_CSV}")
    print("=" * 80)


if __name__ == "__main__":
    main()