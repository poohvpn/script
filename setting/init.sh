#!/usr/bin/env bash

if [ "$(id -u)" -eq 0 ];then
echo "don't run with sudo!"
exit
fi

set -x
set -e

scriptDir=$(dirname "$0")
cd $scriptDir

sudo bash ./no-password-everywhere.sh

sudo systemctl enable --now systemd-timesyncd.service

sudo pacman-mirrors --geoip
sudo pacman -Syyu --noconfirm
sudo pacman -R --noconfirm thunderbird mousepad firefox || true
sudo pacman -S --needed --noconfirm yay base-devel
yay -S --needed --noconfirm google-chrome visual-studio-code-bin notion-app rustup bind-tools git \
  syncthing syncthing-gtk-python3

sudo systemctl enable --now syncthing@$USER.service

git config --global init.defaultBranch main
git config --global core.hooksPath "$(realpath ../git-hooks/)"
git config --global url.ssh://git@github.com/.insteadOf https://github.com/

binDir=$(realpath ../bin)
for v in "path+=($binDir)"\
  "export GOPRIVATE=github.com/poohvpn";
do
  if ! grep -q "$v" ~/.zshrc; then
      echo "$v" >> ~/.zshrc
  fi
done