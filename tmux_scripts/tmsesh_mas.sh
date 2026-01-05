#!/bin/bash

# session name
session="imas"

# window names
dir="~/Documents/uni/7ο\ εξάμηνο/Συστήματα\ Ευφυών\ Πρακτόρων"
dev_window="dev"
run_window="run"
example_window="examples"
challenge_window="challenges"
version_control_window="git"

# directories
exercise_dir="$dir/mas_ex1"
study_dir="$dir/AgentSpeak-Programming-using-Jason"
example_dir="$dir/AgentSpeak-Programming-using-Jason/examples"
challenge_dir="$dir/AgentSpeak-Programming-using-Jason/challenges"

# kill all previous sessions
tmux kill-session -t $session

# Start new session
tmux new-session -d -s "$session"

# developer window
tmux rename-window -t 1 "$dev_window"
tmux send-keys -t "$session:$dev_window" "cd $exercise_dir" C-m
tmux send-keys -t "$session:$dev_window" "n ." C-m

# window to run code
tmux new-window -t $session:2 -n "$run_window"
tmux send-keys -t "$session:$run_window" "cd $dir" C-m
tmux send-keys -t "$session:$run_window" "clear" C-m
# tmux send-keys -t "$session:$run_window" "clear; jason ./" C-i
tmux send-keys -t "$session:$run_window" "clear; jason ./"


# window to study theory examples
tmux new-window -t $session:3 -n "$example_window"
tmux send-keys -t "$session:$example_window" "cd $example_dir" C-m
tmux send-keys -t "$session:$example_window" "n ." C-m

# window to study theory challenges
tmux new-window -t $session:4 -n "$challenge_window"
tmux send-keys -t "$session:$challenge_window" "cd $challenge_dir" C-m
tmux send-keys -t "$session:$challenge_window" "n ." C-m

# window for version control
tmux new-window -t $session:5 -n "$version_control_window"
tmux send-keys -t "$session:$version_control_window" "cd $exercise_dir" C-m
tmux send-keys -t "$session:$version_control_window" "clear" C-m
tmux send-keys -t "$session:$version_control_window" "git "

# Attach session, on the 1st window
tmux attach-session -t "$session:1"
