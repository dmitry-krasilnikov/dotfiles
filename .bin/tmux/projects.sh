#!/bin/zsh

if which fdfind > /dev/null; then
        FD=fdfind
else
        FD=fd
fi

$FD --unrestricted '\.git$' --search-path ~ -x echo '{//}' | rg -v '/\.' | rg '^.*/(.*)$' -r '$0 $1' | fzf --delimiter=' ' --with-nth=1 --bind 'enter:execute-silent(tmux new-window -c {1} -n {2})+abort'
