#!/bin/sh

# Terminate already running instances
killall -q xbanish

# Wait until the processes have been shut down
while pgrep -u $UID -x xbanish >/dev/null; do sleep 1; done

xbanish -i $1 &
