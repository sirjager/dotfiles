#!/bin/zsh

# [ Zinit Setup and Plugins ] ============================================
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

# Add snippets: 
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
zinit snippet OMZP::git
zinit snippet OMZP::sudo

# [functions autoload] =====================================
autoload -U compinit && compinit
zinit cdreplay -q

# [Emacs keybindings for zsh] =======================================
# ctrl+e -> to move curosr to end; 
# ctrl+a -> to move cursor to beginning
# ctrl+f -> to move cursor to right; or accect autosuggestions
# ctrl+b -> to move cursor to left; or backward
# ctrl+p -> to navigate through previous history of commands
# ctrl+n -> to navigate through next history of commands
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# [ History Management ] ================================================
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

export LS_COLORS="$(vivid generate catppuccin-macchiato)"

# [ Completion Settings ] =============================================
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu yes

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -h --long --all --sort=name --icons'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa -h --long --all --sort=name --icons'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)


# [ Custom Aliases  ]================================
alias wakatime="$WAKATIME_HOME/.wakatime/wakatime-cli"
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg && sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=EndeavourOS"

# SSH
alias ssh-newkey="ssh-keygen -t ed25519 -C" # Create New SSH key
alias ssh-eval='eval "$(ssh-agent -s)"'  # Evaluate SSH Agent
alias ssh-test='ssh -T git@github.com' # Test SSH

# Docker
alias docker-clean-buildx="docker buildx prune --all" # Clean Docker Buildx
alias docker-clean-builder="docker builder prune --all" # Clean Docker Builder
alias docker-clean-image="docker image prune --all" # Clean Unused Docker Images

# System Info: Battery
alias battery-info="upower -i /org/freedesktop/UPower/devices/battery_BAT0" # Show Battery Info

# General Aliases ================================================
alias s="source ~/.zshenv; source ~/.zshrc;" # Source Zsh Env And Configs
alias rbf='fc-cache -fv' # Rebuild Font Cache

# LS ============================================
alias l="eza --long --icons --git"
alias la="eza --icons --git --long --all"
alias ls="eza --icons --git"
alias lt="eza --tree --level=2 --long --icons --git"

# Directory Navigation ============================================
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Yay Package Manager / Aur Helper ===============================
alias .i="yay --noconfirm --needed -S"    # Install package if needed and skip confirmation
alias .r="yay --noconfirm -Rns"        # Remove packages without removing configurations
alias .u="yay --noconfirm -Syu"        # Update packages and repositories databases
alias .m="sudo reflector --verbose --save /etc/pacman.d/mirrorlist --sort rate -l 50" # Rank pacman mirrors list
alias pkg-add-widevine="yay --noconfirm --needed -S chromium-widevine && sudo chmod a+x /usr/lib/chromium/WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so"


# Application-Specific Aliases =====================================
alias fl="flutter"
alias pn='pnpm'
alias np='npm run'
alias n="nvim"
alias snv="sudo -E -s nvim"
alias nvim-remove-shada="rm -rf ~/.local/state/nvim/shada/"
alias hyprwin="hyprctl clients -j | jq '.[] | {class,title,pid}'"
alias audio-relay="pactl load-module module-null-sink sink_name=audiorelay-speakers sink_properties=device.description=AudioRelay-Speakers"
alias active-graphic-card="glxinfo | grep \"OpenGL renderer\" "
alias fix-cannot-open-display="xhost +localhost; xhost +si:localuser:root"
alias clear-shell-history="echo \"\" > $HISTFILE"

# [ Private Aliases  ]================================
[ -f "$mystorage/global/alias" ] && . "$mystorage/global/alias"
# [ -f "$CARGO_HOME/env" ] && . "$CARGO_HOME/env" 


# [ Custom Functions  ]================================
function ledger() {
  if [[ ! "$@" =~ "-f" ]]; then
    set -- -f "$myledger" "$@"
  fi
  /usr/bin/ledger "$@"
}

# Shell Integrations =============================================
eval "`fnm env`"
eval "$(fzf --zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(direnv hook zsh)"
eval "$(fnm completions --shell zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"
