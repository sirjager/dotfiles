#!/bin/sh

export $(grep -v '^#' .env | xargs)

# Check if the file is to be ignored
is_ignored() {
  case "$1" in
  "encrypt.sh" | ".env" | "decrypt.sh") return 0 ;;
  *) return 1 ;;
  esac
}

# Check if the file is already encrypted
is_encrypted() {
  if [ -f "$1.7z" ]; then
    return 0
  fi
  return 1
}

for file in *; do
  if [ -f "$file" ] && ! is_ignored "$file" && ! is_encrypted "$file"; then
    7z a -t7z -mhe=on -p"$ENC_PASS" "$file.7z" "$file"
  fi
done
