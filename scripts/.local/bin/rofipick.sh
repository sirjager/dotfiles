#!/usr/bin/env zsh
# not completed yet
DIR="$mystorage/wallpaper"
ROFI_THEME="$HOME/.local/bin/rofi-dmenu/grid.rasi"

list_directory() {
	find "$1" -maxdepth 1 -mindepth 1 -type f -o -type d -exec basename {} \;
}

show_rofi() {
	echo "$1" | rofi -dmenu -p "Results" -theme "$ROFI_THEME"
}

DIR_ITEMS=$(list_directory "$DIR")

show_rofi "$DIR_ITEMS"
