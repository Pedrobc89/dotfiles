#!/bin/bash
# TODO: find a better way to define brew items to install based on personal/work and OS

set -eou pipefail

DOTFILES="${HOME}/.dotfiles"
XDG_CONFIG_HOME="${HOME}/.config"

function install_brew() {
  # Check if Homebrew is installed
  if command -v brew &>/dev/null; then echo "✅ Homebrew is already installed"
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
    tealdeer tmux tree-sitter vim wget zoxide zsh vivid zinit stow
  )

  brew_install_items formula ${items[*]}
}

function brew_install_casks() {

  echo "🔍 Checking installed casks..."
  local items=(
    betterdisplay choosy discord docker google-chrome karabiner-elements kitty
    mqtt-explorer openemu postman raycast ghostty
  )

  brew_install_items cask ${items[*]}
}

function brew_install_fonts() {

  local items=(
    font-meslo-lg-nerd-font
    font-jetbrains-mono-nerd-font
    font-meslo-lg-nerd-font
    font-caskaydia-cove-nerd-font
    font-comic-shanns-mono-nerd-font
    font-fira-code-nerd-font
    font-iosevka-term-nerd-font
    font-jetbrains-mono-nerd-font
  )

  brew_install_items cask ${items[*]}
}

function install_omz() {
  # install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

function macos_install() {

  brew_install_formulae
  brew_install_casks
  brew_install_fonts
}

function linux_install() {
  brew_install_formulae
}



function main() {
  install_brew

  if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
    macos_install
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    linux_install
  fi

  cd $DOTFILES
  stow .
}

main
