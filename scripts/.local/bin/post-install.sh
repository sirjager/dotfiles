#!/usr/bin/env bash

update_system() {
	echo
	sudo pacman -Syyu
}

install_yay() {
	echo
	sudo pacman --needed --noconfirm -S yay
}

install_amd_graphic_drivers() {
	echo
	yay --needed --noconfirm -S \
		lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
}

mount_ntfs_storage() {
	TARGET_NTFS_STORAGE_NAME="STORAGE"
	MOUNT_TARGETED_NTFS_AT_THIS_PATH=/mnt/storage
	NTFS_DRIVE_UUID=$(sudo blkid -s UUID -o value -l -c /dev/null -t LABEL="$TARGET_NTFS_STORAGE_NAME")
	if [ -n "$NTFS_DRIVE_UUID" ]; then
		sudo mkdir -p $MOUNT_TARGETED_NTFS_AT_THIS_PATH
		echo "UUID=$NTFS_DRIVE_UUID $MOUNT_TARGETED_NTFS_AT_THIS_PATH ntfs defaults 0 1" | sudo tee -a /etc/fstab
		sudo systemctl daemon-reload
		sudo mount -a
		echo "Successfully mounted $TARGET_NTFS_STORAGE_NAME ($NTFS_DRIVE_UUID) at path $MOUNT_TARGETED_NTFS_AT_THIS_PATH"
	else
		echo "Error: Unable to retrieve the UUID for the '$TARGET_NTFS_STORAGE_NAME' partition"
	fi
}


setup_zsh(){
  yay --needed --noconfirm -S zsh ripgrep fzf
}

install_user_pkgs(){
  yay --needed --noconfirm -S \
    brave-bin neovim tmux alacritty \
    neofetch visual-studio-code-bin \
    ungoogled-chromium-bin firefox
}

setup_docker(){
  yay --needed --noconfirm -S docker docker-compose 
  sudo usermod -aG docker "$(whoami)"
  sudo systemctl enable docker
  sudo systemctl start docker
}

