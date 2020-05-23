#!/bin/zsh

if pgrep -u $UID -x picom >/dev/null; then
    killall -qw picom
else
    picom --daemon --experimental-backends
fi
