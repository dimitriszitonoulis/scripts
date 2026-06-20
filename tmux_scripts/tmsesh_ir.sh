#!/bin/sh

session="info_ret"
dev_window="dev"
run_window="run"
git_window="git"
ir_folder="~/dev/information_retrieval/"
venv_folder="~/Documents/venvs/ir/bin/activate"

# kill all previous sessions
tmux kill-session -t $session

# Start new session
tmux new-session -d -s "$session"

# window to edit code
tmux rename-window -t 1 "$dev_window"
tmux send-keys -t "$session:$dev_window" "source $venv_folder" C-m
tmux send-keys -t "$session:$dev_window" "cd $ir_folder" C-m
tmux send-keys -t "$session:$dev_window" "clear" C-m

# window to run code
tmux new-window -t $session:2 -n "$run_window"
tmux send-keys -t "$session:$run_window" "source $venv_folder" C-m
tmux send-keys -t "$session:$run_window" "cd $ir_folder" C-m
tmux send-keys -t "$session:$run_window" "clear" C-m
tmux send-keys -t "$session:$run_window" "clear; python "

# window for git
tmux new-window -t $session:3 -n "$git_window"
tmux send-keys -t "$session:$git_window" "source $venv_folder" C-m
tmux send-keys -t "$session:$git_window" "cd $ir_folder" C-m
tmux send-keys -t "$session:$git_window" "clear" C-m
tmux send-keys -t "$session:$git_window" "git "

# Attach session, on the 1st window
tmux attach-session -t "$session:1"
