# ~/.zshenv

# Personal Directories
export mystorage="/mnt/storage"
export mygithub="github.com/sirjager"
export mydotfiles="$HOME/dotfiles"
export mydownloads="$mystorage/downloads"
export myscripts="$HOME/.local/bin"
export myrecentedits="$HOME/.local/state/recentedits.log"
export myledger="$mystorage/personal/ledgers/main.ledger"


# XDG Directories
export XDG_CACHE_HOME="$HOME/.cache"
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
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export PASSWORD_STORE_DIR="$HOME/.local/share/pass"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export W3M_DIR="$XDG_STATE_HOME/w3m"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

export YAZI_CONFIG_HOME="$XDG_CONFIG_HOME/yazi"
export ATAC_KEY_BINDINGS="$XDG_CONFIG_HOME/atac/vim.toml"
export KODI_DATA="$XDG_DATA_HOME/kodi"

export ZSH_CONFIG_DIR="$XDG_CONFIG_HOME/zsh"

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"
export VSCODE_PORTABLE="$XDG_CONFIG_HOME/vscode"


LESSHISTFILE=${LESSHISTFILE:-/tmp/less-hist}
PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc


export XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME \
    XDG_CACHE_HOME XDG_DESKTOP_DIR XDG_DOWNLOAD_DIR \
    XDG_TEMPLATES_DIR XDG_PUBLICSHARE_DIR XDG_DOCUMENTS_DIR \
    XDG_MUSIC_DIR XDG_PICTURES_DIR XDG_VIDEOS_DIR \
    SCREENRC ZSH_AUTOSUGGEST_STRATEGY HISTFILE

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
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# Add snippets:
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
zinit snippet OMZP::git
zinit snippet OMZP::sudo

# [functions autoload] =====================================
autoload -U compinit && compinit
zinit cdreplay -q

# Global Environment Variables
export GPG_TTY="$(tty)"
export EDITOR="nvim"
export DIRENV_LOG_FORMAT=""
export TERMINAL="kitty"
export BROWSER="brave"
export PG_COLOR="always"                     # postgres
export _JAVA_AWT_WM_NONREPARENTING=1         # For Java Applications
export XMODIFIERS='@im=fcitx'                # multilang keyboard
export GTK_IM_MODULE='fcitx'                 # multilang keyboard
export SDL_IM_MODULE='fcitx'                 # multilang keyboard
export QT_IM_MODULE='fcitx'                  # multilang keyboard
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1     # github
export CHROME_EXECUTABLE='/usr/bin/brave' # Chrome executable path
export ZSH_TMUX_AUTONAME_SESSION="true"      # autoname tmux sessions
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional

export PATH="$PATH:/sbin:$HOME/.local/bin" # custom scripts

