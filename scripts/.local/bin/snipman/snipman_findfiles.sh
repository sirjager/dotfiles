#!/usr/bin/env bash

FIND_FILES_RECURSIVELY="false" # Search snippet files recursively
FIND_FILES_IN_DIR="."          # Default to current directory

BASENAME_ONLY="false"

IGNORE_DIRS=".git,node_modules,dist,build,tmp"

usage() {
  local script="$(basename $0)"
  echo "Usage: $script [OPTIONS]"
  echo
  echo "Options:"
  echo "  --dir <directory>           Specify the directory to search in (default: current directory)"
  echo "  --sub-dir, --recursive      Search snippet files recursively"
  echo "  --ignore <dirs>             Comma-separated list of directories to ignore (default: $IGNORE_DIRS)"
  echo "  -u, -h, --help, --usage     Show this help message"
  echo
  echo "Examples:"
  echo "  $script                              # Search in the current directory, ignoring default directories"
  echo "  $script --dir /path/to/dir           # Search in /path/to/dir, ignoring default directories"
  echo "  $script --sub-dir                    # Recursively search in the current directory, ignoring default directories"
  echo "  $script --ignore 'tmp,build'         # Search in the current directory, ignoring 'tmp' and 'build' directories"
  echo "  $script --no-ignore                  # Search in the current directory, not ignoring any files"
  exit 0
}

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
  --dir)
    shift
    FIND_FILES_IN_DIR="$1"
    shift
    ;;
  --basename)
    BASENAME_ONLY="true"
    shift
    ;;
  --sub-dir | --recursively | --recursive)
    FIND_FILES_RECURSIVELY="true"
    shift
    ;;
  --ignore | --ignore-dirs)
    shift
    IGNORE_DIRS="$1"
    shift
    ;;
  --no-ignore)
    IGNORE_DIRS=""
    shift
    ;;
  -u | -h | --help | --usage)
    usage
    ;;
  *)
    shift
    ;;
  esac
done

# Convert the comma-separated string into an array
IFS=',' read -r -a ignore_dirs_array <<<"$IGNORE_DIRS"

# Create the find command to ignore specified directories
ignore_conditions=()
for dir in "${ignore_dirs_array[@]}"; do
  ignore_conditions+=(-name "$dir" -o)
done

# Remove the last -o from the conditions
unset 'ignore_conditions[${#ignore_conditions[@]}-1]'

files_found=()

# Use find command to gather files
if [ "$FIND_FILES_RECURSIVELY" == "true" ]; then
  while IFS= read -r -d '' file; do
    files_found+=("$file")
  done < <(find "$FIND_FILES_IN_DIR" -type d \( "${ignore_conditions[@]}" \) -prune -o -type f -print0)
else
  while IFS= read -r -d '' file; do
    files_found+=("$file")
  done < <(find "$FIND_FILES_IN_DIR" -maxdepth 1 -type d \( "${ignore_conditions[@]}" \) -prune -o -type f -print0)
fi

# If basename-only is set, print only the base filenames
if [ "$BASENAME_ONLY" == "true" ]; then
  for file in "${files_found[@]}"; do
    basename "$file"
  done
else
  # Print found files
  printf "%s\n" "${files_found[@]}"
fi
