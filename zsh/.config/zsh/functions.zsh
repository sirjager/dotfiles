#!/bin/sh
# IMPORTANT: =======[ Read More in ~/.config/zsh/zlewrapper.zsh for custom keybindings ]========

# =================================================================================================================================
# Directory Navigation
function _mkcd() { mkdir -p -- "$1" && cd -- "$1" || return 1;} # usage: mkcd dir1/dir2
# =================================================================================================================================



# =================================================================================================================================
function _cdup() { cd "$(printf '../%.0s' $(seq "${1:-1}"))" || return 1; } # usage: cdup | cdup 3
# =================================================================================================================================



# =================================================================================================================================
# Reproducable package management using rebos : gitlab.com/Oglo12/rebos
function _rebosListGen() {
  file="$HOME/.config/rebos/machines/$(hostname)/gen.toml"
    awk '
        /^\[managers\./ {
            # Extract manager name, e.g., [managers.packages] → packages
            if (match($0, /\[managers\.([^\]]+)\]/, m)) manager=m[1];
            in_section=1;
            next
        }
        in_section && /items\s*=\s*\[/ {flag=1; next}
        flag {
            gsub(/"|,/, "");
            sub(/#.*/,"");
            line=$0;
            gsub(/^[ \t]+|[ \t]+$/,"",line);
            if(line!="" && line!="]"){print manager ":" line}
            if($0 ~ /\]/){flag=0}
        }
   ' "$file" | fzf | awk -F: '{print $2}' | xargs | wl-copy
}
# =================================================================================================================================



# =================================================================================================================================
function _rebosDeleteGen() {
local selected="$(rebos gen list | awk '{print $2, $(4), $(NF)}' | tac | fzf)"
	[ -z "$selected" ] && return
	selected_num="$(echo "$selected" | awk '{print $1}')"
	gum confirm \
		--default=true \
		--affirmative="yeah, delete it" \
		--negative="nah! never mind" \
		"Delete: $selected ?" &&
		rebos gen delete "$selected_num" ||
		return 0
}
# =================================================================================================================================



# =================================================================================================================================
# Preview Fonts
function _fontPreview() {  
	selected=$(fc-list | awk '{print $1}' | sed 's/://g' | rofi -dmenu -theme ~/.config/sxhkd/rofi/vertical.rasi -p "Preview Font")
	[ -z "$selected" ] && return 0
	floatwin display "$selected"
}
# =================================================================================================================================



# =================================================================================================================================
# ex: Extracts various compressed archive formats.
# Example: ex archive.tar.gz → Extracts using `tar xzf`
function _extract() {
	if [ -f "$1" ]; then
		case $1 in
		*.tar.bz2) tar xjf "$1" ;;
		*.tar.gz) tar xzf "$1" ;;
		*.bz2) bunzip2 "$1" ;;
		*.rar) unrar x "$1" ;;
		*.gz) gunzip "$1" ;;
		*.tar) tar xf "$1" ;;
		*.tbz2) tar xjf "$1" ;;
		*.tgz) tar xzf "$1" ;;
		*.zip) unzip "$1" ;;
		*.Z) uncompress "$1" ;;
		*.7z) 7z x "$1" ;;
		*.deb) ar x "$1" ;;
		*.tar.xz) tar xf "$1" ;;
		*.tar.zst) unzstd "$1" ;;
		*) echo "'$1' can not be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}
# =================================================================================================================================



# =================================================================================================================================
# ledger function: A wrapper around the `ledger` command to manage ledger files efficiently.
#
# Usage:
#   ledger [options]
#   ledger -f <file> [options]  # Use a specific ledger file
#   ledger -e                   # Edit the current year's ledger
#
# Behavior:
# - If `-f <file>` is provided, it uses that file.
# - If `-f` is not provided, it defaults to `$myledger` (must be set in ~/.zshenv).
# - If `-e` is provided, it opens the current year's ledger file (`YYYY.ledger`) in `$EDITOR`.
#
# Error Handling:
# - Exits if `$myledger` is not set and `-f` is not provided.
# - Ensures `$EDITOR` has access to related files by changing to the ledger's directory before opening.
function _ledger() {
	# check $myledger variable, throw error if does not exists
	local ledgerfile

	# Extract ledger file from `-f` flag
	for ((i = 0; i < ${#args[@]}; i++)); do
		if [[ ${args[i]} == "-f" && -n ${args[i + 1]} ]]; then
			ledgerfile="${args[i + 1]}"
			break
		fi
	done

	if [ ! -f "$ledgerfile" ]; then
		: "${myledger:?Error: myledger is not set. Please define it in the environment or use ~/.zshenv}"
		ledgerfile="$myledger"
	fi

	[ -z "$ledgerfile" ] && echo "Error: No ledger file provided" && exit 1

	if [[ " ${*} " =~ " -e " ]]; then
		curr_working_dir="$(pwd)" # to get back in current working directory
		ledgerdir="$(dirname "$ledgerfile")"
		current_year_ledger="$ledgerdir/$(date +%Y).ledger"
		cd "$ledgerdir" || return # it will help $EDITOR to see other files in file manager
		"${EDITOR:-nvim}" "$current_year_ledger"
		cd "$curr_working_dir" || return # back to previous working directory
	else
		command ledger -f "$ledgerfile" "$@"
	fi
}
# =================================================================================================================================



# =================================================================================================================================
function _nvim() {
  local prompt=" Use Neovim Config  "
  local items=("default" $(command ls ~/.config | grep 'Vim' | xargs ))
  local config=$(printf "%s\n" "${items[@]}" | fzf --prompt="$prompt" --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config="JagerVim" # my main
  fi
  NVIM_APPNAME=$config nvim $@
}
# =================================================================================================================================



# =================================================================================================================================
function _connect() {
  local prompt="  Enter Device Port  "
  local input=$(printf "%s\n" | fzf --prompt="$prompt" --height=~50% --layout=reverse --border --print-query --exit-0 | head -n1)
  if ! [[ $input =~ ^[0-9]+$ ]]; then
    echo "Invalid port '$input'. Port should only contain numbers"
    return 0
  else
   adb connect 192.168.0.101:$input && return 0
  fi
}
# =================================================================================================================================



# =================================================================================================================================
function _rebosAddPkg() {
  local prompt="󱧘 Install packages: "
  local input=$(printf "%s\n" | fzf --prompt="$prompt" --height=~50% --layout=reverse --border --print-query --exit-0 | head -n1)
  if [[ -z "$input" ]]; then
    return 0
  fi
  .rebos add -b -c "$input"
}
# =================================================================================================================================



# =================================================================================================================================
function _rebosRemovePkg() {
  local prompt="󱧔 Uninstall packages: "
  local input=$(printf "%s\n" | fzf --prompt="$prompt" --height=~50% --layout=reverse --border --print-query --exit-0 | head -n1)
  if [[ -z "$input" ]]; then
    return 0
  fi
  .rebos remove -b -c "$input"
}
# =================================================================================================================================


