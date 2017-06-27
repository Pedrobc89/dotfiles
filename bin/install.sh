#!/usr/bin/env bash

# Create symlinks to home folder
echo "Installing dotfiles" 
ln -sf ../vim/vimrc ~/.vimrc

ln -sf ../tmux/tmux.conf ~/.tmux.conf

ln -sf ../zsh/zshrc ~/.zshrc
