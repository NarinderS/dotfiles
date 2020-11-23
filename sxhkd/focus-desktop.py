#!/bin/python3

import subprocess
from typing import List
import argparse

def getListOfMonitors() -> List[str]:
    return subprocess.check_output(["bspc", "query", "-M", "--names"]).decode().split()

def getListOfDesktops(monitor: str) -> List[str]:
    return subprocess.check_output(["bspc", "query", "-m", monitor, "--desktops", "--names"]).decode().split()

def swapDesktops(desktop1: str, desktop2: str):
    subprocess.check_call(["bspc", "desktop", desktop1, "-s", desktop2])
    return

def sortDesktops(monitor: str):
    desktops = list(map(str, sorted(map(int, getListOfDesktops(monitor)))))
    subprocess.check_call(["bspc", "monitor", monitor, "-o"] + desktops)
    return

def focusDesktop(desktop: str):
    subprocess.check_call(["bspc", "desktop", desktop, "-f"])
    return

def activateDesktop(desktop: str):
    subprocess.check_call(["bspc", "desktop", desktop, "-a"])
    return

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("desktop", type=int)
    args = parser.parse_args()
    targetDesktop = str(args.desktop)

    monitors = getListOfMonitors()
    desktops = {monitor: getListOfDesktops(monitor) for monitor in monitors}

    currentDesktop = desktops[monitors[0]][0]

    if targetDesktop != currentDesktop:
        swapDesktops(targetDesktop, currentDesktop)
        for monitor in monitors:
            sortDesktops(monitor)
        focusDesktop(targetDesktop)
        activateDesktop(currentDesktop)