# ~/.zshrc


if [ -z "$TMUX" ] && command -v tmux >/dev/null 2>&1; then
  tmux attach-session \
    -t "$(tmux list-sessions \
    -F "#{session_id}" 2>/dev/null | head -n 1)" || \
    tmux new-session
fi


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

fpath=(~/.local/bin/completions $fpath)

autoload -Uz compinit
compinit

# [ Shell Integrations ] =============================================
eval "`fnm env`"
eval "$(fzf --zsh)"
eval "$(atuin init zsh)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
# eval "$(cobra-cli completion zsh)"
# eval "$(replicgo completion zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm completions --shell zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"
export LS_COLORS="$(vivid generate catppuccin-macchiato)"

[ -f "$HOME/__aliases__" ] && . "$HOME/__aliases__"
