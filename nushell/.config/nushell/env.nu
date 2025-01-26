# env.nu
#
# Installed by:
# version = "0.101.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# It is loaded before config.nu and login.nu

# Personal Directories
$env.mystorage = '/mnt/storage'
$env.mygithub = 'github.com/sirjager'
$env.mydotfiles = $env.HOME + '/dotfiles'
$env.mydownloads = $env.mystorage + '/downloads'
$env.myrecentedits = $env.HOME + '/.local/state/recentedits.log'

# XDG Directories
$env.XDG_CACHE_HOME = $env.HOME + '/.cache'
$env.XDG_CONFIG_HOME = $env.HOME + '/.config'
$env.XDG_DATA_HOME = $env.HOME + '/.local/share'
$env.XDG_STATE_HOME = $env.HOME + '/.local/state'
$env.XDG_DESKTOP_DIR = $env.HOME + '/Desktop'
$env.XDG_DOCUMENTS_DIR = $env.mydownloads + '/Documents'
$env.XDG_DOWNLOAD_DIR = $env.mydownloads
$env.XDG_MUSIC_DIR = $env.mydownloads + '/Music'
$env.XDG_PICTURES_DIR = $env.mydownloads + '/Pictures'
$env.XDG_PUBLICSHARE_DIR = $env.mydownloads + '/Public'
$env.XDG_TEMPLATES_DIR = $env.mydownloads + '/Templates'
$env.XDG_VIDEOS_DIR = $env.mydownloads + '/Videos'

# XDG Base Directory
$env.XINITRC = $env.XDG_CONFIG_HOME + '/X11/xinitrc'
$env.XSERVERRC = $env.XDG_CONFIG_HOME + '/X11/xserverrc'
$env.HISTFILE = $env.XDG_STATE_HOME + '/shell_history'
$env.XAUTHORITY = $env.XDG_RUNTIME_DIR + '/Xauthority'
$env.USERXSESSION = $env.XDG_CACHE_HOME + '/X11/xsession'
$env.USERXSESSIONRC = $env.XDG_CACHE_HOME + '/X11/xsessionrc'
$env.ALTUSERXSESSION = $env.XDG_CACHE_HOME + '/X11/Xsession'
$env.ERRFILE = $env.XDG_CACHE_HOME + '/X11/xsession-errors'
$env.WAKATIME_HOME = $env.XDG_CONFIG_HOME + '/wakatime'
$env.VSCODE_PORTABLE = $env.XDG_CONFIG_HOME + '/vscode'
$env.PYENV_ROOT = $env.XDG_DATA_HOME + '/pyenv'
$env.GTK_RC_FILES = $env.XDG_CONFIG_HOME + '/gtk-1.0/gtkrc'
$env.GTK2_RC_FILES = $env.XDG_CONFIG_HOME + '/gtk-2.0/gtkrc'
$env.INPUTRC = $env.XDG_CONFIG_HOME + '/inputrc'
$env.PASSWORD_STORE_DIR = $env.HOME + '/.local/share/pass'
$env.DOCKER_CONFIG = $env.XDG_CONFIG_HOME + '/docker'
$env.WINEPREFIX = $env.XDG_DATA_HOME + '/wineprefixes/default'
$env.KODI_DATA = $env.XDG_DATA_HOME + '/kodi'
$env.NPM_CONFIG_USERCONFIG = $env.XDG_CONFIG_HOME + '/npm/npmrc'
$env.W3M_DIR = $env.XDG_STATE_HOME + '/w3m'
$env.STARSHIP_CONFIG = $env.XDG_CONFIG_HOME + '/starship/starship.toml'

# Golang
$env.GO111MODULE = 'on'
$env.GOPRIVATE = $env.mygithub + '/*'
$env.GOROOT = $env.mystorage + '/programs/go/sdk'
$env.GOPATH = $env.mystorage + '/workspace/goenv'
$env.GOMODCACHE = $env.mystorage + '/programs/go/mod'
$env.GOBIN = $env.mystorage + '/workspace/goenv/bin'
$env.GOCACHE = $env.mystorage + '/workspace/goenv/cache'

# Android & Flutter
$env.FLUTTER_ROOT = $env.mystorage + '/programs/appdev/flutter'
$env.ANDROID_AVD_HOME = $env.mystorage + '/programs/appdev/android-avd'
$env.JAVA_HOME = $env.mystorage + '/programs/appdev/android-studio/jbr'
$env.ANDROID_HOME = $env.mystorage + '/programs/appdev/android-studio-sdk'

# Misc
$env.BUN_INSTALL = $env.mystorage + '/programs/bun'
$env.PNPM_HOME = $env.mystorage + '/programs/pnpm'
$env.CARGO_HOME = $env.mystorage + '/programs/cargo'
$env.RUSTUP_HOME = $env.mystorage + '/programs/rustup'
$env.YAZI_CONFIG_HOME = $env.XDG_CONFIG_HOME + '/yazi'
$env.ATAC_KEY_BINDINGS = $env.XDG_CONFIG_HOME + '/atac/vim.toml'
$env.NVM_DIR = $env.mystorage + '/programs/nvm'
$env.FNM_PATH = $env.mystorage + '/programs/fnm'

# Global Environment Variables
$env.GPG_TTY = 'tty'
$env.EDITOR = 'nvim'
$env.DIRENV_LOG_FORMAT = ''
$env.TERMINAL = 'kitty'
$env.BROWSER = 'chromium'
$env.LSCOLORS = '0xGxBxDxCxEgEdxbxgxcxd'
$env.PG_COLOR = 'always'
$env._JAVA_AWT_WM_NONREPARENTING = '1'
$env.XMODIFIERS = '@im=fcitx'
$env.GTK_IM_MODULE = 'fcitx'
$env.SDL_IM_MODULE = 'fcitx'
$env.QT_IM_MODULE = 'fcitx'
$env.GIT_DISCOVERY_ACROSS_FILESYSTEM = '1'
$env.CHROME_EXECUTABLE = '/usr/bin/chromium'
$env.ZSH_TMUX_AUTONAME_SESSION = 'true'
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional


# Nushell Prompt Indicators For Vi Mode
$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " } # default: >
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }


# Paths

# Go
$env.PATH = ($env.PATH | append ($env.GOPATH + '/bin'))       # Go workspace binaries
$env.PATH = ($env.PATH | append ($env.GOROOT + '/bin'))       # Go SDK binaries
$env.PATH = ($env.PATH | append $env.GOBIN)                  # Go binaries

# Node.js & Package Managers
$env.PATH = ($env.PATH | append $env.FNM_PATH)               # Node.js version manager (fnm)
$env.PATH = ($env.PATH | append $env.PNPM_HOME)              # pnpm package manager

# Flutter, Java, and Android
$env.PATH = ($env.PATH | append ($env.FLUTTER_ROOT + '/bin'))  # Flutter binaries
$env.PATH = ($env.PATH | append ($env.JAVA_HOME + '/bin'))     # Java binaries
$env.PATH = ($env.PATH | append ($env.ANDROID_HOME + '/tools/bin'))  # Android SDK tools
$env.PATH = ($env.PATH | append ($env.ANDROID_HOME + '/emulator'))   # Android emulator
$env.PATH = ($env.PATH | append ($env.ANDROID_HOME + '/platform-tools'))  # Android platform tools

# Android Studio
$env.PATH = ($env.PATH | append ($env.mystorage + '/programs/appdev/android-studio/bin'))  # Android Studio binaries
$env.PATH = ($env.PATH | append ($env.mystorage + '/programs/appdev/android-studio/jbr/bin'))  # Android Studio Java binaries

# Miscellaneous
$env.PATH = ($env.PATH | append ($env.FNM_PATH))  # FNM
$env.PATH = ($env.PATH | append ($env.WAKATIME_HOME + '/.wakatime'))  # Wakatime
$env.PATH = ($env.PATH | append ($env.XDG_CONFIG_HOME + '/rofi/scripts'))  # Rofi scripts
$env.PATH = ($env.PATH | append ($env.mystorage + '/programs/protoc/bin'))  # Protobuf binaries
$env.PATH = ($env.PATH | append ($env.XDG_DATA_HOME + '/nvim/mason/bin'))  # Neovim Mason binaries
$env.PATH = ($env.PATH | append ($env.HOME + '/.local/bin'))  # Local bin dir

mkdir ~/.cache/nushell
carapace _carapace nushell | save --force ~/.cache/nushell/carapace.nu
starship init nu | save -f ~/.cache/nushell/starship.nu
zoxide init nushell | save -f ~/.cache/nushell/zoxide.nu
