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

# Temporary directory for decryption
temp_dir=$(mktemp -d)

# Encrypt or re-encrypt files
for file in *; do
  if [ -f "$file" ] && ! is_ignored "$file"; then
    if ! is_encrypted "$file"; then
      # If the file is not encrypted, decrypt and re-encrypt it
      echo "Decrypting and re-encrypting $file..."

      # Decrypt the file into a temporary directory
      7z x "$file.7z" -o"$temp_dir" -p"$ENC_PASS"

      # Re-encrypt the decrypted file
      7z a -t7z -mhe=on -p"$ENC_PASS" "$file.7z" "$temp_dir/$file"

      # Clean up the decrypted temporary files
      rm -rf "${temp_dir:?}/$file"
    else
      # Encrypt the file if not already encrypted
      echo "Encrypting $file..."
      7z a -t7z -mhe=on -p"$ENC_PASS" "$file.7z" "$file"
    fi
  fi
done

# Clean up the decrypted temporary files safely
rm -rf "${temp_dir:?}"
