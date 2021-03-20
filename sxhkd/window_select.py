#!/bin/python3

from utils import fzf_select, list_windows, make_primary

if __name__ == '__main__':
    windows = list_windows()
    window_index = fzf_select([f"{window.desktop_name()} | {window.title} | {window.process_name()}" for window in windows])
    if window_index is not None:
        window = windows[window_index]
        desktop_name = window.desktop_name()
        make_primary(desktop_name)
    