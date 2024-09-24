#!/usr/bin/env bash

# name: snipman_delete.sh
# desc: deletes snippet
# usage: snipman_delete.sh <name>

source ~/.local/bin/snipman/snipman_utils.sh

SNIP_NAME=""
RESTRICTED_NAMES=("snipman" "--name" "--file" "--title")

usage() {
  echo "Usage     : $0 <name>"
  echo "Example 1 : $0 create-react-component.ts"
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

if [ -f "$filepath" ]; then
  rm -f "$filepath"
  echo "$SNIP_NAME deleted"
else
  echo "$SNIP_NAME does not exist" >&2
fi
