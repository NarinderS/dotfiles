#!/bin/python3

import subprocess
from typing import List, Optional
from dataclasses import dataclass

# BSPWM related helper functions
def list_monitors() -> List[str]:
    return subprocess.check_output(["bspc", "query", "-M", "--names"]).decode().split()

def list_desktops(monitor: str) -> List[str]:
    return subprocess.check_output(["bspc", "query", "-m", monitor, "--desktops", "--names"]).decode().split()

def swap_desktops(desktop1: str, desktop2: str):
    subprocess.check_call(["bspc", "desktop", desktop1, "-s", desktop2])
    return

def sort_desktops(monitor: str):
    desktops = list(map(str, sorted(map(int, list_desktops(monitor)))))
    subprocess.check_call(["bspc", "monitor", monitor, "-o"] + desktops)
    return

def focus_desktop(desktop: str):
    subprocess.check_call(["bspc", "desktop", desktop, "-f"])
    return

def activate_desktop(desktop: str):
    subprocess.check_call(["bspc", "desktop", desktop, "-a"])
    return

def query_window_desktop(window_id: str) -> str:
    return subprocess.check_output(["bspc", "query", "-n", window_id, "--names", "-D"]).strip().decode('utf-8')

# Move desktop to primary monitor
def make_primary(target_desktop: str):
    monitors = list_monitors()
    desktops = {monitor: list_desktops(monitor) for monitor in monitors}
    
    current_desktop = desktops[monitors[0]][0] 
    if target_desktop != current_desktop:
        swap_desktops(target_desktop, current_desktop)
        for monitor in monitors:
            sort_desktops(monitor)
        focus_desktop(target_desktop)
        # activate_desktop(current_desktop)
    return

# List visible windows
@dataclass
class Window:
    id: str
    pid: str
    title: str
    
    def close(self):
        subprocess.check_call(['kill', '-9', self.pid])
        return
    
    def process_name(self) -> str:
        try:
            return subprocess.check_output(['readlink', f'/proc/{self.pid}/exe']).strip().decode('utf-8')
        except:
            return "ERROR READING EXE LINK"


    def desktop_name(self) -> str:
        return query_window_desktop(self.id)


def list_windows() -> List[Window]:
    output = subprocess.check_output(['wmctrl', '-lp']).strip().decode('utf-8')
    lines = output.split('\n')
    ret = []
    for line in lines:
        line_split = line.split()
        win_id = line_split[0]
        win_pid = line_split[2]
        win_title = ' '.join(line_split[4:])
        ret.append(Window(win_id, win_pid, win_title))
    return ret

# Select using fzf
def fzf_select(options: List[str]) -> Optional[int]:
    try:
        sel = subprocess.check_output(['fzf', '--reverse', '--border'], input='\n'.join(options).encode('utf-8')).strip().decode('utf-8')
    except subprocess.CalledProcessError:
        return None
    try:
        index = options.index(sel)
    except ValueError:
        return None
    return index