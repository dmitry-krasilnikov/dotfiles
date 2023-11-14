#!/bin/bash

fd --unrestricted "\.git$" --search-path ~ -x echo "{//}" | rg -v "/\." | awk '{print $0, gensub(".*/", "", "g", $0)}' | fzf --delimiter=" " --with-nth=1 --bind "enter:execute-silent(tmux new-session -c {1} -s {2} -d; tmux switch-client -t {2})+abort"
