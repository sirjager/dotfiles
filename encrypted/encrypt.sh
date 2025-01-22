#!/bin/sh

export $(grep -v '^#' .env | xargs)

# Check if the file is to be ignored
is_ignored() {
  case "$1" in
  "encrypt.sh" | ".env" | "decrypt.sh") return 0 ;;
  *) return 1 ;;
  esac
}

# Function to check if the file is a 7z archive
is7z() {
  case "$1" in
  *.7z) return 0 ;; # It's a 7z file
  *) return 1 ;;    # Not a 7z file
  esac
}

# Function to check if a file is already encrypted
is_encrypted() {
  ! is7z "$1" && return 1   # return 1 if not a 7z
  [ ! -f "$1" ] && return 1 # return 1 if not a file
  # Check if the file is encrypted using 7z (test if the archive requires a password)
  7z t "$1" >/dev/null 2>&1
  if [ $? -ne 0 ]; then
    # File is encrypted
    return 0
  fi
  # If the test succeeds without asking for a password, it's not encrypted
  return 1
}

encrypt_file() {
  7z a -t7z -mhe=on -p"$ENC_PASS" "$1.7z" "$1"
}

# Function to encrypt a file if it is not already encrypted
encrypt_if_not_encrypted() {
  # Skip non-7z files
  if ! is7z "$file"; then
    return
  fi

  if ! is_encrypted "$file"; then
    echo "Decrypting and re-encrypting $file..."

    # Temporary directory for decryption
    temp_dir=$(mktemp -d)

    # Ensure the file exists and decrypt it into the temp directory
    if 7z x "$file" -o"$temp_dir" -p"$ENC_PASS" >/dev/null 2>&1; then
      # Re-encrypt the decrypted file
      7z a -t7z -mhe=on -p"$ENC_PASS" "$file" "$temp_dir/$file"

      # Clean up the decrypted temporary files
      rm -rf "${temp_dir:?}/$file"
    else
      echo "Error: Decryption failed for $file"
    fi
  else
    echo "$file is already encrypted."
  fi
}

# Iterate over files and call the encryption function
for file in *; do
  if [ -f "$file" ] && ! is_ignored "$file"; then

    # Encrypt non .7z
    if ! is7z "$file"; then
      encrypt_file "$file"
    else
      encrypt_if_not_encrypted "$file"
    fi

  fi
done
