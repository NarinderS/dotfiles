import psutil
swpUsedPercent = psutil.swap_memory().percent
print(f" {swpUsedPercent}%")