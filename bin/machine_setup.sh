#!/usr/bin/env bash

# TODO figure out a way of knowing wich system is running, and call specific files after it
# maybe use uname

## Check shell, if not zsh change it
# if [ "$SHELL" = '/bin/zsh1' ]
# then 
# echo "Zsh is already the shell"
# else
# echo "Changing shell to zsh"
# chsh -s /bin/zsh
# fi
#
## Install latest version of tmux
# brew install tmux
## Install reattach-to-user-namespace, tmux copy/paste integration
# brew install reattach-to-user-namespace,
#
## Install Oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#
## Update vim
# brew remove vim
# brew cleanup
# brew install vim --with-python3

# Install lsusb on mac
# brew tap jlhonora/lsusb && \
# brew install lsusb

# Remove previous dotfiles or symlinks
echo "Removing existing dotfiles"
rm ~/.vimrc
rm ~/.zshrc
rm ~/.tmux.conf
rm -r ~/.config/nvim

# Create symlinks to home folder
echo "Installing dotfiles" 
ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc

ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc

ln -sf ~/.dotfiles/nvim ~/.config/nvim

exit
