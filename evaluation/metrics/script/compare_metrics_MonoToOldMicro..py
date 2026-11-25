import csv

# ============================================================
# FILE PATHS
# ============================================================
MICROSERVICE_CSV = r"F:\Main Project\evaluation\metrics\old_project_metrics_clean.csv"
MONOLITHIC_CSV   = r"F:\Main Project\evaluation\metrics\monolithic_metrics_clean.csv"
OUTPUT_CSV       = r"F:\Main Project\evaluation\metrics\mono_vs_old_micro_comparison.csv"
OUTPUT_SUMMARY   = r"F:\Main Project\evaluation\metrics\mono_vs_old_micro_summary.txt"

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
# lower_is_better=True  → smaller value is better
# lower_is_better=False → larger value is better
# ============================================================
def compare(micro_val, mono_val, lower_is_better=True):
    if micro_val == 0 and mono_val == 0:
        return "N/A", "N/A"
    if micro_val == 0:
        return "Monolithic", "N/A"
    if mono_val == 0:
        return "Microservice", "N/A"

    if lower_is_better:
        diff = round(abs(mono_val - micro_val) / max(mono_val, micro_val) * 100, 2)
        winner = "Microservice" if micro_val < mono_val else "Monolithic"
    else:
        diff = round(abs(micro_val - mono_val) / max(micro_val, mono_val) * 100, 2)
        winner = "Microservice" if micro_val > mono_val else "Monolithic"

    return winner, f"{diff}%"

# ============================================================
# MAIN
# ============================================================
def main():
    print("Reading CSV files...")
    micro_data = read_csv(MICROSERVICE_CSV)
    mono_data  = read_csv(MONOLITHIC_CSV)

    print(f"Microservice services : {len(micro_data)}")
    print(f"Monolithic services   : {len(mono_data)}")

    micro_avg = get_averages(micro_data)
    mono_avg  = get_averages(mono_data)

    # ============================================================
    # METRICS CONFIG
    # (metric_key, display_label, lower_is_better, note)
    # ============================================================
    metrics_config = [
        ("Heap_Memory_MB",        "Avg Heap Memory (MB)",    True,  "Lower = Less memory used"),
        ("CPU_System_%",          "Avg System CPU (%)",       True,  "Lower = Less CPU load"),
        ("CPU_Process_%",         "Avg Process CPU (%)",      True,  "Lower = Less process CPU"),
        ("Live_Threads",          "Avg Live Threads",         True,  "Lower = Less resource usage"),
        ("Startup_Time_sec",      "Avg Startup Time (sec)",   True,  "Lower = Faster startup"),
        ("Total_Requests",        "Total Requests Handled",   False, "Higher = More active"),
        ("Avg_Response_Time_sec", "Avg Response Time (sec)",  True,  "Lower = Faster response"),
        ("Max_Response_Time_sec", "Max Response Time (sec)",  True,  "Lower = Less latency spikes"),
    ]

    comparison_rows = []
    for key, label, lower_better, note in metrics_config:
        mi_val = micro_avg[key]
        mo_val = mono_avg[key]
        winner, diff = compare(mi_val, mo_val, lower_better)
        comparison_rows.append({
            "Metric":              label,
            "Microservice_Avg":    mi_val,
            "Monolithic_Avg":      mo_val,
            "Winner":              winner,
            "Difference":          diff,
            "Note":                note
        })

    # ============================================================
    # SERVICE-WISE ROWS
    # ============================================================
    service_rows = []
    for row in micro_data:
        service_rows.append({
            "Project":               "Microservice (Ca/Ce Based)",
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
    for row in mono_data:
        service_rows.append({
            "Project":               "Monolithic (Spring PetClinic)",
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
        f.write("SECTION 1: AGGREGATE COMPARISON (Monolithic vs Microservice)\n")
        writer = csv.DictWriter(f, fieldnames=[
            "Metric", "Microservice_Avg", "Monolithic_Avg",
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
    sep  = "=" * 80
    line = "-" * 80

    summary_lines = []
    summary_lines.append(sep)
    summary_lines.append("  MONOLITHIC vs MICROSERVICE COMPARISON REPORT")
    summary_lines.append("  Monolithic (Spring PetClinic) vs Microservice (Ca/Ce Based Decomposition)")
    summary_lines.append(sep)
    summary_lines.append(f"  Microservice services : {len(micro_data)}")
    summary_lines.append(f"  Monolithic services   : {len(mono_data)}")
    summary_lines.append(line)
    summary_lines.append(f"  {'Metric':<28} {'Microservice':>14} {'Monolithic':>12} {'Winner':>14} {'Diff':>8}")
    summary_lines.append(line)

    for row in comparison_rows:
        m  = str(row['Metric'])[:28].ljust(28)
        mi = str(row['Microservice_Avg'])[:14].rjust(14)
        mo = str(row['Monolithic_Avg'])[:12].rjust(12)
        w  = str(row['Winner'])[:14].rjust(14)
        d  = str(row['Difference'])[:8].rjust(8)
        summary_lines.append(f"  {m} {mi} {mo} {w} {d}")

    summary_lines.append(line)
    summary_lines.append("")
    summary_lines.append("  KEY FINDINGS:")

    # Dynamic findings based on actual data
    mem_winner  = next(r['Winner'] for r in comparison_rows if 'Heap' in r['Metric'])
    cpu_winner  = next(r['Winner'] for r in comparison_rows if 'Process CPU' in r['Metric'])
    st_winner   = next(r['Winner'] for r in comparison_rows if 'Startup' in r['Metric'])
    rt_winner   = next(r['Winner'] for r in comparison_rows if 'Avg Response' in r['Metric'])
    thr_winner  = next(r['Winner'] for r in comparison_rows if 'Threads' in r['Metric'])

    mem_diff  = next(r['Difference'] for r in comparison_rows if 'Heap' in r['Metric'])
    cpu_diff  = next(r['Difference'] for r in comparison_rows if 'Process CPU' in r['Metric'])
    st_diff   = next(r['Difference'] for r in comparison_rows if 'Startup' in r['Metric'])
    rt_diff   = next(r['Difference'] for r in comparison_rows if 'Avg Response' in r['Metric'])

    micro_heap = micro_avg['Heap_Memory_MB']
    mono_heap  = mono_avg['Heap_Memory_MB']
    total_micro_heap = round(micro_heap * len(micro_data), 2)

    summary_lines.append(f"  [Memory]   Winner: {mem_winner} (diff: {mem_diff})")
    summary_lines.append(f"             Microservice total heap (all services): {total_micro_heap} MB")
    summary_lines.append(f"             Monolithic heap: {mono_heap} MB")
    if total_micro_heap > mono_heap:
        overhead = round(((total_micro_heap - mono_heap) / mono_heap) * 100, 2)
        summary_lines.append(f"             Microservice uses {overhead}% MORE total memory (expected - multiple JVMs)")
    else:
        summary_lines.append(f"             Microservice uses LESS total memory")

    summary_lines.append(f"  [CPU]      Winner: {cpu_winner} (diff: {cpu_diff})")
    summary_lines.append(f"  [Startup]  Winner: {st_winner} (diff: {st_diff})")
    summary_lines.append(f"             Monolithic starts as 1 process, Microservice needs all services to start")
    summary_lines.append(f"  [Resp.Time]Winner: {rt_winner} (diff: {rt_diff})")
    summary_lines.append(f"  [Threads]  Winner: {thr_winner}")
    summary_lines.append("")
    summary_lines.append("  ARCHITECTURE COMPARISON:")
    summary_lines.append("  Monolithic   : 1 deployable JAR, all features in one process")
    summary_lines.append("                 Single DB, simple deployment, higher coupling")
    summary_lines.append("  Microservice : 6 independent services, Ca/Ce metric based decomposition")
    summary_lines.append("                 Separate DBs, independent deployment, lower coupling")
    summary_lines.append("")
    summary_lines.append("  TRADE-OFFS:")
    summary_lines.append("  [+] Microservice: Independent scaling, fault isolation, tech diversity")
    summary_lines.append("  [-] Microservice: Higher total memory (multiple JVMs), network overhead")
    summary_lines.append("  [+] Monolithic  : Lower memory, simpler debugging, no network calls")
    summary_lines.append("  [-] Monolithic  : Single point of failure, tight coupling, hard to scale")
    summary_lines.append(sep)

    # Print to terminal
    for l in summary_lines:
        print(l)

    # Save to file
    with open(OUTPUT_SUMMARY, 'w', encoding='utf-8') as f:
        f.write('\n'.join(summary_lines) + '\n')

    print(f"\n✅ Summary saved : {OUTPUT_SUMMARY}")

if __name__ == "__main__":
    main()