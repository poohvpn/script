#!/usr/bin/env bash

scriptDir=$(dirname "$0")
cd $scriptDir

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
chsh -s $(which zsh)

set -e
set -x
binDir=$(realpath ../bin)

cat <<EOF >~/.zshrc
export ZSH="/root/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source \$ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR=nano
path+=($binDir)
export GOPRIVATE=github.com/poohvpn
export DISABLE_AUTO_UPDATE=true
alias yay="sudo -u yay yay"
EOF