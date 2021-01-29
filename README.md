# nrobinson2000/dotfiles [WIP]
![](screenshots/1.png)

_Settings and configuration for my Arch Linux distribution._

## Overview

```
DE: Cinnamon 4.8.5 
WM: Mutter (Muffin) 
WM Theme: Adapta-Nokto (Adapta-Nokto-Eta) 
Theme: Adapta-Nokto-Eta [GTK2/3] 
Icons: Papirus-Dark [GTK2/3] 
Terminal: gnome-terminal 
```

## Installation

Install native packages:
```
$ sudo pacman -S - < native-packages
```

Install `yay`:
```
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si
```

Install AUR packages:
```
$ yay -S - < aur-packages
```

Apply customizations:
```
$ sudo cp -ri overlay/* /
$ cp -ri `find skel -maxdepth 1 | tail +2` "$HOME"
```