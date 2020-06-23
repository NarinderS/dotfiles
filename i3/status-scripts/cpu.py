import psutil
cpuPercent = psutil.cpu_percent(interval=0.1)
print(f" {cpuPercent:05.2f}%")