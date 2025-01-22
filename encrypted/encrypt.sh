#!/bin/sh

export $(grep -v '^#' .env | xargs)

# Check if the file is to be ignored
is_ignored() {
  case "$1" in
  "encrypt.sh" | ".env" | "decrypt.sh") return 0 ;;
  *) return 1 ;;
  esac
}

# Function to check if a file is already encrypted
is_encrypted() {
  _file="$1.7z"
  # Check if the file exists and is a valid 7z archive
  if [ -f "$_file" ]; then
    # Check if the file is encrypted using 7z (test if the archive requires a password)
    7z t "$_file" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
      # If the test succeeds without asking for a password, it's not encrypted
      return 1
    fi
    return 0 # File is encrypted
  fi
  return 1 # File doesn't exist or isn't encrypted
}

# Function to encrypt a file if it is not already encrypted
encrypt_if_not_encrypted() {
  file="$1"

  if ! is_encrypted "$file"; then
    # If the file is not encrypted, decrypt and re-encrypt it
    echo "Decrypting and re-encrypting $file..."

    # Temporary directory for decryption
    temp_dir=$(mktemp -d)

    # Ensure the file exists and decrypt it into the temp directory
    if 7z x "$file.7z" -o"$temp_dir" -p"$ENC_PASS" >/dev/null 2>&1; then
      # Re-encrypt the decrypted file
      7z a -t7z -mhe=on -p"$ENC_PASS" "$file.7z" "$temp_dir/$file"

      # Clean up the decrypted temporary files
      rm -rf "${temp_dir:?}/$file"
    else
      echo "Error: Decryption failed for $file"
    fi
  else
    # Encrypt the file if not already encrypted
    echo "Encrypting $file..."
    7z a -t7z -mhe=on -p"$ENC_PASS" "$file.7z" "$file"
  fi
}

# Iterate over files and call the encryption function
for file in *; do
  if [ -f "$file" ] && ! is_ignored "$file"; then
    encrypt_if_not_encrypted "$file"
  fi
done
