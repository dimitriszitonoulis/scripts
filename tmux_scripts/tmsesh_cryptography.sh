#!/bin/sh

session="cryptography"
dev_window="dev"
run_window="run"
crypto_folder="~/Documents/uni/7ο\ εξάμηνο/Κρυπτογραφία/"
crypto_folder_labs="$crypto_folder/Labs"
venv_folder="~/Documents/venvs/cryptography/bin/activate"

# kill all previous sessions
tmux kill-session -t $session

# Start new session
tmux new-session -d -s "$session"

# window to edit code
tmux rename-window -t 1 "$dev_window"
tmux send-keys -t "$session:$dev_window" "source $venv_folder" C-m
tmux send-keys -t "$session:$dev_window" "cd $crypto_folder" C-m
tmux send-keys -t "$session:$dev_window" "n ." C-m

# window to handle the db
tmux new-window -t $session:2 -n "$run_window"
tmux send-keys -t "$session:$run_window" "source $venv_folder" C-m
tmux send-keys -t "$session:$run_window" "cd $crypto_folder_labs" C-m
tmux send-keys -t "$session:$run_window" "clear" C-m
tmux send-keys -t "$session:$run_window" "clear; python " C-i

# Attach session, on the 1st window
tmux attach-session -t "$session:1"
