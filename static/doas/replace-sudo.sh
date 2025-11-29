#!/usr/bin/env bash
#==============================================================================
# Script: replace-sudo-with-doas.sh
# Description:
#   Safely replaces sudo with a symlink to doas.
#   Checks all dependencies and config before proceeding.
#==============================================================================

set -euo pipefail  # Exit on error, unset vars, or pipe failure
IFS=$'\n\t'        # Safer word splitting

# --- Helper: log message with color ---
log() { echo -e "\033[1;32m[+]\033[0m $*"; }
warn() { echo -e "\033[1;33m[!]\033[0m $*"; }
err() { echo -e "\033[1;31m[✗]\033[0m $*" >&2; }

# --- Step 1: Check if doas is installed ---
if ! command -v doas >/dev/null 2>&1; then
    err "doas not found. Please install it first."
    exit 1
fi
log "doas is installed."

# --- Step 2: Check if doas config exists ---
if [[ ! -f /etc/doas.conf ]]; then
  doas cp -f ~/dotfiles/static/doas/doas.conf /etc/doas.conf
fi

# --- Step 3: Check if sudo is installed via pacman ---
if pacman -Q sudo >/dev/null 2>&1; then
    warn "sudo package is installed. Skipping replacement."
    exit 0
fi

# --- Step 4: Check for existing /usr/bin/sudo link or file ---
if [[ -L /usr/bin/sudo ]]; then
    log "/usr/bin/sudo is already a symlink. Skipping."
elif [[ -e /usr/bin/sudo ]]; then
    err "/usr/bin/sudo exists but is not a symlink. Please remove or rename it manually."
    exit 1
fi

# --- Step 5: Double-check no sudo command in PATH (sanity check) ---
if command -v sudo >/dev/null 2>&1; then
    # Check if it's a symlink or not
    if [[ ! -L "$(command -v sudo)" ]]; then
        err "A sudo binary exists in PATH and is not a symlink. Please remove it before continuing."
        exit 1
    fi
fi

# --- Step 6: Create symlink ---
if [[ -L /usr/bin/sudo ]]; then
    log "/usr/bin/sudo is already a symlink. Skipping."
else
    DOAS_PATH="$(command -v doas)"
    log "Creating symlink: /usr/bin/sudo -> ${DOAS_PATH}"
    doas ln -s "${DOAS_PATH}" /usr/bin/sudo
    log "Successfully linked doas as sudo."
fi


## --- Setup 7: Vidoas ---
doas mkdir -p /root/scripts
[ -f /root/scripts/vidoas ] || doas cp -f ~/dotfiles/static/doas/root-script-vidoas /root/scripts/vidoas
[ -f /usr/local/bin/vidoas ] || doas cp -f ~/dotfiles/static/doas/usr-local-bin-vidoas /usr/local/bin/vidoas
[ -f /root/scripts/vidoas ] && doas chmod 700 /root/scripts/vidoas
[ -f /usr/local/bin/vidoas ] && doas chmod 755 /usr/local/bin/vidoas

log "successfully replaced sudo with doas"

