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
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar -r $1 >>/tmp/polybar.log 2>&1 &
done

echo "Bars launched..."
