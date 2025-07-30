# If eza is installed, use it as the default ls command with icons.
if type eza &>/dev/null; then
  alias ls='eza --icons'
else
  # Otherwise, use the default ls command with color support.
  export LS_COLORS="di=34:ln=36:so=32:pi=33:ex=35:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43"
  export CLICOLOR=1          # Enable ANSI colors in coreutils
  export LSCOLORS="ExFxBxDxCxegedabagacad"  # macOS BSD-style
fi

alias l='ls -la'
alias ll='ls -la'

