#!/bin/bash
# nrobinson2000/arch-base [WIP]

# To install as a non-root user:
# git clone https://github.com/nrobinson2000/arch-base
# cd arch-base
# ./install.sh

# The multilib repo must be enabled in /etc/pacman.conf
# After enabling run: sudo pacman -Sy

# DOTFILES_AGREE="true"

if [[ "$DOTFILES_AGREE" != "true" ]]; then
    echo "To confirm that you understand the risks of this script you must uncomment"
    echo 'the DOTFILES_AGREE="true" line in install.sh'
    exit
fi

echo "Configuring mirrorlist with reflector..."
sudo pacman -S reflector rsync || exit
sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --latest 20 --sort rate --country 'United States' --protocol https --save /etc/pacman.d/mirrorlist

echo "Updating system..."
sudo pacman -Syyu || exit

echo "Installing base-devel..."
sudo pacman -S base-devel || exit

echo "Installing native packages..."
sudo pacman -S - < packages/native || exit

echo "Installing custom packages..."
for pkg in custom-packages/*; do pushd $pkg; makepkg -sifc; popd; done

echo "Installing yay..."
git clone https://aur.archlinux.org/yay-bin.git
pushd yay-bin
makepkg -si
popd

echo "Installing AUR packages..."
yay -S - < packages/aur || exit

# Don't apply any customizations unless all packages were installed sucessfully 

echo "Applying customizations..."
sudo cp -ri overlay/* /
cp -ri `find skel -maxdepth 1 | tail +2` "$HOME"

echo "Enabling services..."
cat systemd/services | xargs sudo systemctl enable

echo "Loading dconf settings..."
dconf load / < dconf/all.conf

echo "Finished installation."
echo "Please reboot for all changes to take effect."
