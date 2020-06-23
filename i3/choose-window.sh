#!/bin/bash
wmctrl -a $(wmctrl -l | cut -d" " -f5- | awk NF | fzf --reverse --border)