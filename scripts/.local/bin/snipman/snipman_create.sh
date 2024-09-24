#!/usr/bin/env bash

# name: snipman_create.sh
# desc: create a new snippet
# usage: snipman_create.sh <name> <editor>

source ~/.local/bin/snipman/snipman_utils.sh

SNIPMAN_EDITOR="${SNIPMAN_EDITOR:-nvim}"
RESTRICTED_NAMES=("snipman" "--name" "--file" "--title")

usage() {
  echo "Usage     : $0 <name> [--editor <editor>]"
  echo "Example 1 : $0 create-react-component.ts --editor nvim"
  echo "Example 2 : $0 bash-template.sh --editor vim"
  echo "Example 3 : $0 --name bash-template.sh --editor vim"
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
    SNIPMAN_EDITOR="$1"
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

if ! command -v "$SNIPMAN_EDITOR" >/dev/null 2>&1; then
  echo "$SNIPMAN_EDITOR not installed" >&2
  exit 1
fi

filepath=$(get_file_path "$SNIP_NAME")

if [ -f "$filepath" ]; then
  echo "Already exists: $filepath" >&2
  exit 1
fi

create_file_if_not_exists "$filepath"

DEFAULT_SNIPPET_TEMPLATE=$(
  cat <<EOF

# Title: $SNIP_NAME
# Description: $SNIP_NAME
# Author: $(whoami)

EOF
)

echo "$DEFAULT_SNIPPET_TEMPLATE" >"$filepath"

"${SNIPMAN_EDITOR}" "$filepath"
