# Defines root folder for techlabs repo
export REPO="$HOME/Documents/Development/IBM/repos/techlabs"

OUTPUT_AUDIO_DEV='HDA Intel PCH'
INPUT_AUDIO_DEV='HDA Intel PCH'
function playbackdevice() { 
  aplay -l | grep ${OUTPUT_AUDIO_DEV} | awk '{print $2}' | tr -d ': ' | head -n 1 | xargs echo; 
}
function capturedevice() {
  arecord -l | grep ${INPUT_AUDIO_DEV} | awk '{print $2}' | tr -d ': ' | head -n 1 | xargs echo; 
}


# Hate doing ./
alias shake="./shake"
# alias pants="./pants"

# Mosquitto helpers
alias mqttprint="mosquitto_sub -v -t 'mcd_dev/+/+/AsrService/AsrSpeechDecoded' -t 'mcd_dev/+/+/TtsService/#' -t 'mcd_dev/+/+/ChatService/#' -t 'mcd_dev/+/+/LogCollector/#' -t 'mcd_dev/+/Bre/Evd/#' -t 'hme/#' -t 'mcd_dev/+/+/DialogState/#' -t 'evd/#'"

# Techlabs VPN
alias vpn="cd /home/pedro//office_vpn && sudo openvpn TechLabsVPN.ovpn"

# POS helpers
alias posstart="vboxmanage startvm POS"
alias posstop="vboxmanage controlvm POS poweroff"

function posaidt() {
  curl -d '{"enabled":"true"}' \
    -H 'Content-Type: application/json' \
    -X POST 'http://pos:8123/npsharp/services/RealTimeOrdering/SetOrderingEnabled'
}


# Pants helpers
alias lint="pants --changed-since=master --changed-dependees=transitive lint '$@'"
alias check="pants --changed-since=master --changed-dependees=transitive check '$@'"
alias sa="lint && check"
alias format="pants --changed-since=master fix '$@'"

# Onbserver Injector/Terminal helpers
function observerterminal() {
  cd $REPO 
  ./shake va observer terminal $@
}
function observerinjector() {
  cd $REPO 
  ./shake va observer injector $@
}

# Start services helpers
function as_start() {
  cd $REPO  
  ./shake audio service \
    --edge_host=10.0.1.27 \
    --edge_device=hme_nexeo \
    $@
}

function asr_start() {
  cd $REPO 
  ./shake va services asr \
    --record_session_logs \
    --echo_canceller='webrtc' \
    --verbosity=1 \
    $@

}

function tts_start() {
  cd $REPO 
  ./shake va services tts -v=1 $@
}

function cms_start() {
  export LOG
  cd $REPO 
  ./shake va services cms \
    --mcd_rto_host=pos \
    --noall_day_breakfast \
    --mcd_nexeo_controller \
    --nomcd_rto_host_disable \
    --norun_memory_profiler \
    --norun_menu_service \
    --nosilent_mode \
    --nouse_evd_signals \
    --nouse_promotions_api \
    --verbosity=1 \
    $@
}

# Audio
function jackstart() {
  cd $REPO 
  ./shake audio jack start \
    --capture_device=hw:$(capturedevice) \
    --playback_device=hw:$(playbackdevice) \
    --verbosity=1 \
    $@
}

function jackstop() {
  cd $REPO 
  ./shake audio jack stop
  sleep 1
  pkill -f jackd
}

function abmock() {
  jackstop
  sleep 1
  jackstart
  sleep 1
  cd $REPO 
  ./shake audio ab mock --jack --mqtt=true $@
}

# NEXEO
function nexeo_start() {
  /hme/nexeo/nexeo -rtsp_port 10001 -rx default -tx default
}

# AOT start/stop/session
function aot_stop() {
  get_tmux_session_window $@

  pane=1
  tmux send-keys -t $session:$window.$pane 'C-d C-m'
  for pane in {2..7}; do
    tmux send-keys -t $session:$window.$pane 'C-c'
  done

  # kill all panes in the window
  
  panes=$(tmux list-panes -t $session:$window | wc -l)
  for pane in {1..$panes}; do
    tmux kill-pane -t $session:$window.1
  done
}

function aot_start(){
  get_tmux_session_window $@

  # GO to techlabs repo
  tmux select-window -t $session:$window
  tmux select-pane -t $session:$window.1
  tmux set pane-border-status top

  for counter in {1..8}; do
    tmux split-window -p 90
  done

  tmux select-layout tiled

  # pane commands
  pane=1
  tmux send-keys -t $session:$window.$pane 'observerinjector' C-m
  tmux set -p -t $session:$window.$pane pane-border-format " #{pane_index} Observer Injector"

  pane=2
  tmux send-keys -t $session:$window.$pane 'tts_start' C-m
  tmux set -p -t $session:$window.$pane pane-border-format " #{pane_index} TTS"

  pane=3
  tmux send-keys -t $session:$window.$pane 'asr_start' C-m
  tmux set -p -t $session:$window.$pane pane-border-format " #{pane_index} ASR"

  pane=4
  tmux send-keys -t $session:$window.$pane 'as_start' C-m
  tmux set -p -t $session:$window.$pane pane-border-format " #{pane_index} Audio Service"

  pane=5
  tmux send-keys -t $session:$window.$pane 'nexeo_start' C-m
  tmux set -p -t $session:$window.$pane pane-border-format " #{pane_index} NEXEO"

  pane=6
  tmux send-keys -t $session:$window.$pane 'cms_start' C-m
  tmux set -p -t $session:$window.$pane pane-border-format " #{pane_index} CMS"

  pane=7
  tmux send-keys -t $session:$window.$pane 'observerterminal' C-m
  tmux set -p -t $session:$window.$pane pane-border-format "#{pane_index} Observer Terminal"

  pane=8
  tmux set -p -t $session:$window.$pane pane-border-format "#{pane_index} #{pane_current_command} "

  pane=8
  tmux send-keys -t $session:$window.$pane 'otel_docker' C-m
  tmux set -p -t $session:$window.$pane pane-border-format "#{pane_index} Otel Docker "

}

function aot_session(){
  # Name of session
  session='IBM'

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
  tmux send-keys -t $session:$window 'cd $REPO; vrun ve; nvim' C-m

  # Create a new window named aot at index 2 and divide it into 6 panes
  window=2
  tmux new-window -t $session:$window -n 'AOT'
  tmux send-keys -t $session:$window 'cd $REPO' C-m

  tmux select-window -t $session:$window
  # aot_start -s $session -w $window

  # Create a monitoring window with btop
  window=3
  tmux new-window -t $session:$window

  pane=1
  tmux select-window -t $session:$window
  tmux send-keys -t $session:$window 'k9s' C-m
  pane=2
  tmux split-window -p 50
  tmux send-keys -t $session:$windiw.$pane \
    "microk8s kubectl port-forward svc/my-release-tts 1443:443" C-m

  # Create a monitoring window with btop
  window=4
  tmux new-window -t $session:$window

  tmux select-window -t $session:$window
  tmux send-keys -t $session:$window 'btop' C-m

  # Attach to the new session
  #
  tmux select-window -t $session:1
  tmux attach-session -t $session
}

function otel_docker(){
  export STORE_ID=pedro_tests

  docker run --rm \
    -p 127.0.0.1:4317:4317 \
    -e NEW_RELIC_LICENSE_KEY=2b6ef3fcfd5e50ea879a8a1b81d06bd61862NRAL \
    -e STORE_ID=pedro_tests \
    -v "/home/pedro/Documents/Development/IBM/repos/otel/otel-local-config.yaml":/otel-local-config.yaml \
    --name otelcol otel/opentelemetry-collector \
    --config otel-local-config.yaml
  }
