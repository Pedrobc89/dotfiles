#!/bin/bash
# TODO: fix install fuction
# TODO: find a better way to define brew items to install based on personal/work and OS
#
#
# apt install git curl

set -eou pipefail

function install_brew() {
  # Check if Homebrew is installed
  if command -v brew &>/dev/null; then
    echo "✅ Homebrew is already installed"
    return 0
  fi

  echo "🍺 Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH if needed (Apple Silicon & Intel support)
  if [[ -d "/opt/homebrew/bin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -d "/home/linuxbrew/.linuxbrew/bin" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
}

function brew_install_items() {
  local type="$1"
  shift
  local to_install=("$@")

  if [[ "$type" != "formula" && "$type" != "cask" && "$type" != "font" ]]; then
    echo "❌ First argument must be 'formula' or 'cask'"
    return 1
  fi

  echo "================================================================================"
  echo "🔍 Checking installed $type(s)..."

  if [[ "$type" == "font" ]]; then
    type="cask"
  fi

  local installed_list
  installed_list=$(brew list --"$type" 2>/dev/null)

  local missing=()
  for item in "${to_install[@]}"; do
    local app_path="/Applications/$(tr '-' ' ' <<<"$item" | sed -E 's/\b(.)/\u\1/g').app"

    if echo "$installed_list" | grep -Fxq "$item"; then
      echo "✅ $item already installed via 🍺"
    elif [[ "$type" == "cask" && -d "$app_path" ]]; then
      echo "✅ $item appears manually installed at $app_path ✋"
    else
      missing+=("$item")
    fi
  done

  if [[ ${#missing[@]} -gt 0 ]]; then
    echo "⬇️  Installing missing $type(s): ${missing[*]}"
    brew install --"$type" "${missing[@]}"
  else
    echo "✅ No missing $type(s) to install."
  fi
  echo "================================================================================"
}

function brew_install_formulae() {

  echo "🔍 Checking installed formulae..."
  local items=(
    bat btop curl dust eza fzf gcc gh go ipython k9s kubernetes-cli lazydocker
    lazygit lua luajit mosh neovim node nvm python@3.13 ripgrep rust starship
    tealdeer telnet tmux tree-sitter vim wget zoxide zsh zsh-completions
    zsh-syntax-highlighting
  )

  brew_install_items formula ${items[*]}
}

function brew_install_casks() {

  echo "🔍 Checking installed casks..."
  local items=(
    betterdisplay choosy discord docker google-chrome karabiner-elements kitty
    mqtt-explorer openemu postman raycast
  )

  brew_install_items cask ${items[*]}
}

function brew_install_fonts() {

  local items=(
    font-meslo-lg-nerd-font
    font-jetbrains-mono-nerd-font
  )

  brew_install_items cask ${items[*]}
}


# function install() {
#   # Add this to install syntax highliting
#   # git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#
#   echo "Installing dotfiles"
#   # check wich operating system we are running
#   if [ "$(uname)" == "Darwin" ]; then
#     # Do something under Mac OS X platform
#     local macos=true
#     echo "Running on MacOS"
#   elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
#     # Do something under GNU/Linux platform
#     local linux=true
#     echo "Running on Linux"
#   fi
#
#   # update/upgrade apt if linux
#   if [ "$linux" == true ]; then
#     echo "Updating apt"
#     sudo apt update
#     sudo apt upgrade
#     sudo apt install build-essential
#   fi
#
#   # TODO: make it non interactive
#   # install Homebrew for linux as a package manager (non interactive)
#   # explore NONINTERACTIVE=1 option
#
#   # Installing Brew as a package manager
#   # check if brew is installed (macos) or linuxbrew (linux)
#   if ! command -v brew &>/dev/null; then
#     brew_install
#   fi
#
#   # install nvim, vim, tmux, zsh, python@3.11, gcc
#   brew install nvim vim tmux zsh gcc python3 wget btop bat fzf fd ripgrep
#   brew install k9s gh dust tealdeer ruby rust lazydocker lazygit tree-sitter lua
#   brew install npm yarn nodejs go nvm kubectl helm
#   brew install starship
#
#   # install apps and casks for macos
#   if [ "$macos" == true ]; then
#     brew install iterm2
#     brew install --cask docker
#     brew install --cask google-chrome
#     brew install --cask 1password
#     brew install karabiner-elements
#   elif [[ "$linux" == true ]]; then
#     brew install xsel docker docker-compose
#   fi
#
#   # install hackfont on macos we can use brew
#   if [ "$macos" == true ]; then
#     brew tap homebrew/cask-fonts
#     brew install --cask font-hack-nerd-font
#   elif [ "$linux" == true ]; then
#     # Download the zip file from
#     curl --location https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip --output ~/font-hack-nerd-font.zip
#     unzip ~/font-hack-nerd-font.zip -d ~/font-hack-nerd-font
#     if [ ! -d ~/.fonts ]; then
#       mkdir ~/.fonts
#     fi
#     cp ~/font-hack-nerd-font/*.ttf ~/.fonts/
#     rm -r ~/font-hack-nerd-font ~/font-hack-nerd-font.zip
#   fi
#
#   if [ "$linux" == true ]; then
#     # Cattpuccin as terminal colorscheme
#     curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.2.0/install.py | python3 -
#   elif [ "$macos" == true ]; then
#
#   fi
#
#   # make zsh as default shell
#   chsh -s $(which zsh)
#
#   # if $SHELL is not equal to $(which zsh) log an error
#   if [ "$SHELL" != "$(which zsh)" ]; then
#     echo "Error: zsh is not the default shell"
#   else
#     echo "zsh is the default shell"
#   fi
#
#   # TODO: need to spinup neovim to download plugins or ditch LazyVim and use my own
#   # Download and install LazyVim
#   [ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak
#   git clone https://github.com/LazyVim/starter ~/.config/nvim
#   rm -rf ~/.config/nvim/.git
#
#   # Clone TPM (Tmux Plugin Manager)
#   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#
#   # Download and install personal dotfiles
#   git clone https://github.com/PedroBC89/dotfiles.git ~/.dotfiles/
#
#
#   # create development folder
#   mkdir -p ~/Documents/Development/
#
#   # configure git
#   git config --global user.name "PedroBC89"
#   git config --global user.email "pedrobc89@gmail.com"
#
#   # add configuration to ssh config file
#   [ ! -d ~/.ssh ] && mkdir ~/.ssh
#   [ ! -f ~/.ssh/config ] && touch ~/.ssh/config
#   echo "Host github.com" >>~/.ssh/config
#   echo "  HostName github.com" >>~/.ssh/config
#   echo "  User git" >>~/.ssh/config
#   echo "  IdentityFile ~/.ssh/github-Pedrobc89" >>~/.ssh/config
#
#   # install oh-my-zsh
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
#   # Create symlinks to home folder
#   echo "Installing dotfiles"
#   ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
#   ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
#   ln -sf ~/.dotfiles/nvim ~/.config/nvim
#   if [ "$macos" == true ]; then
#     ln -sf ~/.dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
#   fi
# }

function install_omz() {
  # install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

function link_dotfiles() {

  # Remove previous dotfiles or symlinks
  echo "Removing existing dotfiles"
  # test if file exists before removing
  [ -f ~/.vimrc ] && rm ~/.vimrc
  [ -f ~/.zshrc ] && rm ~/.zshrc
  [ -f ~/.tmux.conf ] && rm ~/.tmux.conf
  [ -d ~/.config/nvim ] && rm -r ~/.config/nvim

  echo "Linking new dotfiles"
   ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
   ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
   mkdir -p ~/.config/nvim && ln -sf ~/.dotfiles/nvim ~/.config/nvim
}

function macos_install() {

  brew_install_formulae
  brew_install_casks
  brew_install_fonts
}

function linux_install() {
  brew_install_formulae
}



function install() {
  install_brew

  if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
    macos_install
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    linux_install
  fi

  link_dotfiles
}

install
