#!/usr/bin/env bash

if [ "$(id -u)" -eq 0 ];then
echo "don't run with sudo!"
exit
fi

sudo pacman -S --noconfirm wireshark-qt
sudo usermod -aG wireshark $USER