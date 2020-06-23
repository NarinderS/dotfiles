import psutil
memUsedPercent = psutil.virtual_memory().percent
print(f" {memUsedPercent}%")