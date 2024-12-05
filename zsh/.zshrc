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

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -h --long --all --sort=name --icons'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -h --long --all --sort=name --icons'


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
alias l='eza -h --long --all --sort=name --icons'
alias ls="eza -h --long --sort=name --icons --classify"

# general aliases
alias c='clear'
alias rbf='fc-cache -fv'

alias s=". ~/.zshrc;"

alias n="nvim"
alias nv='nvim $(fzf -m --preview="bat --color=always {}")'
alias nvim-remove-shada="rm -rf ~/.local/state/nvim/shada/"


if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi
