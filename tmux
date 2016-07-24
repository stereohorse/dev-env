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

set-option -g allow-rename off


# ----
# keys
# ----

# prefix

unbind C-b
set -g prefix C-a
bind C-a send-prefix

# panes navigation

bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
