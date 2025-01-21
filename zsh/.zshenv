# ~/.zshenv

# Personal Directories
export mystorage="/mnt/storage"
export mygithub="github.com/sirjager"
export mydotfiles="$HOME/dotfiles"
export mydownloads="$mystorage/downloads"
export myrecentedits="$HOME/.local/state/recentedits.log"

# XDG Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$mydownloads/Documents"
export XDG_DOWNLOAD_DIR="$mydownloads"
export XDG_MUSIC_DIR="$mydownloads/Music"
export XDG_PICTURES_DIR="$mydownloads/Pictures"
export XDG_PUBLICSHARE_DIR="$mydownloads/Public"
export XDG_TEMPLATES_DIR="$mydownloads/Templates"
export XDG_VIDEOS_DIR="$mydownloads/Videos"

# XDG Base Directory
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export HISTFILE="$XDG_STATE_HOME/shell_history"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export USERXSESSION="$XDG_CACHE_HOME/X11/xsession"
export USERXSESSIONRC="$XDG_CACHE_HOME/X11/xsessionrc"
export ALTUSERXSESSION="$XDG_CACHE_HOME/X11/Xsession"
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"
export VSCODE_PORTABLE="$XDG_CONFIG_HOME/vscode"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export PASSWORD_STORE_DIR="$HOME/.local/share/pass"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export KODI_DATA="$XDG_DATA_HOME/kodi"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export W3M_DIR="$XDG_STATE_HOME/w3m"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"


# Golang
export GO111MODULE="on"
export GOPRIVATE="$mygithub/*"
export GOROOT="$mystorage/programs/go/sdk"
export GOPATH="$mystorage/workspace/goenv"
export GOMODCACHE="$mystorage/programs/go/mod"
export GOBIN="$mystorage/workspace/goenv/bin"
export GOCACHE="$mystorage/workspace/goenv/cache"

# Android & Flutter
export FLUTTER_ROOT="$mystorage/programs/appdev/flutter"
export ANDROID_AVD_HOME="$mystorage/programs/appdev/android-avd"
export JAVA_HOME="$mystorage/programs/appdev/android-studio/jbr"
export ANDROID_HOME="$mystorage/programs/appdev/android-studio-sdk"

# Misc
export BUN_INSTALL="$mystorage/programs/bun"
export PNPM_HOME="$mystorage/programs/pnpm"
export CARGO_HOME="$mystorage/programs/cargo"
export RUSTUP_HOME="$mystorage/programs/rustup"
export YAZI_CONFIG_HOME="$XDG_CONFIG_HOME/yazi"
export ATAC_KEY_BINDINGS="$XDG_CONFIG_HOME/atac/vim.toml"
export NVM_DIR="$mystorage/programs/nvm"

# Global Environment Variables
export GPG_TTY="$(tty)"
export EDITOR="nvim"
export DIRENV_LOG_FORMAT=""
export TERMINAL="kitty"
export BROWSER="chromium"
export LSCOLORS="0xGxBxDxCxEgEdxbxgxcxd	"    # terminal colors releated
export PG_COLOR="always"                     # postgres
export _JAVA_AWT_WM_NONREPARENTING=1         # For Java Applications
export XMODIFIERS='@im=fcitx'                # multilang keyboard
export GTK_IM_MODULE='fcitx'                 # multilang keyboard
export SDL_IM_MODULE='fcitx'                 # multilang keyboard
export QT_IM_MODULE='fcitx'                  # multilang keyboard
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1     # github
export CHROME_EXECUTABLE='/usr/bin/chromium' # Chrome executable path
export ZSH_TMUX_AUTONAME_SESSION="true"      # autoname tmux sessions


# Go
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"
export PATH="$PATH:$GOBIN"

# Node.js & Package Managers
export PATH="$PATH:$PNPM_HOME:$HOME/.pub-cache/bin"
export PATH="$PATH:$mystorage/programs/node/pnpm/global/5/node_modules/grpc-tools/bin"

# Flutter, Java And Android 
export PATH="$PATH:$FLUTTER_ROOT/bin"
export PATH="$PATH:$JAVA_HOME/bin:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools"

# Android Studio
export PATH="$PATH:$mystorage/programs/appdev/android-studio/bin"
export PATH="$PATH:$mystorage/programs/appdev/android-studio/jbr/bin"

# Miscellaneous
export PATH="$PATH:$mystorage/programs/Postman"
export PATH="$PATH:$HOME/.local/bin:$WAKATIME_HOME/.wakatime"
export PATH="$PATH:$XDG_CONFIG_HOME/emacs/bin:$XDG_CONFIG_HOME/rofi/scripts"
export PATH="$PATH:$XDG_DATA_HOME/nvim/mason/bin:$mystorage/programs/protoc/bin"
