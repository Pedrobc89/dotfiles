# ALIASES
function _build_tmux_alias {
  setopt localoptions no_rc_expand_param
  eval "function $1 {
    if [[ -z \$1 ]] || [[ \${1:0:1} == '-' ]]; then
      tmux $2 \"\$@\"
    else
      tmux $2 $3 \"\$@\"
    fi
  }"
}

alias tksv='tmux kill-server'
alias tl='tmux list-sessions'
alias tmuxconf='$EDITOR $DOTFILES/tmux/tmux.conf'

_build_tmux_alias "ta" "attach" "-t"
_build_tmux_alias "tad" "attach -d" "-t"
_build_tmux_alias "ts" "new-session" "-s"
_build_tmux_alias "tkss" "kill-session" "-t"

unfunction _build_tmux_alias


