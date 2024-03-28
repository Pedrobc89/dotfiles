# Replace caffeinate on macos to run under a tmux.
# If there is already a cafffeine session running, close it
function caffeinate() {
  # Read flags if any
  while getopts s:w: flag; do
  │ case "${flag}" in
  │ d) decaff=${OPTARG} ;;
    r) refill=${OPTARG} ;;
  │ esac
  done
  
  local session = "caffeine"

  tmux has-session -t $session 2>/dev/null
  local has-session = $?


  if [ decaff ]; then return decaff(has-session, session) fi
  if [ refill ]; then return refill(has-session, session) fi

  # If no flags and no session, start a new session

}

function decaff(has-session, session) {
  if [ has-session -eq 0]; then
    tmux kill-session -t $session
    return 0
  fi

  echo "Caffeinate is not running"

}

function recaff ()
{
  if [ has-session -eq 0]; then
    tmux kill-session -t $session
    return 0
  fi
  
}
