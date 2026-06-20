#!/bin/bash

# session name
session="adap"

# window names
# jup_window="jup"
dev_window="dev"
# db_window="mongo"
# study_window="study"
version_control_window="git"
server_window="server"

# directories
jup_dir="~/Documents/Advanced_data_analytics_project/app/model"
project_dir="~/Documents/Advanced_data_analytics_project/"
venv_dir="~/Documents/venvs/adap/bin/activate"

# kill all previous sessions
tmux kill-session -t $session

# Start new session
tmux new-session -d -s "$session"

# window to edit code
tmux rename-window -t 1  "$dev_window"
tmux send-keys -t "$session:$dev_window" "source $venv_dir" C-m
tmux send-keys -t "$session:$dev_window" "cd $project_dir" C-m
tmux send-keys -t "$session:$dev_window" "clear" C-m
# tmux send-keys -t "$session:$dev_window" "n ." C-m

# window to handle the db
# tmux new-window -t $session:3 -n "$db_window"
# tmux send-keys -t "$session:$db_window" "sd start mongodb && sleep 1 && sd exec -it mongodb mongosh" C-m

# window for version control
tmux new-window -t $session:2 -n "$version_control_window"
tmux send-keys -t "$session:$dev_window" "source $venv_dir" C-m
tmux send-keys -t "$session:$version_control_window" "cd $project_dir" C-m
tmux send-keys -t "$session:$version_control_window" "clear" C-m

# server window
tmux new-window -t $session:3 -n "$server_window"
tmux send-keys -t "$session:$server_window" "cd $project_dir" C-m
tmux send-keys -t "$session:$server_window" "source $venv_dir" C-m
tmux send-keys -t "$session:$server_window" "clear" C-m
tmux send-keys -t "$session:$server_window" "python server.py"


# window for jupyter
# tmux new-window -t $session:4 -n "$jup_window"
# tmux send-keys -t "$session:$jup_window" "source $venv_dir" C-m
# tmux send-keys -t "$session:$jup_window" "cd $jup_dir" C-m
# tmux send-keys -t "$session:$jup_window" "clear" C-m
# tmux send-keys -t "$session:$jup_window" "jupyter notebook" C-m



# Attach session, on the 1st window
tmux attach-session -t "$session:1"
