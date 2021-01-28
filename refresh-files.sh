#!/bin/bash

pushd "$HOME"
SKEL="$OLDPWD/skel"

# Dotfiles
cp .bash_aliases .bash_profile .bashrc .profile .vimrc "$SKEL"

# .config files
cp .config/albert/albert.conf "$SKEL/.config/albert/albert.conf"
cp .config/Code/User/settings.json "$SKEL/.config/Code/User/settings.json"

# .config directories
cp -r .config/autostart "$SKEL/.config"
cp -r .config/Kvantum "$SKEL/.config"
cp -r .config/plank "$SKEL/.config"
cp -r .config/qt5ct "$SKEL/.config"