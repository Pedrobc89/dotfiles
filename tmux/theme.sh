#### COLOUR

tm_color_active=colour05
tm_color_inactive=colour241
tm_color_clock=colour255
tm_color_feature=colour05
tm_color_music=colour16
tm_active_border_color=colour05

# separators
#tm_separator_left_bold="◀"
m_separator_left_thin="❮"
m_separator_right_bold="▶"
m_separator_right_thin="❯"

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# default statusbar colors
# set-option -g status-bg colour0
#tmux 2.9
set-option -g status-style  fg=$tm_color_active,bg=default,default

# default window title colors
# tmux 2.9
set-window-option -g window-status-style fg=$tm_color_inactive,bg=default
set -g window-status-format "#I #W"

# active window title colors
# tmux 2.9
set-window-option -g window-status-current-style fg=$tm_color_active,bg=default
set-window-option -g  window-status-current-format "#[bold]#I #W"

# pane border
# tmux 2.9
set-option -g pane-border-style fg=$tm_color_inactive
set-option -g pane-active-border-style fg=$tm_active_border_color

# message text
# tmux 2.9
set-option -g message-style fg=$tm_color_active,bg=default

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive

# clock
set-window-option -g clock-mode-colour $tm_color_active

 tm_tunes="#[fg=$tm_color_music]#(osascript ~/.dotfiles/applescripts/tunes.scpt | cut -c 1-50)"
#tm_tunes="#[fg=$tm_color_music]#(osascript -l JavaScript ~/.dotfiles/applescripts/tunes.js)"
#tm_battery="#(~/.dotfiles/bin/battery_indicator.sh)"

tm_date="#[fg=$tm_color_clock] %R %d %b"
tm_host="#[fg=$tm_color_feature,bold]#h"
tm_session_name="[#[fg=$tm_color_feature,bold]#S#[fg=colour255]]"

set -g status-left $tm_session_name' '
set -g status-right $tm_tunes' '$tm_date' '$tm_host
