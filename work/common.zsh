function get_tmux_session_window(){
  # Read flags if any
  while getopts s:w: flag; do
    case "${flag}" in
    s) session=${OPTARG} ;;
    w) window=${OPTARG} ;;
    esac
  done

  # if not provided use current tmux window and session
  #
  [ -z $session ] && session=$(tmux display -p '#{session_name}')
  [ -z $window ] && window=$(tmux display -p '#{window_index}')
}
