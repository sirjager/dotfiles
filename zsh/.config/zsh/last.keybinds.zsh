#!/bin/sh

# [Emacs keybindings for zsh] =======================================
# ctrl+e -> to move curosr to end;
# ctrl+a -> to move cursor to beginning
# ctrl+f -> to move cursor to right; or accect autosuggestions
# ctrl+b -> to move cursor to left; or backward
# ctrl+p -> to navigate through previous history of commands
# ctrl+n -> to navigate through next history of commands
bindkey -e
bindkey '^p' history-search-backward
bindkey '^u' history-search-forward

bindkey '^h' backward-char
bindkey '^l' forward-char
bindkey '^j' history-search-backward
bindkey '^k' history-search-forward

_bindkey '^n' _nvim


