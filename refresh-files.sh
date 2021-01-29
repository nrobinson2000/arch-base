#!/bin/bash

pushd "$HOME" > /dev/null
SKEL="$OLDPWD/skel"
CONFIG="$SKEL/.config"

# Dotfiles
cp .bash_aliases .bash_profile .bashrc .profile .vimrc "$SKEL"

# .config files
cp .config/albert/albert.conf "$CONFIG/albert/albert.conf"
cp .config/Code/User/settings.json "$CONFIG/Code/User/settings.json"

# .config directories
cp -r .config/autostart "$CONFIG"
cp -r .config/Kvantum "$CONFIG"
cp -r .config/plank "$CONFIG"
cp -r .config/qt5ct "$CONFIG"

# mimeapps
cp .config/mimeapps.list "$CONFIG"

popd > /dev/null

# packages
pacman -Qenq > native-packages
pacman -Qemq > aur-packages
pacman -Qq > all-packages

# dconf
dconf dump / > dconf/all.conf