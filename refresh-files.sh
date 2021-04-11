#!/bin/bash

pushd "$HOME" > /dev/null
SKEL="$OLDPWD/skel"
CONFIG="$SKEL/.config"

# Dotfiles
cp .bash_aliases .bash_profile .bashrc .profile .vimrc "$SKEL"

# cinnamon configs
cp -r .cinnamon/configs "$SKEL/.cinnamon"

# .config files
cp .config/albert/albert.conf "$CONFIG/albert/albert.conf"
cp .config/Code/User/settings.json "$CONFIG/Code/User/settings.json"
cp .config/chromium-flags.conf "$CONFIG/chromium-flags.conf"

# .config directories
cp -r .config/autostart "$CONFIG"
cp -r .config/Kvantum "$CONFIG"
cp -r .config/plank "$CONFIG"
cp -r .config/qt5ct "$CONFIG"

# mimeapps
cp .config/mimeapps.list "$CONFIG"

popd > /dev/null

# packages
pacman -Qenq > packages/native
pacman -Qemq > packages/aur
pacman -Qq > packages/all

# Remove base-devel from native list
BASE="$(pacman -Qqg base-devel)"
for pkg in $BASE; do
TMP="$(mktemp)"
grep -vx "$pkg" packages/native > "$TMP"
mv "$TMP" packages/native
done

# Remove custom packages from aur list
for pkg in custom-packages/*; do
TMP="$(mktemp)"
grep -vx "$(basename $pkg)" packages/aur > "$TMP"
mv "$TMP" packages/aur
done

# dconf
dconf dump / > dconf/temp
# depersonalize
grep -v nrobinson dconf/temp > dconf/all.conf
rm dconf/temp
