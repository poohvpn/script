if [ "$(id -u)" -eq 0 ];then
echo "don't run with sudo!"
exit
fi

set -x

sudo bash ./no-password-everywhere.sh

sudo pacman -R --noconfirm thunderbird mousepad firefox
sudo pacman -Syyu
sudo pacman -S --needed --noconfirm yay
yay -S --needed --noconfirm google-chrome visual-studio-code-bin notion-app rustup bind-tools git

git config --global init.defaultBranch main
git config --global core.hooksPath "$(realpath ../git-hooks/)"
git config --global url.ssh://git@github.com/.insteadOf https://github.com/

binDir=$(realpath ../bin)
if [ -z "$(grep "$binDir" ~/.zshrc )" ]; then
    echo "path+=($binDir)">>~/.zshrc
fi
