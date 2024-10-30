#!/usr/bin/env bash

SNIPMAN_DIRECTORY="${SNIPMAN_DIRECTORY:-$HOME/.local/share/snipman}"

get_file_path() {
  local name=$(echo "$1" | tr ' ' '-')
  echo "$SNIPMAN_DIRECTORY/$name"
}

preview_file() {
  if command -v bat >/dev/null 2>&1; then
    bat "$@"
  else
    cat "$1"
  fi
}

create_file_if_not_exists() {
  local filepath="$1"
  mkdir -p "$(dirname "$filepath")"
  if [ ! -f "$filepath" ]; then
    touch "$filepath"
  fi
}

copy_to_clipboard() {
  local content="$1"
  if [ "$OSTYPE" == "darwin"* ]; then
    echo "$content" | pbcopy
  elif command -v xclip >/dev/null 2>&1; then
    echo "$content" | xclip -selection clipboard
  else
    echo "Clipboard tool not available. Please install xclip (Linux) or use macOS" >&2
    exit 1
  fi
  echo "copied to clipboard" >&2
}

get_file_creation_date() {
  local filepath="$1"
  local created=""

  # Get file creation date (using stat)
  if [ "$OSTYPE" == "darwin"* ]; then
    created=$(stat -f "%SB" -t "%Y-%m-%d %H:%M:%S" "$filepath") # macOS
  else
    created=$(stat -c "%W" "$filepath") # Linux
    if [ "$created" -eq 0 ]; then
      created=$(stat -c "%Y" "$filepath") # Fallback to last modification time
    fi
    # Convert timestamp to human-readable format
    created=$(date -d @"$created" "+%Y-%m-%d %H:%M:%S")
  fi

  echo "$created"
}
