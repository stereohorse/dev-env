# ------
# pbcopy
# ------

set-option -g default-command "reattach-to-user-namespace -l zsh"

bind-key -t vi-copy v begin-selection
bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"

unbind -t vi-copy Enter
bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"

bind ] run "reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer"


# -----------
# scroll mode
# -----------

setw -g mode-keys vi


# ---
# l&f
# ---

set -g default-terminal "screen-256color"
set -g status off

set-option -g allow-rename off

set -g base-index 1
set -g pane-base-index 1

set -g set-titles on

source "/usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf"

# open new panes in $PWD

bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
bind c new-window -c "#{pane_current_path}"


# ----
# keys
# ----

# prefix

unbind C-b
set -g prefix C-Space
bind Space send-prefix

# panes navigation

bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# resize panes

bind-key -r J resize-pane -D 5
bind-key -r K resize-pane -U 5
bind-key -r H resize-pane -L 5
bind-key -r L resize-pane -R 5

