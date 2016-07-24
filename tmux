setw -g mode-keys vi

set -g default-terminal "screen-256color"

bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

set-option -g allow-rename off
