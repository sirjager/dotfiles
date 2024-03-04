#!/bin/sh
# Add this to your .bashrc and .zshrc etc..
# [ ! -f ~/.config/shell.cfg ] || . ~/.config/shell.cfg;
# [ -f /usr/share/blesh/ble.sh ]  && [[ $- == *i* ]] && source /usr/share/blesh/ble.sh
#

export DIRENV_LOG_FORMAT=""
update_tmux_window_name() {
    dirname="$(basename "$(pwd)")"
    myuser=$(whoami)
    [ "$dirname" = "$myuser" ] && dirname="home"
    sess_count="$(tmux list-sessions 2>/dev/null | wc -l)"
    if [ "$sess_count" = "0" ]; then
        return 0
    fi
    tmux rename-window "$dirname"
}

# this function runs after every command get executed on terminal
prompt_commands_chain() {
    eval "$(direnv hook bash)"
    eval "$(starship init bash)"
    eval "$(zoxide init --cmd cd bash)"
    update_tmux_window_name
}

PROMPT_COMMAND=prompt_commands_chain

eval "$(direnv hook bash)"
eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"

# external aliases
[ -f "/mnt/storage/global/alias" ] && . "/mnt/storage/global/alias"

# export keys: use gpg-export-public-key "email@gmail.com"
alias gpg-export-public-key="gpg --output public.gpg --armor --export"
alias gpg-export-private-key="gpg --output private.gpg --armor --export-secret-key"

alias wget="/usr/bin/wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

# .dotfiles github bare repository
alias dot="/usr/bin/lazygit --git-dir=$MYDOTFILES --work-tree=$HOME"
alias dot-remove-lock="rm -f ~/$MYDOTFILES/index.lock"
alias dots="/usr/bin/git --git-dir=$MYDOTFILES --work-tree=$HOME"
alias dots-hide-untracked="/usr/bin/git --git-dir=$MYDOTFILES --work-tree=$HOME config --local status.showUntrackedFiles no"

alias grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias ssh-newkey="ssh-keygen -t ed25519 -C"
alias ssh-eval='eval "$(ssh-agent -s)"'
alias ssh-test='ssh -T git@github.com'

alias net-start-virt='sudo virsh net-start default'

# Tmux
alias tm="tmux"
alias tma='tmux attach -t'
alias tmk='tmux kill-session'
alias tmka='tmux kill-session -a'

alias docker-clean-buildx="docker buildx prune --all"
alias docker-clean-builder="docker builder prune --all"
alias docker-clean-image="docker image prune --all"

# saving some misc commands
alias battery-info="upower -i /org/freedesktop/UPower/devices/battery_BAT0"

# exa: ls commands with style
alias l='exa -h --long --all --sort=name --icons'
alias la='exa -h --long --all --sort=name --icons'
alias ls="exa -h --long --sort=name --icons --classify"
alias ll="exa -h --long --sort=name --icons --classify"

# general aliases
alias cl='clear && neofetch'
alias rbf='fc-cache -fv'
alias lv="~/.local/bin/lvim"
alias slv="sudo -E -s ~/.local/bin/lvim"
alias k='killall -q'
alias knode='sudo pkill -f nodejs && sudo pkill -f node'

alias s=". ~/.bashrc;"

# change directories
alias cds="cd $MYSTORAGE"
alias cdw="cd $MYSTORAGE/workspace"
alias cdd="cd $MYSTORAGE/downloads"
alias web="cd $MYSTORAGE/workspace/web"

# Yay Package Manager / Aur Helper
alias .i='yay --noconfirm --needed -S' # To install a package (always run pacman -Syu, before installing)
alias .r="yay --noconfirm -Rns"        # To remove the package, avoid orphaned dependencies and erase its global configuration (which in most cases is the proper command to remove software.)
alias .u="yay --noconfirm -Syu"        # To update the system && Update the database
alias .rank-mirrors="sudo reflector --verbose --save /etc/pacman.d/mirrorlist --sort rate -l 30 -p https"

# usage > install-go go1.20.4
alias install-go='function _pkg-install-go(){ GOVER=$1 && echo "$GOVER.linux-amd64.tar.gz"; mkdir -p /mnt/storage/programs/go && rm -f /mnt/storage/programs/go/$GOVER.linux-amd64.tar.gz ; rm -rf /mnt/storage/programs/go/sdk ; wget -O /mnt/storage/programs/go/$GOVER.linux-amd64.tar.gz https://golang.org/dl/$GOVER.linux-amd64.tar.gz && tar -C /mnt/storage/programs/go -xzf /mnt/storage/programs/go/$GOVER.linux-amd64.tar.gz && mv /mnt/storage/programs/go/go /mnt/storage/programs/go/sdk && clear && /mnt/storage/programs/go/sdk/bin/go version && rm -f /mnt/storage/programs/go/$GOVER.linux-amd64.tar.gz ; unset -f _pkg-install-go; };_pkg-install-go'

alias fl="flutter"
alias pn='pnpm'
alias np='npm run'

alias conda-init=". $MYSTORAGE/miniconda3/conda-init"

alias ai="ollama run mistral"
alias aic="ollama run codellama"

alias tmux-delete-sessions="rm -rf ~/.local/share/tmux/resurrect/*"

# [ ! -f /mnt/storage/programs/miniconda3/conda-init ] || . /mnt/storage/programs/miniconda3/conda-init && conda activate system

alias n="nvim"
alias nv="nvim"
alias snv="sudo -E -s nvim"

alias date-dd-mm-yyyy="echo $(date +'%d-%m-%Y') | xclip -selection clipboard"
alias date-yyyy-mm-dd="echo $(date +'%Y-%m-%d') | xclip -selection clipboard"
alias date-yyyy-mm-dd-hh-mm-ss="echo $(date +'%Y-%m-%d %H:%M:%S') | xclip -selection clipboard"
alias date-day-month-day-year="echo $(date +'%A, %B %d, %Y') | xclip -selection clipboard"

alias brightness-chmod="sudo chmod a+rw /sys/class/backlight/amdgpu_bl2/brightness"

alias nvim-remove-shada="rm -rf ~/.local/state/nvim/shada/"

port_kill() {
    if [ -z "$1" ]; then
        echo "Usage: killport <port>"
    else
        kill -9 "$(lsof -t -i:"$1")"
    fi
}

port_expose() {
    if [ -z "$1" ]; then
        echo "Usage: ssh -R 80:localhost:<port> localhost.run"
    else
        ssh -R 80:localhost:"$1" localhost.run
    fi
}

port_hide() {
    ssh -R 0:localhost:0 localhost.run
}

[ -f ~/.config/task.bash ] && . ~/.config/task.bash

.space(){
    _path="$1"
    [ -z "$_path" ] && _path="."
    sudo du -hd 1 "$_path" | sort -h -r
}

.cpath(){
    _path="$1"
    [ -z "$_path" ] && _path="$(pwd)"
    echo $_path | xclip -selection clipboard
}

adb-connect () {
    adb connect 192.168.0.101:$1
}

adb-pair(){
    adb pair 192.168.0.101:$1
}
