# ~/.zprofile

# Wayland/X11 handling
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  # export GDK_BACKEND="wayland,x11"
  export QT_QPA_PLATFORM="wayland;xcb"
  export SDL_VIDEODRIVER="wayland"
  export CLUTTER_BACKEND="wayland"
  export QT_QPA_PLATFORMTHEME="gtk3"
  export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
  export ELECTRON_OZONE_PLATFORM_HINT="wayland"
else
  # exportGDK_BACKEND="x11"
  export QT_QPA_PLATFORM="xcb"
fi

# Global Environment Variables
export GPG_TTY="$(tty)"
export EDITOR="NVIM_APPNAME=JagerVim nvim"
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
export CHROME_EXECUTABLE='/usr/bin/brave'    # Chrome executable path
export ZSH_TMUX_AUTONAME_SESSION="true"      # autoname tmux sessions
export CARAPACE_BRIDGES='zsh,inshellisense'  # optional

# Android & Flutter
# export FLUTTER_ROOT="$mystorage/programs/appdev/flutter"
# export ANDROID_AVD_HOME="$mystorage/programs/appdev/android-avd"
# export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"
export JAVA_HOME="$mystorage/programs/appdev/android-studio/jbr"
export ANDROID_HOME="$mystorage/programs/appdev/android-studio-sdk"

# Flutter, Java And Android
# export PATH="$PATH:$FLUTTER_ROOT/bin"
export PATH="$PATH:$JAVA_HOME/bin:$JAVA_HOME/../bin"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin"


export MASON_BIN="$XDG_DATA_HOME/nvim/mason/bin" # Mason bin
export PATH="$PATH:$PNPM_HOME:$MASON_BIN"
export PATH="$PATH:$mystorage/programs/protoc/bin"


# Android Studio
export PATH="$PATH:$mystorage/programs/appdev/android-studio/bin"
export PATH="$PATH:$mystorage/programs/appdev/android-studio/jbr/bin"


# Golang
export GO111MODULE="on"
export GOPRIVATE="$mygithub/*"
export GOPATH="$mystorage/workspace/goenv"
export GOBIN="$mystorage/workspace/goenv/bin"

# # using rebos to manage it
# export NVM_DIR="$mystorage/programs/nvm"
# export FNM_PATH="$mystorage/programs/fnm"
# export FNM_DIR="$mystorage/programs/fnm"
# export PNPM_HOME="$mystorage/programs/pnpm"

export BUN_INSTALL="$mystorage/programs/bun"
export CARGO_HOME="$mystorage/programs/cargo"
export RUSTUP_HOME="$mystorage/programs/rustup"
export PATH="$PATH:$HOME/.cargo/bin" # rust pkgs
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin:$GOBIN" # go pkgs


# Node.js & Package Managers
export PATH="$PATH:$FNM_PATH"
export PATH="$PATH:$BUN_INSTALL/bin"
export PATH="$PATH:$PNPM_HOME:$HOME/.pub-cache/bin"
export PATH="$PATH:$mystorage/programs/node/pnpm/global/5/node_modules/grpc-tools/bin"


# Custom Scripts Directory
export PATH="$PATH:$HOME/.local/bin"
