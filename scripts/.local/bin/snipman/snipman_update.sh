#!/usr/bin/env bash

# name: snipman_update.sh
# desc: update a snippet
# usage: snipman_update.sh <name> [--editor <editor>]

source ~/.local/bin/snipman/snipman_utils.sh

SNIP_NAME=""
EDITOR="${EDITOR:-nano}"
RESTRICTED_NAMES=("snipman" "--name" "--file" "--title")

usage() {
  echo "Usage     : $0 <name> [--editor <editor>]"
  echo "Example 1 : $0 create-react-component.ts --editor nvim"
  exit 1
}

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
  --name | --title | --file)
    shift
    if [[ -n "$1" ]]; then
      SNIP_NAME="$1"
    else
      echo "Error: Missing argument for '$1'." >&2
      usage
    fi
    shift
    ;;
  --editor)
    shift
    EDITOR="$1"
    shift
    ;;
  *)
    if [[ -z "$SNIP_NAME" ]]; then
      SNIP_NAME="$1"
    fi
    shift
    ;;
  esac
done

if [ -z "$SNIP_NAME" ]; then
  usage
fi

# Check if SNIP_NAME is a restricted name
for restricted in "${RESTRICTED_NAMES[@]}"; do
  if [[ "$SNIP_NAME" == "$restricted" ]]; then
    echo "Error: '$SNIP_NAME' is a reserved name and cannot be used." >&2
    exit 1
  fi
done

filepath=$(get_file_path "$SNIP_NAME")

if [ ! -f "$filepath" ]; then
  echo "$SNIP_NAME does not exist" >&2
  exit 1
fi

"${EDITOR}" "$filepath"
