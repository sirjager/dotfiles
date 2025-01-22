#!/bin/sh

export $(grep -v '^#' .env | xargs)

# Check if the file is to be ignored
is_ignored() {
  case "$1" in
  "encrypt.sh" | ".env" | "decrypt.sh") return 0 ;;
  *) return 1 ;;
  esac
}

# Check if the file is a 7z archive
is_7z() {
  case "$1" in
  *.7z) return 0 ;;
  *) return 1 ;;
  esac
}

for file in *; do
  if [ -f "$file" ] && ! is_ignored "$file" && is_7z "$file"; then
    if is_decrypted "$file"; then
      echo "Error: Decrypted file '${file%.7z}' already exists!" >&2
      exit 1
    fi
    7z x -y -p"$ENC_PASS" "$file"
  fi
done
