# nrobinson2000/dotfiles [WIP]

echo "Installing native packages..."
sudo pacman -S - < packages/native

echo "Installing yay..."
git clone https://aur.archlinux.org/yay-bin.git
pushd yay-bin
makepkg -si
popd

echo "Installing AUR packages..."
yay -S - < packages/aur

echo "Applying customizations..."
sudo cp -ri overlay/* /
cp -ri `find skel -maxdepth 1 | tail +2` "$HOME"

echo "Enabling services..."
cat systemd/services | xargs sudo systemctl enable

echo "Loading dconf settings..."
dconf load / < dconf/all.conf
