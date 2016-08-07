# -----------
# scroll mode
# -----------

setw -g mode-keys vi


# ---
# l&f
# ---

set-option -g allow-rename off

set -g base-index 1
set -g pane-base-index 1

set -g set-titles on

# open new panes in $PWD
bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
bind c new-window -c "#{pane_current_path}"

# load airline theme
if-shell "test -f ~/.tmux-airline.conf" "source ~/.tmux-airline.conf"

# status line
set -g status-right '#{cpu_percentage} | #{battery_percentage} | %d.%m.%y %H:%M '


# ----
# keys
# ----

# prefix
unbind C-b
set -g prefix C-Space
bind Space send-prefix

# visual selection
bind-key -t vi-copy v begin-selection


# -------
# plugins
# -------

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'tmux-plugins/tmux-copycat'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'tmux-plugins/tmux-urlview'
set -g @plugin 'tmux-plugins/tmux-logging'
set -g @plugin 'tmux-plugins/tmux-pain-control'
set -g @plugin 'tmux-plugins/tmux-sessionist'
set -g @plugin 'tmux-plugins/tmux-battery'
set -g @plugin 'tmux-plugins/tmux-cpu'
set -g @plugin 'jbnicolai/tmux-fpp'

run '~/.tmux/plugins/tpm/tpm'

# yank
set -g @shell_mode 'vi'

# continuum
set -g @continuum-boot 'on'
set -g @continuum-restore 'on'
set -g @continuum-boot-options 'iterm,fullscreen'
