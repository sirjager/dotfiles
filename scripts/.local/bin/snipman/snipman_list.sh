#!/usr/bin/env bash

# name: snipman_list.sh
# desc: lists all snippets in table and reads selected one
# usage: snipman_list.sh

source ~/.local/bin/snipman/snipman_utils.sh

DELETE_SNIPPET="false"

SNIPMAN_DIRECTORY="${SNIPMAN_DIRECTORY:-$HOME/.local/share/snipman}"

# Check for deletion flags
for arg in "$@"; do
	case $arg in
	--delete | --remove | --rm)
		DELETE_SNIPPET="true"
		;;
	esac
done

csv_output="File,Name,Description,Author,Created"
snippet_files=()
separator="," # Define the separator variable

# Gather all snippet file paths recursively
while IFS= read -r -d '' file; do
	snippet_files+=("$file")
done < <(find "$SNIPMAN_DIRECTORY" -type f -print0)

# Loop through each snippet file
for filepath in "${snippet_files[@]}"; do

	# Initialize variables for meta tags
	filename="$(basename "$filepath")"
	name="<empty>"
	desc="<empty>"
	author="<empty>"
	created=$(get_file_creation_date "$filepath")

	# Read the snippet file and extract meta tags
	while IFS= read -r line; do
		case "$line" in
		*"#Name:"*) name="${line/*#Name: /}" ;;
		*"#Desc:"*) desc="${line/*#Desc: /}" ;;
		*"#Author:"*) author="${line/*#Author: /}" ;;
		esac
	done <"$filepath"

	# Append the extracted values to the CSV output
	csv_output+=$'\n'"$filename$separator$name$separator$desc$separator$author$separator$created"
done

tmpfile="/tmp/snipman.csv"
echo -e "$csv_output" >"$tmpfile"

# selected row
selected=$(gum table --height=20 --widths=20,25,30,20,20 --selected.foreground="#FF8A8A" --selected.background="#121212" -f "$tmpfile")

# deleted temp csv file
rm -f "$tmpfile"

# extract selected filename
selected_filename="${selected%%,*}"

# exit if no selected
[ -z "$selected_filename" ] && exit 0

if [ "$DELETE_SNIPPET" == "true" ]; then
	sh ~/.local/bin/snipman/snipman_delete.sh "$selected_filename"
else
	# now showing the snippet
	sh ~/.local/bin/snipman/snipman_read.sh "$selected_filename" "$@"
fi
