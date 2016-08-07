# ------
# pbcopy
# ------

#set-option -g default-command "reattach-to-user-namespace -l zsh"

bind-key -t vi-copy v begin-selection

#bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"

#unbind -t vi-copy Enter
#bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"

#bind ] run "reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer"


# -----------
# scroll mode
# -----------

setw -g mode-keys vi


# ---
# l&f
# ---

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


# -------
# plugins
# -------

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'tmux-plugins/tmux-sidebar'
set -g @plugin 'tmux-plugins/tmux-copycat'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'tmux-plugins/tmux-urlview'
set -g @plugin 'tmux-plugins/tmux-logging'
set -g @plugin 'tmux-plugins/tmux-pain-control'
set -g @plugin 'tmux-plugins/tmux-sessionist'
set -g @plugin 'jbnicolai/tmux-fpp'

run '~/.tmux/plugins/tpm/tpm'

# yank
set -g @shell_mode 'vi'

# continuum
set -g @continuum-boot 'on'
set -g @continuum-restore 'on'
set -g @continuum-boot-options 'iterm,fullscreen'
