#!/usr/bin/env bash

if [ -z "$1" ] 
then
    echo "First argument must be the name of the polybar!"
    exit 1
fi

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bars. TODO: polybar.log has the potential to fill up /tmp
echo "---" | tee -a /tmp/polybar.log
polybar -r $1 >>/tmp/polybar.log 2>&1 &

echo "Bars launched..."