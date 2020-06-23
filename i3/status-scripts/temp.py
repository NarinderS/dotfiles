import psutil
coreTemp = psutil.sensors_temperatures()['k10temp'][0].current
print(f" {coreTemp:0.2f}\N{DEGREE SIGN}C")
