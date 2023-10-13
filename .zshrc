# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh
export ZSH_CUSTOM=~/.oh-my-zsh
export ZSH_CACHE_DIR=~/.cache/zsh
export DIFFPROG=/usr/bin/nvim

setopt histignorealldups

# Specify directory where to search for user defined functions & completions.
fpath=(
  ~/.oh-my-zsh/functions
  ~/.oh-my-zsh/completions
  "${fpath[@]}"
)

# Autoload user defined functions
autoload -Uz copy_terminfo_over_ssh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="custom"

DEFAULT_USER="fox"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(systemd docker docker-compose archlinux git vi-mode globalias)

source $ZSH/oh-my-zsh.sh

source /usr/share/zsh/share/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme denysdovhan/spaceship-prompt
antigen apply

# User configuration

export PATH=~/.cargo/bin:$PATH

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR=vim
else
  export EDITOR=nvim
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey -M isearch '^R' history-incremental-search-backward
bindkey -M isearch '^S' history-incremental-search-forward
bindkey -M isearch '^[' accept-search


alias drive_sync_dry='rclone -n --include-from .rclone_include --exclude "*" sync /home/fox drive:backup'
alias drive_sync='rclone --include-from .rclone_include --exclude "*" sync /home/fox drive:backup'
alias open='xdg-open'

alias vi=nvim
alias em='emacs -nw'

awkp() {
    awk 'NR=='$1'{print $'$2'}'
}

alias dps='sudo docker ps'

dex() {
    local DCMD

    if (( $# == 1 ))
    then
        DCMD=bash
    else
        DCMD=$2
    fi

    sudo docker exec -it $(dps | rg $1 | head -n1 | cut -f1 -d' ') $DCMD
}

dpr() {
    sudo docker rm $(sudo docker ps -a -q) || \
    sudo docker rmi $(sudo docker images --quiet --filter "dangling=true")
}

_has() {
  return $( whence $1 >/dev/null )
}

# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi

nwc() {
    "$@"; notify-send "Shell" "$* completed"
}

alias xc="xclip -r -selection clipboard"
[ -f ~/.fzf.colors ] && source ~/.fzf.colors

gpg-key-to-paper() {
    if [[ -z "$1" ]]; then
        echo "Specify key name as a parameter (email is fine)"
        return
    fi
    gpg2 --armor --export-options export-backup --export-secret-key "$1" | qrencode -o - | lpr
}

gpg-import-qr() {
    if [[ -z "$1" ]]; then
        echo "Specify image filename"
        return
    fi
    zbarimg --raw "$1" | gpg2 --import
}

text-to-paper() {
    if [[ -z "$1" ]]; then
        echo "Specify file name as a parameter"
        return
    fi
    cat "$1" | qrencode -o - | lpr
}

qr-to-text() {
    if [[ -z "$1" ]]; then
        echo "Specify file name as a parameter"
        return
    fi
    zbarimg --raw "$1"
}

docker-host-unset() {
    if [[ -v DOCKER_MACHINE_NAME ]]; then
        eval $(docker-machine env --unset)
    elif [[ -v DOCKER_HOST ]]; then
        unset DOCKER_HOST DOCKER_TLS_VERIFY DOCKER_CERT_PATH
    fi
}

docker-host-set() {
    local DMS
    docker-machine status "$1" > /dev/null 2>&1
    DMS=$?
    if [[ -z "$1" || ( ! -d ~/.docker/certs/$1 && (( $DMS != 0 )) ) ]]; then
        echo "Docker host not found. Available hosts are:"
        # TODO add padding with "-"
        echo "$(ls ~/.docker/certs)"
        echo "Available docker machines are:"
        echo "$(docker-machine ls -q)"
    elif [[ -d ~/.docker/certs/$1 ]]; then
        docker-host-unset
        export DOCKER_HOST=tcp://$1:2376 DOCKER_TLS_VERIFY=1 DOCKER_CERT_PATH=~/.docker/certs/$1/
    else
        docker-host-unset
        eval $(docker-machine env "$1")
    fi
}

alias ds="sudo docker service"
alias dsp="sudo docker service ps"
alias dsu="sudo docker service update"
alias dsl="sudo docker service ls"
alias dslg="sudo docker service logs"
alias dsi="sudo docker service inspect --pretty"

alias dm="docker-machine"
alias dms="docker-machine --native-ssh ssh"
alias dmi="docker-machine ip"
alias dhs=docker-host-set
alias dhu=docker-host-unset

alias ls="/usr/bin/exa -lh"
alias less="/usr/bin/bat"
alias grep="/usr/bin/rg"
alias du="/usr/bin/dust"

alias wal-theme="wal -stl --theme "

autoload -U zmv

# cd
# for repo_path in ~/.cfg ~/.priv_cfg ~/.password-store ~/vimwiki; do
#     cd "$repo_path"
#     repo_state=$(git status --porcelain)
#     repo_log=$(git log --oneline origin/master..)
#     if [ -n "$repo_state" -o -n "$repo_log" ]; then
#         echo "$repo_path needs attention"
#     fi
# done
# cd

alias priv_config="/usr/bin/git --git-dir=$HOME/.priv_cfg/ --work-tree=$HOME"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# pip aliases
alias pui="pip install --user"
alias puuo="pip list --user --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install --user -U"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/vault vault

alias cal="cal -mn3"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(direnv hook zsh)"

alias blc="bluetoothctl"
alias blcc="bluetoothctl connect"
alias blcd="bluetoothctl disconnect"
alias blcs="bluetoothctl devices Connected"
