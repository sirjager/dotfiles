#!/usr/bin/env bash

# name: snipman_read.sh
# desc: read a snippet
# usage: snipman_read.sh <name>

source ~/.local/bin/snipman/snipman_utils.sh

SNIP_NAME=""        ## name of the snippet to read
SKIP_INPUTS="false" ## skip updating numbered variables when using snip

# number of lines to show of snippet files
LINES_BEFORE=2
LINES_AFTER=2

# Parse arguments
while [[ $# -gt 0 ]]; do
	case $1 in
	--clip | --copy | --clipboard | --yank)
		COPY_TO_CLIPBOARD="true"
		shift
		;;
	--silent)
		SILENT="true"
		shift
		;;
	--no-vars | --no-inputs | --skip-inputs | --skip-vars | --skip)
		SKIP_INPUTS="true"
		shift
		;;
	--line-after)
		shift
		if [[ $# -gt 0 && $1 =~ ^[0-9]+$ ]]; then
			LINES_AFTER="$1"
			shift
		fi
		;;
	--line-before)
		shift
		if [[ $# -gt 0 && $1 =~ ^[0-9]+$ ]]; then
			LINES_BEFORE="$1"
			shift
		fi
		;;
	*)
		SNIP_NAME="$1"
		shift
		;;
	esac
done

usage() {
	echo "Usage     : $0 <name>"
	echo "Example 1 : $0 create-react-component.ts"
	echo "Example 2 : $0 bash-template.sh --copy"
	echo "Example 3 : $0 bash-template.sh --silent --skip-inputs --copy"
	exit 1
}

if [ -z "$SNIP_NAME" ]; then
	usage
fi

# Orignal snippet filepath
filepath=$(get_file_path "$SNIP_NAME")

if [ ! -f "$filepath" ]; then
	echo "$SNIP_NAME does not exists" >&2
	exit 1
fi

# Original snippet filename
filename="$(basename "$filepath")"

# Temporary snippet filepath
tmpfile="/tmp/$filename"

# Original snippet file content
content=$(<"$filepath")

# Copy original snippet content to temporary file
echo "$content" >"$tmpfile"

if [ "$SKIP_INPUTS" != "true" ]; then
	vars=($(grep -o '\$[0-9]\+\|\${[0-9]\+}' "$tmpfile" | sort -u))
	for var in "${vars[@]}"; do
		line_info=$(grep -n -F "$var" "$tmpfile")
		lineno=$(echo "$line_info" | cut -d: -f1)
		line=$(echo "$line_info" | cut -d: -f2-)

		# Calculate the line range for bat (two lines before and two lines after)
		start=$((lineno - lines_before))
		[ $start -lt 1 ] && start=1 # Ensure start is at least line 1
		range="${start}:+$((lines_before + lines_after))"

		# Previewing variable line where var needs to be filled
		preview_file "$tmpfile" --file-name "$filepath" --line-range "$range"

		user_input="$(gum input --header " Enter placeholder value for $var " --placeholder "$var" --header.foreground="$header_foreground" --header.background="$header_background")"

		# Updating variable with absolute value
		content=${content//$var/$user_input}

		# Every time variable is updated we will write to tempfile
		echo "$content" >"$tmpfile"
	done
fi

preview_file "$tmpfile" --file-name "Preview Only: $filepath"

[ "$COPY_TO_CLIPBOARD" = "true" ] && copy_to_clipboard "$content"

# Delete temporary file if exists
[ -f "$tmpfile" ] && rm -f "$tmpfile"
