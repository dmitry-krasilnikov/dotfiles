#!/bin/env zsh

SETUP_SCRIPT=".setup_project.sh"

if [[ -f $SETUP_SCRIPT && -x $SETUP_SCRIPT ]]; then
        ./$SETUP_SCRIPT
else
        $SHELL
fi
