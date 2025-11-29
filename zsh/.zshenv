# ~/.zshenv

# Personal Directories
export mystorage="/mnt/storage"
export mygithub="github.com/sirjager"
export mydotfiles="$HOME/dotfiles"
#
export mydownloads="$mystorage/downloads"
export mymusic="$mystorage/downloads/Music"
export myvideos="$mystorage/downloads/Videos"
export mypictures="$mystorage/downloads/Pictures"
export mydocuments="$mystorage/downloads/Documents"
#
export mywallpapers="$mystorage/wallpaper"
export myscripts="$mydotfiles/scripts/.local/bin"



# XDG Directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Public Directories
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$mydownloads"
export XDG_MUSIC_DIR="$mydownloads/Music"
export XDG_VIDEOS_DIR="$mydownloads/Videos"
export XDG_PICTURES_DIR="$mydownloads/Pictures"
export XDG_PUBLICSHARE_DIR="$mydownloads/Public"
export XDG_DOCUMENTS_DIR="$mydownloads/Documents"
export XDG_TEMPLATES_DIR="$mydownloads/Templates"


# XDG Base Directory
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export HISTFILE="$XDG_STATE_HOME/shell_history"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export USERXSESSION="$XDG_CACHE_HOME/X11/xsession"
export USERXSESSIONRC="$XDG_CACHE_HOME/X11/xsessionrc"
export ALTUSERXSESSION="$XDG_CACHE_HOME/X11/Xsession"
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
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


export LESSHISTFILE=${LESSHISTFILE:-/tmp/less-hist}
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc

export XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME \
    XDG_CACHE_HOME XDG_DESKTOP_DIR XDG_DOWNLOAD_DIR \
    XDG_TEMPLATES_DIR XDG_PUBLICSHARE_DIR XDG_DOCUMENTS_DIR \
    XDG_MUSIC_DIR XDG_PICTURES_DIR XDG_VIDEOS_DIR \
    SCREENRC HISTFILE

