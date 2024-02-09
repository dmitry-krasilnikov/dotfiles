#!/bin/bash

fd --unrestricted "\.git$" --search-path ~ -x echo "{//}" | rg -v "/\." | awk '{print $0, gensub(".*/", "", "g", $0)}' | fzf --delimiter=" " --with-nth=1 --bind "enter:execute-silent(tmux new-window -c {1} -n {2})+abort"
