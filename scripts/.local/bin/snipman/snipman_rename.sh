#!/usr/bin/env bash

# name: snipman_rename.sh
# desc: rename snippet
# usage: snipman_rename.sh <old-name>  <new-name>
# example: snipman_rename.sh myscript.sh  my-new-script.sh

source ~/.local/bin/snipman/snipman_utils.sh

OLD_NAME="$1"
NEW_NAME="$2"

usage() {
  echo "Usage     : $0 <old-name> <new-name>"
  echo "Example 1 : $0 create-react-component.ts rafc.ts"
  echo "Example 2 : $0 bash-template.sh bash-starter.sh"
  exit 1
}

# Ensure both names are provided
if [ -z "$OLD_NAME" ] || [ -z "$NEW_NAME" ]; then
  echo "Both old name and new name must be provided" >&2
  usage
fi

old_filepath=$(get_file_path "$OLD_NAME")

# Check if the original snippet exists
if [ ! -f "$old_filepath" ]; then
  echo "$OLD_NAME does not exists" >&2
  exit 1
fi

new_filepath=$(get_file_path "$NEW_NAME")

# Check if the new file already exists
if [ -f "$new_filepath" ]; then
  echo "$NEW_NAME already exists" >&2
  exit 1
fi

# Rename the file
mv "$old_filepath" "$new_filepath"

echo "snippet \"$OLD_NAME\" renamed to \"$NEW_NAME\""
