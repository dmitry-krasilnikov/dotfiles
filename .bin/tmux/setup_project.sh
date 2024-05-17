#!/bin/env zsh

SETUP_SCRIPT=".setup_project.sh"

if [[ -f $SETUP_SCRIPT && -x $SETUP_SCRIPT ]]; then
        exec ./$SETUP_SCRIPT
else
        exec $SHELL
fi
