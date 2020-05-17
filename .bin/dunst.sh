#!/bin/sh

. $HOME/.cache/wal/colors.sh

# Terminate already running bar instances
killall -qw dunst

exec dunst \
  -lb "${color4:-#FFFFFF}" \
  -nb "${color4:-#FFFFFF}" \
  -cb "${color4:-#FFFFFF}" \
  -lf "${color7:-#000000}" \
  -nf "${color7:-#000000}" \
  -cf "#e27878" \
  -lfr "${color4:-#800000}" \
  -nfr "${color4:-#800000}" \
  -cfr "${color4:-#800000}"
