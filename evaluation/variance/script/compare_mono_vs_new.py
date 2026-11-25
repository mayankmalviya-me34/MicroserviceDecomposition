"""
Monolithic vs New Microservices Comparison
"""
import pandas as pd
from pathlib import Path

BASE   = Path(__file__).resolve().parent.parent
MONO   = BASE / "monolithic_sonar_metrics.csv"
NEW    = BASE / "new_sonar_metrics.csv"

METRICS = ["LOC", "Cyclomatic Complexity", "Cognitive Complexity", "Maintainability (%)"]

def load(path):
    print(f"   Reading: {path}")
    df = pd.read_csv(path, encoding="utf-8-sig")
    df.columns = df.columns.str.strip()
    df["Service"] = df["Service"].str.strip()
    return df

def project_summary(mono_df, new_df):
    mono_overall = mono_df[mono_df["Service"].str.contains("Overall")].copy()
    new_svc = new_df[~new_df["Service"].str.contains("Overall", na=False)].copy()

    rows = []
    row = {"Project": "Monolithic (Overall)", "Services Count": 1}
    for m in METRICS:
        row[f"Avg {m}"] = round(mono_overall[m].mean(), 2)
        row[f"Total {m}"] = mono_overall[m].sum()
    rows.append(row)

    row = {"Project": "New Microservices", "Services Count": len(new_svc)}
    for m in METRICS:
        row[f"Avg {m}"] = round(new_svc[m].mean(), 2)
        row[f"Total {m}"] = new_svc[m].sum()
    rows.append(row)

    delta = {"Project": "Delta (New - Mono)", "Services Count": "-"}
    for m in METRICS:
        diff = round(new_svc[m].mean() - mono_overall[m].mean(), 2)
        sign = "+" if diff > 0 else ""
        delta[f"Avg {m}"]   = f"{sign}{diff}"
        delta[f"Total {m}"] = "-"
    rows.append(delta)

    return pd.DataFrame(rows)

def mono_vs_each_service(mono_df, new_df):
    mono_overall = mono_df[mono_df["Service"].str.contains("Overall")].iloc[0]
    new_svc = new_df[~new_df["Service"].str.contains("Overall", na=False)].copy()

    rows = []
    for _, svc in new_svc.iterrows():
        row = {"New Service": svc["Service"]}
        notes = []
        for m in METRICS:
            mv = mono_overall[m]
            nv = svc[m]
            diff = round(nv - mv, 2)
            row[f"Mono {m}"]  = mv
            row[f"New {m}"]   = nv
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

def service_detail(mono_df, new_df):
    mono_files = mono_df[
        (~mono_df["Service"].str.contains("Overall", na=False)) &
        (mono_df["LOC"] > 0)
    ].copy()
    mono_files["Source"] = "Monolithic"

    new_svc = new_df.copy()
    new_svc["Source"] = "New Microservice"

    combined = pd.concat([mono_files, new_svc], ignore_index=True)
    return combined[["Source", "Service"] + METRICS]

def save_csv(df, path):
    df.to_csv(path, index=False, encoding="utf-8-sig")
    print(f"   Saved → {path}")

def main():
    print("📂 Loading files...")
    mono_df = load(MONO)
    new_df  = load(NEW)

    summary_df = project_summary(mono_df, new_df)
    vs_df      = mono_vs_each_service(mono_df, new_df)
    detail_df  = service_detail(mono_df, new_df)

    save_csv(summary_df, BASE / "mono_vs_new_summary.csv")
    save_csv(vs_df,      BASE / "mono_vs_new_service_detail.csv")
    save_csv(detail_df,  BASE / "mono_vs_new_all_services.csv")

    print(f"\n✅ Done! 3 CSV files saved in variance/ folder")
    print("\n══════ PROJECT SUMMARY ══════")
    print(summary_df[["Project","Services Count","Avg LOC","Avg Cyclomatic Complexity","Avg Cognitive Complexity","Avg Maintainability (%)"]].to_string(index=False))
    print("\n══════ MONO vs EACH NEW SERVICE ══════")
    print(vs_df.to_string(index=False))

if __name__ == "__main__":
    main()