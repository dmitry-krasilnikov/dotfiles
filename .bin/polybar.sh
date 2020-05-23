#!/bin/bash

# Terminate already running bar instances
killall -qw polybar

# todo: fork pywal and set background_alpha in Xresources
# right now we have to restart polybar manually after changing theme
opacity_float=$(jq --raw-output '.alpha' ~/.cache/wal/colors.json)
opacity_hex=$(echo "scale=0; $opacity_float*255" | bc | xargs printf '%x\n')
background=$(jq --raw-output '.special.background' ~/.cache/wal/colors.json)
bg_alpha="#$opacity_hex${background:1:6}"

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    POLYBAR_BG="$bg_alpha" MONITOR=$m polybar --reload top &
    POLYBAR_BG="$bg_alpha" MONITOR=$m polybar --reload bottom &
  done
else
  POLYBAR_BG="$bg_alpha" polybar --reload top &
  POLYBAR_BG="$bg_alpha" polybar --reload bottom &
fi
