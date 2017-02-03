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
set -g status-bg "colour234"
set -g message-command-fg "colour231"
set -g status-justify "left"
set -g status-left-length "100"
set -g status "on"
set -g pane-active-border-fg "colour254"
set -g message-bg "colour31"
set -g status-right-length "100"
set -g status-right-attr "none"
set -g message-fg "colour231"
set -g message-command-bg "colour31"
set -g status-attr "none"
set -g pane-border-fg "colour240"
set -g status-left-attr "none"
setw -g window-status-fg "colour250"
setw -g window-status-attr "none"
setw -g window-status-activity-bg "colour234"
setw -g window-status-activity-attr "none"
setw -g window-status-activity-fg "colour250"
setw -g window-status-separator ""
setw -g window-status-bg "colour234"
set -g status-left "#[fg=colour16,bg=colour254,bold] #S #[fg=colour254,bg=colour234,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=colour236,bg=colour234,nobold,nounderscore,noitalics]#[fg=colour247,bg=colour236]#{cpu_percentage} #{battery_percentage}"
setw -g window-status-format "#[fg=colour244,bg=colour234] #I #[fg=colour250,bg=colour234] #W "
setw -g window-status-current-format "#[fg=colour234,bg=colour31,nobold,nounderscore,noitalics]#[fg=colour117,bg=colour31] #I #[fg=colour231,bg=colour31,bold] #W #[fg=colour31,bg=colour234,nobold,nounderscore,noitalics]"


# ----
# keys
# ----

# prefix
unbind C-b
set -g prefix C-Space
bind Space send-prefix

# visual selection
bind-key -t vi-copy v begin-selection

# switch layouts
bind-key Space next-layout


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
