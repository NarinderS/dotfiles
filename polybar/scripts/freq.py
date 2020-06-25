#!/bin/python3

import psutil
freq = psutil.cpu_freq().current
print(f"{freq/1000:0.2f}GHz")
