#!/bin/sh

STATIC_DIR="$HOME/dotfiles/static"

USE_SUDO=""
OVERWRITE=""

while [ $# -gt 0 ]; do
    case "$1" in
        --sudo)
            USE_SUDO="yes"
            shift
            ;;
        --overwrite)
            OVERWRITE="yes"
            shift
            ;;
        *)
            shift
            ;;
    esac
done

# POSIX-compliant file difference check
is_different()
{
    src="$1"
    dest="$2"

    [ ! -f "$dest" ] && return 0

    src_sum=$(cksum < "$src" | awk '{print $1,$2}')
    dest_sum=$(cksum < "$dest" | awk '{print $1,$2}')

    [ "$src_sum" != "$dest_sum" ]
}

copy_config()
{
    relative_path="$1"
    src="$STATIC_DIR/$relative_path"

    [ ! -f "$src" ] && {
        echo "Source file $src does not exist!"
        return 1
    }

    dest=$(grep '##target ' "$src" | awk '{print $2}')
    [ -z "$dest" ] && {
        echo "No ##target found in $src, skipping."
        return 1
    }

    if ! is_different "$src" "$dest"; then
        echo "$dest is already up-to-date. Skipping copy."
        return 0
    fi

    if [ "$OVERWRITE" = "yes" ] && [ -e "$dest" ]; then
        if [ "$USE_SUDO" = "yes" ]; then
            sudo rm -rf "$dest"
        else
            rm -rf "$dest"
        fi
    fi

    echo "Copying $src to $dest"
    if [ "$USE_SUDO" = "yes" ]; then
        sudo cp "$src" "$dest"
    else
        cp "$src" "$dest"
    fi
}

# --- Samba ---
copy_config "samba/smb.conf"

# --- SDDM ---
copy_config "sddm/sddm.conf"
copy_config "sddm/theme.conf"

# -- doas Alternative to sudo ---
copy_config "doas/doas.conf"


