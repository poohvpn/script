if [ "$(id -u)" -eq 0 ];then
echo "don't run with sudo!"
exit
fi

set -x
set -e

sudo bash ./nopasswordeverywhere.sh

## oh my zsh
if [ ! -d ~/.oh-my-zsh ]; then
	KEEP_ZSHRC=yes RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

git config --global core.hooksPath `realpath ../git-hooks/`