#!/bin/sh

alias c="clear"
alias cat="bat"

# [ Custom Aliases  ]================================
alias wakatime="$WAKATIME_HOME/.wakatime/wakatime-cli"
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg && sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=EndeavourOS"

# SSH
alias ssh-newkey="ssh-keygen -t ed25519 -C" # Create New SSH key
alias ssh-eval='eval "$(ssh-agent -s)"'     # Evaluate SSH Agent
alias ssh-test='ssh -T git@github.com'      # Test SSH

alias sys='sudo systemctl' # Systemctl

# Sway
alias swayapps='swaymsg -t get_tree | jq -r '"'"'.. | objects | if has("app_id") and .app_id != null then "id:" + .app_id elif has("class") and .class != null then "cl:" + .class else empty end'"'"' | sort -u'

# Docker
alias docker-clean-buildx="docker buildx prune --all"   # Clean Docker Buildx
alias docker-clean-builder="docker builder prune --all" # Clean Docker Builder
alias docker-clean-image="docker image prune --all"     # Clean Unused Docker Images

# System Info: Battery
alias battery-info="upower -i /org/freedesktop/UPower/devices/battery_BAT0" # Show Battery Info

# Adb commands
alias violet-scrcpy="scrcpy --no-audio -s $(adb devices | grep .101: | awk '{print $1}')"

# General Aliases ================================================
alias so="source ~/.zshenv && source ~/.zprofile && source ~/.zshrc;" # Source Zsh Env And Configs
alias cp="cp -i"                              # confirm before overwriting something

# LS ============================================
alias l="eza --long --icons --git"
alias la="eza --icons --git --long --all"
alias ls="eza --icons --git"
alias lt="eza --tree --level=2 --long --icons --git"

# Git Commands ===================================================
alias fetch="git fetch"                                   # Git Fetch
alias addup="git add -u"                                  # Git add updated
alias addall="git add ."                                  # Git add all
alias branch="git branch"                                 # Git Branch
alias checkout="git checkout"                             # Git checkout
alias pull="git pull origin"                              # Git pull origin
alias rebase="git pull --rebase"                          # Git pull rebase
alias newtag="git tag -a"                                 # Git new tag
alias tags="git tag"                                      # Git tags
alias gitlog="git log --outline --graph --decorate --all" # Git Log


# Youtube DL =====================================================
alias yta-acc="youtube-dl --extract-audio --audio-format mp3"
alias yta-best="youtube-dl --extract-audio --audio-format best"
alias yta-flac="youtube-dl --extract-audio --audio-format flac"
alias yta-m4a="youtube-dl --"

# More related in : ~/dotfiles/shell/.func
alias add="command .rebos add"
alias rem="command .rebos remove"

# Paru | Yay | Pacman | Package Manager
alias .i="yay --needed -S"          # Install package if needed and skip confirmation
alias .r="yay -Rns"                 # Remove packages without removing configurations
alias .u="yay -Syu"                 # Update packages and repositories databases
alias .s="yay -Syy"                 # Sync packages and repositories
alias .o='pacman -Qtdq'             # Orphaned packages listing
alias .c='yay -Rns $(pacman -Qtdq)' # Cleanup Orphaned packages and their dependencies

# Coloring Grep Outputs
alias grep='command grep --color=auto'

# get fastest mirrors
alias mirror="sudo reflector -f 30 --sort rate -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist" # Rank pacman mirrors list
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"         # sort by delay
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"         # sort by score
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"           # sor by age

alias pkg-add-widevine="paru --needed -S chromium-widevine && sudo chmod a+x /usr/lib/chromium/WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so"

# Application-Specific Aliases =====================================
alias pn='pnpm'
alias np='npm run'
alias hyprwin="hyprctl clients -j | jq '.[] | {class,title,pid}'"
alias audio-relay="pactl load-module module-null-sink sink_name=audiorelay-speakers sink_properties=device.description=AudioRelay-Speakers"
alias active-graphic-card="glxinfo | grep \"OpenGL renderer\" "
alias fix-cannot-open-display="xhost +localhost; xhost +si:localuser:root"

alias clear-shell-history='echo "" > "$HISTFILE"'

# More related in : ~/dotfiles/shell/.func
alias rebos-list="rebos gen list | tac | fzf >/dev/null 2>&1" # list generations, easier to search
alias rebos-align="rebos gen align"                           # align generation numbers
alias rebos-commit="rebos gen commit"                         # commit rebos generation
alias rebos-check="rebos config check"                        # check rebos configs
alias rebos-build="rebos gen current build"                   # build rebos current generation

alias font-cache='fc-cache -f >/dev/null 2>&1'                                     # Font Cache Refresh
alias font-list="fc-list | awk '{print \$F}' | sed 's/://g' | fzf >/dev/null 2>&1" # Search Font

# Neovim aliases
alias n="nvim"
alias nb="NVIM_APPNAME=BlazeVim nvim"
alias nj="NVIM_APPNAME=JagerVim nvim"
alias vi="nvim"
alias snv="sudo -E -s nvim"

# Applications
alias obsidian="command obsidian --enable-features=UseOzonePlatform --ozone-platform=wayland"

#
alias myscriptPerms="chmod +x $myscripts/*"
