export POLLYREPO="/home/pedro/Documents/Development/PollyEx/repos/"

function polly_start(){
  get_tmux_session_window $@

  tmux select-window -t $session:$window
  tmux select-pane -t $session:$window.1
  tmux set pane-border-status top
  
  # start docker compose
  tmux send-keys -t $session:$window.$pane 'cd $POLLYREPO; docker compose up -d' C-m

  for counter in {1..2}; do
    tmux split-window -p 90
  done

  tmux select-layout tiled

  # pane commands
  pane=1
  # tmux send-keys -t $session:$window.$pane 'cd $POLLYREPO; docker compose logs -f backend' C-m
  tmux set -p -t $session:$window.$pane pane-border-format " #{pane_index} Backend"

  pane=2
  # tmux send-keys -t $session:$window.$pane 'docker compose logs -f frontend' C-m
  tmux set -p -t $session:$window.$pane pane-border-format " #{pane_index} Frontend"

  pane=3
  tmux send-keys -t $session:$window.$pane 'lazydocker' C-m
  tmux set -p -t $session:$window.$pane pane-border-format " #{pane_index} Lazydocker"

}

function polly_session(){
  # Name of session
  session='Polly'

  # Verify if a session with IBM already exists
  tmux has-session -t $session 2>/dev/null

  # if it exists, join it
  if [ $? -eq 0 ]; then
    tmux attach-session -t $session
    return 0
  fi

  # Create a new window named aot at index 2 and divide it into 6 panes
  tmux new-session -d -s $session

  # Create a new window named aot at index 2 and divide it into 6 panes
  window=1
  tmux rename-window -t $session:$window 'nvim'
  tmux send-keys -t $session:$window 'cd $POLLYREPO; nvim' C-m

  # Create a new window named aot at index 2 and divide it into 6 panes
  window=2
  tmux new-window -t $session:$window -n 'docker'

  tmux select-window -t $session:$window
  polly_start -s $session -w $window

  # Create a monitoring window with btop
  window=3
  tmux new-window -t $session:$window

  tmux select-window -t $session:$window
  tmux send-keys -t $session:$window 'btop' C-m

  # Attach to the new session
  #
  tmux select-window -t $session:2
  tmux attach-session -t $session
}
