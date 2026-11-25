"""
Monolithic vs Old Spring PetClinic Microservices Comparison
"""
import pandas as pd
from pathlib import Path

BASE   = Path(__file__).resolve().parent.parent
MONO   = BASE / "monolithic_sonar_metrics.csv"
OLD    = BASE / "old_sonar_metrics.csv"

METRICS = ["LOC", "Cyclomatic Complexity", "Cognitive Complexity", "Maintainability (%)"]

def load(path):
    print(f"   Reading: {path}")
    df = pd.read_csv(path, encoding="utf-8-sig")
    df.columns = df.columns.str.strip()
    df["Service"] = df["Service"].str.strip()
    return df

def project_summary(mono_df, old_df):
    mono_overall = mono_df[mono_df["Service"].str.contains("Overall")].copy()
    old_svc = old_df[~old_df["Service"].str.contains("Overall", na=False)].copy()

    rows = []
    row = {"Project": "Monolithic (Overall)", "Services Count": 1}
    for m in METRICS:
        row[f"Avg {m}"] = round(mono_overall[m].mean(), 2)
        row[f"Total {m}"] = mono_overall[m].sum()
    rows.append(row)

    row = {"Project": "Old Microservices (Spring PetClinic)", "Services Count": len(old_svc)}
    for m in METRICS:
        row[f"Avg {m}"] = round(old_svc[m].mean(), 2)
        row[f"Total {m}"] = old_svc[m].sum()
    rows.append(row)

    delta = {"Project": "Delta (Old Micro - Mono)", "Services Count": "-"}
    for m in METRICS:
        diff = round(old_svc[m].mean() - mono_overall[m].mean(), 2)
        sign = "+" if diff > 0 else ""
        delta[f"Avg {m}"]   = f"{sign}{diff}"
        delta[f"Total {m}"] = "-"
    rows.append(delta)

    return pd.DataFrame(rows)

def mono_vs_each_service(mono_df, old_df):
    mono_overall = mono_df[mono_df["Service"].str.contains("Overall")].iloc[0]
    old_svc = old_df[~old_df["Service"].str.contains("Overall", na=False)].copy()

    rows = []
    for _, svc in old_svc.iterrows():
        row = {"Old Service": svc["Service"]}
        notes = []
        for m in METRICS:
            mv = mono_overall[m]
            ov = svc[m]
            diff = round(ov - mv, 2)
            row[f"Mono {m}"]  = mv
            row[f"Old {m}"]   = ov
            row[f"Diff {m}"]  = f"+{diff}" if diff > 0 else str(diff)
            if m == "Maintainability (%)":
                notes.append(f"Maint {'better' if diff>0 else 'worse'} {diff}%")
            elif m == "LOC":
                notes.append(f"LOC {'less' if diff<0 else 'more'} by {abs(int(diff))}")
            else:
                notes.append(f"{m} {'improved' if diff<0 else 'worsened'} by {abs(diff)}")
        row["Interpretation"] = "; ".join(notes)
        rows.append(row)
    return pd.DataFrame(rows)

def service_detail(mono_df, old_df):
    mono_files = mono_df[
        (~mono_df["Service"].str.contains("Overall", na=False)) &
        (mono_df["LOC"] > 0)
    ].copy()
    mono_files["Source"] = "Monolithic"

    old_svc = old_df.copy()
    old_svc["Source"] = "Old Microservice"

    combined = pd.concat([mono_files, old_svc], ignore_index=True)
    return combined[["Source", "Service"] + METRICS]

def save_csv(df, path):
    df.to_csv(path, index=False, encoding="utf-8-sig")
    print(f"   Saved → {path}")

def main():
    print("📂 Loading files...")
    mono_df = load(MONO)
    old_df  = load(OLD)

    summary_df = project_summary(mono_df, old_df)
    vs_df      = mono_vs_each_service(mono_df, old_df)
    detail_df  = service_detail(mono_df, old_df)

    save_csv(summary_df, BASE / "mono_vs_old_summary.csv")
    save_csv(vs_df,      BASE / "mono_vs_old_service_detail.csv")
    save_csv(detail_df,  BASE / "mono_vs_old_all_services.csv")

    print(f"\n✅ Done! 3 CSV files saved in variance/ folder")
    print("\n══════ PROJECT SUMMARY ══════")
    print(summary_df[["Project","Services Count","Avg LOC","Avg Cyclomatic Complexity","Avg Cognitive Complexity","Avg Maintainability (%)"]].to_string(index=False))
    print("\n══════ MONO vs EACH OLD SERVICE ══════")
    print(vs_df.to_string(index=False))

if __name__ == "__main__":
    main()