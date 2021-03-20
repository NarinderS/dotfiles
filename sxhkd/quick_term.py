#!/bin/python3

import subprocess
import argparse
from utils import list_windows

TERMINAL = "kitty"
TITLE = "QUICK_TERM"
CLASS = "FLOATING"

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("command", type=str)
    args = parser.parse_args()
    
    for window in list_windows():
        if window.title == TITLE:
            window.close()

    subprocess.check_call(["kitty", "--class", CLASS, "--title", TITLE, "-e", args.command])