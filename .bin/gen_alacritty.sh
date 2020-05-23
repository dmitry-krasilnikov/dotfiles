#!/bin/bash

background_sub=$(jq --raw-output '.special.background' ~/.cache/wal/colors.json)
opacity_sub=$(jq --raw-output '.alpha' ~/.cache/wal/colors.json)
sed -E -e 's/(background:) '\''\$\{BACKGROUND\}'\''/\1 '\'"$background_sub"\''/' -e 's/(background_opacity:) \$\{BACKGROUND_OPACITY\}/\1 '"$opacity_sub"'/' ~/.config/alacritty/template.yml > ~/.config/alacritty/alacritty.yml
