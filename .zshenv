export PATH=~/.emacs.d/bin:~/.local/bin:~/.bin:$PATH:~/Development/flutter/bin:~/.venv/bin/

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

RANGER_LOAD_DEFAULT_RC=FALSE

# if command -v pyenv 1>/dev/null 2>&1; then
#     eval "$(pyenv init -)"
#     eval "$(pyenv virtualenv-init -)"
# fi

if command -v direnv 1>/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

source ~/.zshenv_override
