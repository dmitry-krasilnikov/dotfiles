#!/bin/sh

# Terminate already running instances
killall -qw xbanish

xbanish -i $1 &
