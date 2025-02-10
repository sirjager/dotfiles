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


# [ Completion Settings ] =============================================
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu yes

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -h --long --all --sort=name --icons'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa -h --long --all --sort=name --icons'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# [ Shell Integrations ] =============================================
eval "`fnm env`"
eval "$(fzf --zsh)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
eval "$(cobra-cli completion zsh)"
eval "$(replicgo completion zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm completions --shell zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"
export LS_COLORS="$(vivid generate catppuccin-macchiato)"

# [ Custom Aliases ] =============================================
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliases" ] && . "${XDG_CONFIG_HOME:-$HOME/.config}/aliases"
