#!/bin/python3

import psutil
localIpAddr = psutil.net_if_addrs()['wlp4s0'][0].address
print(f"{localIpAddr}")
