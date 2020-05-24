#!/bin/bash

if [[ "$1" = "toggle" ]]; then
    if pgrep -u $UID -x picom >/dev/null; then
        killall -qw picom
    else
        picom --daemon --experimental-backends
    fi
else
    if ! pgrep -u $UID -x picom >/dev/null; then
        picom --daemon --experimental-backends
    fi
fi
