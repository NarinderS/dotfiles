#!/bin/python3

import subprocess
import time
from typing import List
import re
import os

def monitorList() -> List[str]:
    out = subprocess.check_output(["polybar", "--list-monitors"]).decode("UTF-8")
    return [i[:-1] for i in re.findall(r".*:", out)]

subprocess.run(['killall', '-q', 'polybar'])

with open("/tmp/polybar.log", 'a') as out:
    out.write("---------\n")
    out.write(f"Launching Polybar {time.asctime()}\n")
    for i, m in enumerate(monitorList()):
        subprocess.Popen(['polybar', '-r', 'bspwm'], env=dict(os.environ, MONITOR=m), stdout=out, stderr=out)
    out.write(f"Bars launched\n")