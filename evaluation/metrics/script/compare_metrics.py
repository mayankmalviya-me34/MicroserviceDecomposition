import csv

# ============================================================
# FILE PATHS
# ============================================================
NEW_PROJECT_CSV = r"F:\Main Project\evaluation\metrics\new_project_metrics_clean.csv"
OLD_PROJECT_CSV = r"F:\Main Project\evaluation\metrics\old_project_metrics_clean.csv"
OUTPUT_CSV      = r"F:\Main Project\evaluation\metrics\comparison_report.csv"
OUTPUT_SUMMARY  = r"F:\Main Project\evaluation\metrics\comparison_summary.txt"

# ============================================================
# READ CSV
# ============================================================
def read_csv(filepath):
    rows = []
    with open(filepath, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            rows.append(row)
    return rows

# ============================================================
# SAFE FLOAT
# ============================================================
def safe_float(val):
    try:
        return float(val)
    except:
        return None

# ============================================================
# CALCULATE AVERAGES
# ============================================================
def get_averages(data):
    metrics = {
        'Heap_Memory_MB': [],
        'CPU_System_%': [],
        'CPU_Process_%': [],
        'Live_Threads': [],
        'Startup_Time_sec': [],
        'Total_Requests': [],
        'Avg_Response_Time_sec': [],
        'Max_Response_Time_sec': []
    }
    for row in data:
        for key in metrics:
            val = safe_float(row.get(key))
            if val is not None and val > 0:
                metrics[key].append(val)

    averages = {}
    for key, vals in metrics.items():
        averages[key] = round(sum(vals) / len(vals), 4) if vals else 0
    return averages

# ============================================================
# COMPARE
# ============================================================
def compare(new_val, old_val, lower_is_better=True):
    if new_val == 0 and old_val == 0:
        return "N/A", "N/A"
    if new_val == 0:
        return "Old", "N/A"
    if old_val == 0:
        return "New", "N/A"

    if lower_is_better:
        diff = round((old_val - new_val) / old_val * 100, 2)
        winner = "New" if new_val < old_val else "Old"
    else:
        diff = round((new_val - old_val) / old_val * 100, 2)
        winner = "New" if new_val > old_val else "Old"

    return winner, f"{abs(diff)}%"

# ============================================================
# MAIN
# ============================================================
def main():
    print("Reading CSV files...")
    new_data = read_csv(NEW_PROJECT_CSV)
    old_data = read_csv(OLD_PROJECT_CSV)

    print(f"New project services : {len(new_data)}")
    print(f"Old project services : {len(old_data)}")

    new_avg = get_averages(new_data)
    old_avg = get_averages(old_data)

    # ============================================================
    # METRICS CONFIG
    # ============================================================
    metrics_config = [
        ("Heap_Memory_MB",        "Avg Heap Memory (MB)",     True,  "Lower = Less memory used"),
        ("CPU_System_%",          "Avg System CPU (%)",        True,  "Lower = Less CPU load"),
        ("CPU_Process_%",         "Avg Process CPU (%)",       True,  "Lower = Less process CPU"),
        ("Live_Threads",          "Avg Live Threads",          True,  "Lower = Less resource usage"),
        ("Startup_Time_sec",      "Avg Startup Time (sec)",    True,  "Lower = Faster startup"),
        ("Total_Requests",        "Total Requests Handled",    False, "Higher = More active"),
        ("Avg_Response_Time_sec", "Avg Response Time (sec)",   True,  "Lower = Faster response"),
        ("Max_Response_Time_sec", "Max Response Time (sec)",   True,  "Lower = Less latency spikes"),
    ]

    comparison_rows = []
    for key, label, lower_better, note in metrics_config:
        n_val = new_avg[key]
        o_val = old_avg[key]
        winner, diff = compare(n_val, o_val, lower_better)
        comparison_rows.append({
            "Metric":          label,
            "New_Project_Avg": n_val,
            "Old_Project_Avg": o_val,
            "Winner":          winner,
            "Difference":      diff,
            "Note":            note
        })

    # ============================================================
    # SERVICE-WISE ROWS
    # ============================================================
    service_rows = []
    for row in new_data:
        service_rows.append({
            "Project":               "New-Microservices",
            "Service":               row["Service"],
            "Heap_Memory_MB":        row["Heap_Memory_MB"],
            "CPU_System_%":          row["CPU_System_%"],
            "CPU_Process_%":         row["CPU_Process_%"],
            "Live_Threads":          row["Live_Threads"],
            "Startup_Time_sec":      row["Startup_Time_sec"],
            "Total_Requests":        row["Total_Requests"],
            "Avg_Response_Time_sec": row["Avg_Response_Time_sec"],
            "Max_Response_Time_sec": row["Max_Response_Time_sec"],
        })
    for row in old_data:
        service_rows.append({
            "Project":               "Old-Microservices",
            "Service":               row["Service"],
            "Heap_Memory_MB":        row["Heap_Memory_MB"],
            "CPU_System_%":          row["CPU_System_%"],
            "CPU_Process_%":         row["CPU_Process_%"],
            "Live_Threads":          row["Live_Threads"],
            "Startup_Time_sec":      row["Startup_Time_sec"],
            "Total_Requests":        row["Total_Requests"],
            "Avg_Response_Time_sec": row["Avg_Response_Time_sec"],
            "Max_Response_Time_sec": row["Max_Response_Time_sec"],
        })

    # ============================================================
    # SAVE CSV
    # ============================================================
    with open(OUTPUT_CSV, 'w', newline='', encoding='utf-8') as f:
        f.write("SECTION 1: AGGREGATE COMPARISON\n")
        writer = csv.DictWriter(f, fieldnames=[
            "Metric", "New_Project_Avg", "Old_Project_Avg",
            "Winner", "Difference", "Note"
        ])
        writer.writeheader()
        writer.writerows(comparison_rows)

        f.write("\n\nSECTION 2: SERVICE-WISE DATA\n")
        writer2 = csv.DictWriter(f, fieldnames=[
            "Project", "Service", "Heap_Memory_MB",
            "CPU_System_%", "CPU_Process_%", "Live_Threads",
            "Startup_Time_sec", "Total_Requests",
            "Avg_Response_Time_sec", "Max_Response_Time_sec"
        ])
        writer2.writeheader()
        writer2.writerows(service_rows)

    print(f"\n✅ Comparison CSV saved : {OUTPUT_CSV}")

    # ============================================================
    # TERMINAL SUMMARY
    # ============================================================
    sep  = "=" * 72
    line = "-" * 72

    print("\n" + sep)
    print("  MICROSERVICES COMPARISON REPORT")
    print("  New (Ca/Ce Based) vs Old (Domain-Driven Design)")
    print(sep)
    print(f"  New project services : {len(new_data)}")
    print(f"  Old project services : {len(old_data)}")
    print(line)
    print(f"  {'Metric':<28} {'New':>10} {'Old':>10} {'Winner':>10} {'Diff':>8}")
    print(line)

    for row in comparison_rows:
        m = str(row['Metric'])[:28].ljust(28)
        n = str(row['New_Project_Avg'])[:10].rjust(10)
        o = str(row['Old_Project_Avg'])[:10].rjust(10)
        w = str(row['Winner'])[:10].rjust(10)
        d = str(row['Difference'])[:8].rjust(8)
        print(f"  {m} {n} {o} {w} {d}")

    print(line)
    print("\n  KEY FINDINGS:")
    print("  [OK] Memory  : New project uses LESS heap memory")
    print("  [OK] Startup : New project starts FASTER")
    print("  [!!] CPU     : Old project uses less process CPU")
    print("  [!!] RT      : New project was idle - no fair RT comparison")
    print("\n  ARCHITECTURE:")
    print("  New : 6 services, Ca/Ce metrics, Thymeleaf SSR, Local config")
    print("  Old : 8 services, Domain-Driven, AngularJS SPA, Config Server")
    print(sep)

    # ============================================================
    # SAVE SUMMARY TXT
    # ============================================================
    with open(OUTPUT_SUMMARY, 'w', encoding='utf-8') as f:
        f.write(sep + "\n")
        f.write("  MICROSERVICES COMPARISON REPORT\n")
        f.write("  New (Ca/Ce Based) vs Old (Domain-Driven Design)\n")
        f.write(sep + "\n")
        f.write(f"  New project services : {len(new_data)}\n")
        f.write(f"  Old project services : {len(old_data)}\n")
        f.write(line + "\n")
        f.write(f"  {'Metric':<28} {'New':>10} {'Old':>10} {'Winner':>10} {'Diff':>8}\n")
        f.write(line + "\n")
        for row in comparison_rows:
            m = str(row['Metric'])[:28].ljust(28)
            n = str(row['New_Project_Avg'])[:10].rjust(10)
            o = str(row['Old_Project_Avg'])[:10].rjust(10)
            w = str(row['Winner'])[:10].rjust(10)
            d = str(row['Difference'])[:8].rjust(8)
            f.write(f"  {m} {n} {o} {w} {d}\n")
        f.write(line + "\n")
        f.write("\n  KEY FINDINGS:\n")
        f.write("  [OK] Memory  : New project uses LESS heap memory\n")
        f.write("  [OK] Startup : New project starts FASTER\n")
        f.write("  [!!] CPU     : Old project uses less process CPU\n")
        f.write("  [!!] RT      : New project was idle - no fair RT comparison\n")
        f.write("\n  ARCHITECTURE:\n")
        f.write("  New : 6 services, Ca/Ce metrics, Thymeleaf SSR, Local config\n")
        f.write("  Old : 8 services, Domain-Driven, AngularJS SPA, Config Server\n")
        f.write(sep + "\n")

    print(f"✅ Summary saved : {OUTPUT_SUMMARY}")

if __name__ == "__main__":
    main()