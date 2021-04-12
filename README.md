# arch-base
![](screenshots/debloated.png)

This repository is a post-installation setup script for Arch Linux that installs and configures my preferred packages to create a sleek and approachable desktop experience.

## Prerequisites

- You will need a [fresh installation of Arch Linux.](https://wiki.archlinux.org/index.php/Installation_guide)
- You should be comfortable navigating a terminal and using text editors like [Vim](https://wiki.archlinux.org/index.php/Vim) or [nano.](https://wiki.archlinux.org/index.php/Nano)

## Installation

On a newly installed Arch Linux environment clone this repository:

```bash
$ sudo pacman -S git
$ git clone https://github.com/nrobinson2000/arch-base
$ cd arch-base
```

Before running `install.sh`, read through the script with your text editor and verify that you are content with the changes that it will make. To accept the script, uncomment the `DOTFILES_AGREE="true"` line in `install.sh`.

After accepting, run the script with the following:

```bash
$ ./install.sh
```

The script can take around 15-20 minutes to complete. After the script finishes, reboot your system and you should be presented with a graphical login window.

## Useful shortcuts

Here are some of the keyboard shortcuts I use most often:

### Launchers
- `SUPER` - Open the Cinnamon menu
- `SUPER + ENTER` - Open a new terminal
- `ALT + SPACE` - Open the [Albert launcher](https://github.com/albertlauncher/albert)

### System
- `CTRL + ALT + L` - Lock the screen
- `CTRL + ALT + END` - Suspend

### Workspaces/Multi-Monitor
- `SUPER + ARROW` - Snap/tile a window
- `CTRL + ALT + ARROW` - Move between workspaces
- `SHIFT + CTRL + ALT + ARROW` - Move a window to a different workspace
- `SHIFT + SUPER + ARROW` - Move a window to a different monitor

## Usage tips (WIP)

Here is some advice for maintaining and using the system:

### Package management
- Check for package updates regularly with the `yay` command.
- When installing unofficial packages, use the [Arch User Repository](https://aur.archlinux.org/) with `yay` rather than snaps or flatpaks.

### Chromium
- To improve the appearance of Chromium, right-click on the top of the window and click `Use system title bar and borders`.
- Install an adblocker like [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) to greatly improve your browsing experience.

### Listening to Youtube
- The script will install [ytfzf](https://github.com/pystardust/ytfzf), a tool to search for and watch Youtube videos from the terminal. To listen to only the audio, the alias `ytm` is provided. This is incredibly useful for listening to music videos on Youtube while working because you won't be distracted by the Youtube website. For example, to find cyberpunk music:

```bash
$ ytm cyberpunk mix
```

## Overview

```
DE: Cinnamon 4.8.6
WM: Mutter (Muffin)
WM Theme: Adapta-Nokto (Adapta-Nokto-Eta)
Theme: Adapta-Nokto-Eta [GTK2/3]
Icons: Papirus-Dark [GTK2/3]
Terminal: gnome-terminal
```

## TODO
- Make README more eyecatching
- Document more shortcuts and tips
