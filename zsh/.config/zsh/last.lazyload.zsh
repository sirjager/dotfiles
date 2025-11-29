#!/bin/zsh
# =====================================================================
# Lazy Load Configurations for Zsh
# ---------------------------------------------------------------------
#  - Defers heavy integrations until first prompt (precmd)
#  - Uses cached compinit for faster completion
# =====================================================================


# ---------------------------------------------------------------------
# ⚡ Load minimal FNM setup early (for completions)
# ---------------------------------------------------------------------
if command -v fnm &>/dev/null; then
  eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"
fi

# ---------------------------------------------------------------------
# 🧩 Lazy-load hook setup
# ---------------------------------------------------------------------
autoload -Uz add-zsh-hook

# Define lazy initializer
_init_tools_lazy() {
  # 🧠 Shell Integrations
  eval "$(fzf --zsh)"
  eval "$(atuin init zsh)"
  eval "$(direnv hook zsh)"
  eval "$(starship init zsh)"
  eval "$(zoxide init --cmd cd zsh)"
  export LS_COLORS="$(vivid generate catppuccin-macchiato)"
  # echo -e "\e[2m✨Lazy-loaded Zsh integrations\e[0m"
  # Remove this hook after first run
  add-zsh-hook -D precmd _init_tools_lazy

  cd() {
      __zoxide_z "$@" || return
      # If inside tmux, rename the window to the new directory
      if [[ -n "$TMUX" ]]; then
        # tmux rename-window "$PWD"
        tmux rename-window "$(basename "$PWD")"
      fi
  }

}

# Add hook to run before the first prompt draw
add-zsh-hook precmd _init_tools_lazy

# ---------------------------------------------------------------------
# ⚙️ Completion Settings
# ---------------------------------------------------------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu yes
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'

# FZF-tab previews
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -h --long --all --sort=name --icons'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa -h --long --all --sort=name --icons'

# Add custom completions
fpath=(~/.local/bin/completions $fpath)

# Use cached compinit
autoload -Uz compinit
compinit -C

# Carapace completions
source <(carapace _carapace)



