if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

RANGER_LOAD_DEFAULT_RC=FALSE

source ~/.zshenv_override
