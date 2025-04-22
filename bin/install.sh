#!/bin/bash

function brew_install(){
  echo "Installing brew package manager"
  /bin/bash NONINTERACTIVE=1 -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add brew path
  if [ "$linux" = true ] then
    local brew_path = "$HOME/.linuxbrew/bin"
  else
    local brew_path = "/opt/homebrew/bin"
  fi
  echo "brew_path=$brew_path" >> $HOME/.profile

  echo 'eval "$($brew_path/brew shellenv)"' >>$HOME/.profile
  eval "$($brew_path/brew shellenv)"

  # run brew update, upgrade and doctor non interactive
  brew update && brew upgrade && brew doctor
}

function install() {
  echo "Installing dotfiles"
  # check wich operating system we are running
  if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
    local macos=true
    echo "Running on MacOS"
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    local linux=true
    echo "Running on Linux"
  fi

  # update/upgrade apt if linux
  if [ "$linux" = true ]; then
    echo "Updating apt"
    sudo apt update
    sudo apt upgrade
    sudo apt install build-essential
  fi

  # TODO: make it non interactive
  # install Homebrew for linux as a package manager (non interactive)
  # explore NONINTERACTIVE=1 option

  # Installing Brew as a package manager
  # check if brew is installed (macos) or linuxbrew (linux)
  if ! command -v brew &>/dev/null; then
    brew_install
  fi

  # install nvim, vim, tmux, zsh, python@3.11, gcc
  brew install nvim vim tmux zsh gcc python3 wget btop bat fzf fd ripgrep
  brew install k9s gh dust tealdeer ruby rust lazydocker lazygit tree-sitter lua
  brew install npm yarn nodejs go nvm kubectl helm
  brew install starship

  # install apps and casks for macos
  if [ "$macos" = true ]; then
    brew install iterm2
    brew install --cask docker
    brew install --cask google-chrome
    brew install --cask 1password
    brew install karabiner-elements
  elif [[ "$linux" = true ]]; then
    brew install xsel docker docker-compose 
  fi

  # install hackfont on macos we can use brew
  if [ "$macos" = true ]; then
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
  elif [ "$linux" = true ]; then
    # Download the zip file from
    curl --location https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip --output ~/font-hack-nerd-font.zip
    unzip ~/font-hack-nerd-font.zip -d ~/font-hack-nerd-font
    if [ ! -d ~/.fonts ]; then
      mkdir ~/.fonts
    fi
    cp ~/font-hack-nerd-font/*.ttf ~/.fonts/
    rm -r ~/font-hack-nerd-font ~/font-hack-nerd-font.zip
  fi

  if [ "$linux" = true ]; then
    # Cattpuccin as terminal colorscheme
    curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.2.0/install.py | python3 -
  elif [ "$macos" = true ]; then
    
  fi

  # make zsh as default shell
  chsh -s $(which zsh)

  # if $SHELL is not equal to $(which zsh) log an error
  if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Error: zsh is not the default shell"
  else
    echo "zsh is the default shell"
  fi

  # TODO: need to spinup neovim to download plugins or ditch LazyVim and use my own
  # Download and install LazyVim
  [ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git

  # Clone TPM (Tmux Plugin Manager)
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  # Download and install personal dotfiles
  git clone https://github.com/PedroBC89/dotfiles.git ~/.dotfiles/

  # Remove previous dotfiles or symlinks
  echo "Removing existing dotfiles"
  # test if file exists before removing
  [ -f ~/.vimrc ] && rm ~/.vimrc
  [ -f ~/.zshrc ] && rm ~/.zshrc
  [ -f ~/.tmux.conf ] && rm ~/.tmux.conf
  [ -d ~/.config/nvim ] && rm -r ~/.config/nvim


  # install tmux plugins
  tmux run-shell ~/.tmux/plugins/tpm/bindings/install_plugins

  # create development folder
  mkdir -p ~/Documents/Development/

  # configure git
  git config --global user.name "PedroBC89"
  git config --global user.email "pedrobc89@gmail.com"

  # configure ssh for git
  ssh-keygen -t ed25519 -C "pedrobc89@gmail.com" -f github-Pedrobc89

  # add configuration to ssh config file
  [ ! -d ~/.ssh ] && mkdir ~/.ssh
  [ ! -f ~/.ssh/config ] && touch ~/.ssh/config
  echo "Host github.com" >>~/.ssh/config
  echo "  HostName github.com" >>~/.ssh/config
  echo "  User git" >>~/.ssh/config
  echo "  IdentityFile ~/.ssh/github-Pedrobc89" >>~/.ssh/config

  # install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

  # Create symlinks to home folder
  echo "Installing dotfiles"
  ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
  ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
  ln -sf ~/.dotfiles/nvim ~/.config/nvim
  if [ "$macos" = true ]; then
    ln -sf ~/.dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
  fi

install()
