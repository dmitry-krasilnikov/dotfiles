#!/bin/zsh

POLYBAR_BG=$(xrdb -query -all | rg '\*color0' | cut -f2)
POLYBAR_BG="#cc${POLYBAR_BG[2,7]}"
export POLYBAR_BG
if pgrep -u $UID -x picom >/dev/null; then
    killall -q picom
else
    picom --daemon --experimental-backends
fi

~/.bin/polybar.sh
