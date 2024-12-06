[ -f "$mystorage/global/alias" ] && . "$mystorage/global/alias"

ZINIT_HOME=${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git
if [ ! -f "${ZINIT_HOME}/zinit.zsh" ]; then
  rm -rf "${ZINIT_HOME}"
  mkdir -p "$(dirname "${ZINIT_HOME}")"
  git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}"
fi
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-completions
zinit light atuinsh/atuin

# Add snippets
#  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
zinit snippet OMZP::git
zinit snippet OMZP::sudo
# zinit snippet OMZP::tmux
# zinit snippet OMZP::archlinux
# zinit snippet OMZP::dotenv  ## instead use "direnv"
# zinit snippet OMZP::golang
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx
# zinit snippet OMZP::docker
# zinit snippet OMZP::docker-compose
# zinit snippet OMZP::command-not-found

autoload -U compinit && compinit
zinit cdreplay -q

# emacs mode for zsh
# ctrl+e -> to move curosr to end; 
# ctrl+a -> to move cursor to beginning
# ctrl+f -> to move cursor to right; or accect autosuggestions
# ctrl+b -> to move cursor to left; or backward
# ctrl+p -> to navigate through previous history of commands
# ctrl+n -> to navigate through next history of commands
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# History 
HISTSIZE=9999999
SAVEHIST=$HISTSIZE
HISTFILE="$HISTFILE"
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# make suggestion case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu yes

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -h --long --all --sort=name --icons'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa -h --long --all --sort=name --icons'


# shell integrations; ctrl + r
eval "$(fzf --zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(direnv hook zsh)"
eval "$(atuin init zsh)"

[ -f "$HOME/.atuin/_atuin" ] && . "$HOME/.atuin/_atuin"
[ -f "$HOME/.local/share/taskfile/zsh_completions" ] && . "$HOME/.local/share/taskfile/zsh_completions"

# INFO: ================================[ custom aliases  ]================================
#
alias wakatime="$WAKATIME_HOME/.wakatime/wakatime-cli"
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias ssh-newkey="ssh-keygen -t ed25519 -C"
alias ssh-eval='eval "$(ssh-agent -s)"'
alias ssh-test='ssh -T git@github.com'
alias ssh-termux='ssh u0_760@192.168.0.101 -p 8022'

alias net-start-virt='sudo virsh net-start default'

# Tmux
alias tk='tmux kill-session'
alias tmux-delete-sessions="rm -rf ~/.local/share/tmux/resurrect/*"

alias docker-clean-buildx="docker buildx prune --all"
alias docker-clean-builder="docker builder prune --all"
alias docker-clean-image="docker image prune --all"


# saving some misc commands
alias battery-info="upower -i /org/freedesktop/UPower/devices/battery_BAT0"

# exa: ls commands with style
alias l='exa -h --long --all --sort=name --icons'
alias ls="exa -h --long --sort=name --icons --classify"

function loadEnv() {
  local envfile="$1"
  if [ -f "$envfile" ]; then
    export $(grep -v '^#' "$envfile" | xargs)
  fi
}

function pkill() {
  ps aux --sort=-%cpu | fzf --tmux --height 40% --border --layout=reverse --prompt="Select process to kill: " | awk '{print $2}' | xargs -r sudo kill
}


# general aliases
alias c='clear'
alias rbf='fc-cache -fv'

alias s=". ~/.zshrc;"

# Yay Package Manager / Aur Helper

alias .i='yay --noconfirm --needed -S' # To install a package (always run pacman -Syu, before installing)
alias .r="yay --noconfirm -Rns"        # To remove the package, avoid orphaned dependencies and erase its global configuration (which in most cases is the proper command to remove software.)
alias .u="yay --noconfirm -Syu"        # To update the system && Update the database
alias .rank-mirrors="sudo reflector --verbose --save /etc/pacman.d/mirrorlist --sort rate -l 50"

alias install-widevine="yay --noconfirm --needed -S chromium-widevine && sudo chmod a+x /usr/lib/chromium/WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so"

# usage > install-go go1.20.4
alias install-go='function _pkg-install-go(){ GOVER=$1 && echo "$GOVER.linux-amd64.tar.gz"; mkdir -p /mnt/storage/programs/go && rm -f /mnt/storage/programs/go/$GOVER.linux-amd64.tar.gz ; rm -rf /mnt/storage/programs/go/sdk ; wget -O /mnt/storage/programs/go/$GOVER.linux-amd64.tar.gz https://golang.org/dl/$GOVER.linux-amd64.tar.gz && tar -C /mnt/storage/programs/go -xzf /mnt/storage/programs/go/$GOVER.linux-amd64.tar.gz && mv /mnt/storage/programs/go/go /mnt/storage/programs/go/sdk && clear && /mnt/storage/programs/go/sdk/bin/go version && rm -f /mnt/storage/programs/go/$GOVER.linux-amd64.tar.gz ; unset -f _pkg-install-go; };_pkg-install-go'

alias fl="flutter"
alias pn='pnpm'
alias np='npm run'

alias n="nvim"
alias nv='nvim $(fzf -m --preview="bat --color=always {}")'
alias snv="sudo -E -s nvim"
alias nvim-remove-shada="rm -rf ~/.local/state/nvim/shada/"
alias hyprwin="hyprctl clients -j | jq '.[] | {class,title,pid}'"
alias kubectl="minikube kubectl"
alias audio-relay="pactl load-module module-null-sink sink_name=audiorelay-speakers sink_properties=device.description=AudioRelay-Speakers"

export NVM_DIR="/mnt/storage/programs/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source "$HOME/.local/bin/snipman/snipman_completions"

export JAVA_HOME="$mystorage/programs/appdev/android-studio/jbr"
export PATH="$PATH:$mystorage/programs/appdev/android-studio/jbr/bin"
