#!/bin/zsh

POLYBAR_BG=$(xrdb -query -all | rg '\*color0' | cut -f2)
POLYBAR_BG="#cc${POLYBAR_BG[2,7]}"
export POLYBAR_BG

killall -qw picom
picom --daemon --experimental-backends

~/.bin/polybar.sh
