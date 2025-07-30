# If eza is installed, use it as the default ls command with icons.
export LS_COLORS="$(vivid generate catppuccin-mocha)"
export CLICOLOR=1          # Enable ANSI colors in coreutils

if type eza &>/dev/null; then
  alias ls='eza --icons'
fi

alias l='ls -la'
alias ll='ls -la'

