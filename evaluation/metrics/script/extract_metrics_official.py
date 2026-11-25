import requests
import csv
from datetime import datetime

# Official project services — localhost ports use karo
services = {
    "spring-petclinic-customers-service": "http://localhost:8081/actuator/prometheus",
    "spring-petclinic-vets-service": "http://localhost:8083/actuator/prometheus",
    "spring-petclinic-visits-service": "http://localhost:8082/actuator/prometheus",
    "spring-petclinic-api-gateway": "http://localhost:8080/actuator/prometheus"
}

rows = []

for service_name, url in services.items():
    try:
        response = requests.get(url, timeout=10)
        lines = response.text.split('\n')

        heap_used = 0
        cpu_system = None
        cpu_process = None
        threads = None
        startup = None
        db_connections = None
        request_count = 0
        request_sum = 0
        request_max = 0

        for line in lines:
            if line.startswith('#') or line.strip() == '':
                continue

            if 'jvm_memory_used_bytes' in line and 'area="heap"' in line:
                val = float(line.split()[-1])
                if val > 0:
                    heap_used += val

            elif line.startswith('system_cpu_usage '):
                cpu_system = float(line.split()[-1])

            elif line.startswith('process_cpu_usage '):
                cpu_process = float(line.split()[-1])

            elif line.startswith('jvm_threads_live_threads '):
                threads = float(line.split()[-1])

            elif 'application_ready_time_seconds' in line and '{' in line:
                startup = float(line.split()[-1])

            elif 'hikaricp_connections_active' in line:
                db_connections = float(line.split()[-1])

            elif 'http_server_requests_seconds_count' in line and 'prometheus' not in line:
                request_count += float(line.split()[-1])

            elif 'http_server_requests_seconds_sum' in line and 'prometheus' not in line:
                request_sum += float(line.split()[-1])

            elif 'http_server_requests_seconds_max' in line and 'prometheus' not in line:
                val = float(line.split()[-1])
                if val > request_max:
                    request_max = val

        avg_response = round(request_sum / request_count, 4) if request_count > 0 else 0

        rows.append({
            'Project': 'Old-Microservices',
            'Service': service_name,
            'Heap_Memory_MB': round(heap_used / (1024 * 1024), 2),
            'CPU_System_%': round(cpu_system * 100, 2) if cpu_system else 0,
            'CPU_Process_%': round(cpu_process * 100, 4) if cpu_process else 0,
            'Live_Threads': int(threads) if threads else 0,
            'Startup_Time_sec': startup if startup else 0,
            'DB_Connections_Active': db_connections if db_connections else 'N/A',
            'Total_Requests': int(request_count),
            'Avg_Response_Time_sec': avg_response,
            'Max_Response_Time_sec': round(request_max, 4),
            'Timestamp': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        })

        print(f"✅ {service_name} done")

    except Exception as e:
        print(f"❌ {service_name} failed: {e}")

# Save CSV
output_file = r"F:\Main Project\evaluation\metrics\old_project_metrics_clean.csv"
with open(output_file, 'w', newline='') as f:
    fieldnames = [
        'Project', 'Service',
        'Heap_Memory_MB', 'CPU_System_%', 'CPU_Process_%',
        'Live_Threads', 'Startup_Time_sec', 'DB_Connections_Active',
        'Total_Requests', 'Avg_Response_Time_sec', 'Max_Response_Time_sec',
        'Timestamp'
    ]
    writer = csv.DictWriter(f, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(rows)

print(f"\n✅ Saved: {output_file}")

# Terminal table
print("\n" + "="*90)
print(f"{'Service':<25} {'Heap MB':<12} {'CPU%':<10} {'Threads':<10} {'Startup':<10} {'Requests':<10} {'Avg RT':<10}")
print("="*90)
for r in rows:
    print(f"{r['Service']:<25} {r['Heap_Memory_MB']:<12} {r['CPU_System_%']:<10} {r['Live_Threads']:<10} {r['Startup_Time_sec']:<10} {r['Total_Requests']:<10} {r['Avg_Response_Time_sec']:<10}")