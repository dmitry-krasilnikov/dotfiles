#!/bin/bash
#  ____ _____ 
# |  _ \_   _|  Derek Taylor (DistroTube)
# | | | || |    http://www.youtube.com/c/DistroTube
# | |_| || |    http://www.gitlab.com/dwt1/ 
# |____/ |_| 
#
# Dmenu script for editing some of my more frequently edited config files.


declare options=(" i3 
 polybar 
 st 
 nvim 
 zsh 
 quit ")

choice=$(echo -e "${options[@]}" | rofi -dmenu -i -p 'Edit a config file')

	if [ "$choice" == ' quit ' ]; then
            echo "Program terminated."
	fi
	if [ "$choice" == ' i3 ' ]; then
            exec st -e nvim ~/.config/i3/config
	fi
	if [ "$choice" == ' polybar ' ]; then
            exec st -e nvim ~/.config/polybar/config
	fi
	if [ "$choice" == ' st ' ]; then
            exec st -e nvim ~/Development/st/config.h
	fi
	if [ "$choice" == ' nvim ' ]; then
            exec st -e nvim ~/.config/nvim/init.vim
	fi
	if [ "$choice" == ' zsh ' ]; then
            exec st -e nvim ~/.zshrc
	fi
