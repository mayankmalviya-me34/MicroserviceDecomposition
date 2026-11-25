#!/usr/bin/env python3
"""
Compare Microservice Metrics - Wide Format (New vs Old, side by side per metric)
====================================================================================
RUN IN TERMINAL:  python .\\compare_from_csv.py

Reads the two already-generated metrics CSVs, matches equivalent services
between the two projects (using SERVICE_MAP below), and produces a WIDE
table like:

    Service        | Cohesion        | Coupling        | ...
                    | new   | old     | new   | old     | ...

Edit SERVICE_MAP if service names don't match what you expect.
"""

import os
import csv

# --------------------------------------------------------------------------------------
# STATIC PATHS  <-- only thing you should normally need to edit
# --------------------------------------------------------------------------------------

PROJECT_A_CSV = r"..\new_microservice_metrics_output\petclinic-microservices_metrics.csv"
PROJECT_B_CSV = r"..\old_microservice_metrics_output\spring-petclinic-microservices-main_metrics.csv"

PROJECT_A_LABEL = "new"   # petclinic-microservices
PROJECT_B_LABEL = "old"   # spring-petclinic-microservices-main

OUTPUT_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..\\comparison_output")

# --------------------------------------------------------------------------------------
# SERVICE MAPPING: maps each "new" project service -> equivalent "old" project service
# Edit this if the auto-guess below doesn't match your actual service names.
# Services with no equivalent (e.g. admin-server, config-server, genai-service) are
# left unmatched and shown with "-" on the missing side.
# --------------------------------------------------------------------------------------

SERVICE_MAP = {
    "api-gateway": "spring-petclinic-api-gateway",
    "app-service": None,                 # no direct equivalent in old project
    "discovery-server": "spring-petclinic-discovery-server",
    "model-service": None,               # shared domain models; old project has no separate model module
    "owner-service": "spring-petclinic-customers-service",
    "system-service": "spring-petclinic-admin-server",
    "vet-service": "spring-petclinic-vets-service",
}

# Old-project services that have NO match in the new project at all
# (still listed at the bottom of the table with "-" on the new side)
UNMATCHED_OLD_EXTRAS = [
    "spring-petclinic-config-server",
    "spring-petclinic-genai-service",
    "spring-petclinic-visits-service",
]

# --------------------------------------------------------------------------------------
# Metrics to show in the wide table, in order: (display_label, csv_column_name)
# --------------------------------------------------------------------------------------
METRICS = [
    ("Cohesion", "Cohesion"),
    ("Coupling", "Coupling(Ca+Ce)"),
    ("Ca_Incoming", "Ca(Incoming)"),
    ("Ce_Outgoing", "Ce(Outgoing)"),
    ("Cosine_Sim_Text", "Avg_Cosine_Similarity_Text"),
    ("Cosine_Sim_Dependency", "Avg_Cosine_Similarity_Dependency"),
]

# Depends_On is text, not a number - shown as its own pair of columns at the end
EXTRA_TEXT_FIELD = ("Depends_On", "Depends_On")


def read_metrics_csv(path: str):
    if not os.path.isfile(path):
        print(f"ERROR: file not found -> {path}")
        return None
    rows = {}
    with open(path, "r", encoding="utf-8", newline="") as f:
        reader = csv.DictReader(f)
        for row in reader:
            rows[row["Service"]] = row
    return rows


def get_metric(rows, service_name, csv_col):
    if service_name is None or rows is None or service_name not in rows:
        return None
    val = rows[service_name].get(csv_col, "")
    try:
        return float(val)
    except (TypeError, ValueError):
        return val if val else None


def build_pairs():
    """Returns list of (new_service_name_or_None, old_service_name_or_None)."""
    pairs = []
    for new_svc, old_svc in SERVICE_MAP.items():
        pairs.append((new_svc, old_svc))
    for old_extra in UNMATCHED_OLD_EXTRAS:
        pairs.append((None, old_extra))
    return pairs


def fmt(val):
    if val is None:
        return "-"
    if isinstance(val, float):
        return f"{val:.3f}"
    return str(val)


def write_wide_csv(out_path, pairs, rows_a, rows_b):
    with open(out_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)

        # header row 1: metric group names spanning 2 columns each
        header1 = ["Service (new)", "Service (old)"]
        header2 = ["", ""]
        for metric_label, _ in METRICS:
            header1.extend([metric_label, ""])
            header2.extend([PROJECT_A_LABEL, PROJECT_B_LABEL])
        header1.extend([EXTRA_TEXT_FIELD[0], ""])
        header2.extend([PROJECT_A_LABEL, PROJECT_B_LABEL])
        writer.writerow(header1)
        writer.writerow(header2)

        for new_svc, old_svc in pairs:
            row = [new_svc or "-", old_svc or "-"]
            for _, csv_col in METRICS:
                val_a = get_metric(rows_a, new_svc, csv_col)
                val_b = get_metric(rows_b, old_svc, csv_col)
                row.extend([fmt(val_a), fmt(val_b)])
            dep_a = get_metric(rows_a, new_svc, EXTRA_TEXT_FIELD[1])
            dep_b = get_metric(rows_b, old_svc, EXTRA_TEXT_FIELD[1])
            row.extend([fmt(dep_a), fmt(dep_b)])
            writer.writerow(row)


def print_wide_console_table(pairs, rows_a, rows_b):
    col_w_new = 20
    col_w_old = 38
    col_w_val = 9

    line1 = f"{'Service (new)':<{col_w_new}}{'Service (old)':<{col_w_old}}"
    line2 = f"{'':<{col_w_new}}{'':<{col_w_old}}"
    for metric_label, _ in METRICS:
        total_w = col_w_val * 2
        line1 += f"{metric_label:^{total_w}}"
        line2 += f"{PROJECT_A_LABEL:<{col_w_val}}{PROJECT_B_LABEL:<{col_w_val}}"
    print(line1)
    print(line2)
    print("-" * (col_w_new + col_w_old + col_w_val * 2 * len(METRICS)))

    for new_svc, old_svc in pairs:
        line = f"{(new_svc or '-'):<{col_w_new}}{(old_svc or '-'):<{col_w_old}}"
        for _, csv_col in METRICS:
            val_a = get_metric(rows_a, new_svc, csv_col)
            val_b = get_metric(rows_b, old_svc, csv_col)
            line += f"{fmt(val_a):<{col_w_val}}{fmt(val_b):<{col_w_val}}"
        print(line)
    print()
    print("--- Depends_On ---")
    for new_svc, old_svc in pairs:
        dep_a = get_metric(rows_a, new_svc, EXTRA_TEXT_FIELD[1])
        dep_b = get_metric(rows_b, old_svc, EXTRA_TEXT_FIELD[1])
        label = f"{(new_svc or '-')} / {(old_svc or '-')}"
        print(f"  {label}")
        print(f"      new: {fmt(dep_a)}")
        print(f"      old: {fmt(dep_b)}")
    print()


def main():
    print("Project A (new) CSV:", PROJECT_A_CSV)
    print("Project B (old) CSV:", PROJECT_B_CSV)

    rows_a = read_metrics_csv(PROJECT_A_CSV)
    rows_b = read_metrics_csv(PROJECT_B_CSV)

    if rows_a is None or rows_b is None:
        print("\nCannot compare - one or both CSV files are missing. Check the paths at the top of this script.")
        return

    pairs = build_pairs()

    print("\n=== WIDE COMPARISON TABLE (new vs old) ===\n")
    print_wide_console_table(pairs, rows_a, rows_b)

    os.makedirs(OUTPUT_DIR, exist_ok=True)
    wide_csv_path = os.path.join(OUTPUT_DIR, "wide_comparison_table.csv")
    write_wide_csv(wide_csv_path, pairs, rows_a, rows_b)
    print(f"Saved -> {wide_csv_path}")


if __name__ == "__main__":
    main()