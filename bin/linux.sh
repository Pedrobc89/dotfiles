#!/bin/bash
#
# update/upgrade apt
sudo apt update
sudo apt upgrade

# install Homebrew for linux as a package manager
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install nvim, vim, tmux, zsh, oh-my-zsh, python@3.11
brew install nvim, vim, tmux, python@3.11, zsh,

# make zsh as default shell
chsh -s $(which zsh)

# if $SHELL is not equal to $(which zsh) log an error
if [ "$SHELL" != "$(which zsh)" ]; then
	echo "Error: zsh is not the default shell"
else
	echo "zsh is the default shell"
fi

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# download and install personal dotfiles
git clone https://github.com/PedroBC89/dotfiles.git ~/.dotfiles/

# create symlinks to home folder
~/.dotfiles/bin/symlink.sh

# download dotfiles repo
