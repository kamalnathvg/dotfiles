#!/bin/bash

SESSION="dev-session"

# Start a new detached tmux session
tmux new-session -d -s $SESSION

# Create first window (default) and run nvim
tmux rename-window -t $SESSION:1 "editor"
tmux send-keys -t $SESSION:1 'nvim' C-m

# Create second window and run htop
tmux new-window -t $SESSION -n "monitor"
tmux send-keys -t $SESSION:2 'htop' C-m

# Create third window with a blank terminal
tmux new-window -t $SESSION -n "terminal"

# Attach to the session
tmux attach -t $SESSION

