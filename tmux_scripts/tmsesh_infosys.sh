#!/bin/bash

# session name
session="info_sys"

# window names
dev_window="dev"
db_window="mongo"
study_window="study"
version_control_window="git"
server_window="server"

# directories
project_dir="~/Documents/info_sys/exercise/"
venv_dir="~/Documents/venvs/info_sys_ex/bin/activate"
study_dir="~/Documents/info_sys/Information-Systems-Lab/"


# kill all previous sessions
tmux kill-session -t $session

# Start new session
tmux new-session -d -s "$session"

# window to edit code
tmux rename-window -t 1 "$dev_window"
tmux send-keys -t "$session:$dev_window" "source $venv_dir" C-m
tmux send-keys -t "$session:$dev_window" "cd $project_dir" C-m
tmux send-keys -t "$session:$dev_window" "n ." C-m

# window to handle the db
tmux new-window -t $session:2 -n "$db_window"
# tmux send-keys -t "db" "systemctl start docker.service" C-m
# tmux send-keys -t "$session:db" "systemctl start docker.service" C-m
# tmux send-keys -t "$session:$db_window" "sudo systemctl start docker.service" C-m
tmux send-keys -t "$session:$db_window" "sd start mongodb && sleep 1 && sd exec -it mongodb mongosh" C-m
# tmux send-keys -t "$session:$db_window" "sd exec -it mongodb mongosh" C-m
# tmux send-keys -t "$session:db" 

# window for version control
tmux new-window -t $session:3 -n "$version_control_window"
tmux send-keys -t "$session:$version_control_window" "cd $project_dir" C-m
tmux send-keys -t "$session:$version_control_window" "clear" C-m

# server window
tmux new-window -t $session:4 -n "$server_window"
tmux send-keys -t "$session:$server_window" "cd $project_dir" C-m
tmux send-keys -t "$session:$server_window" "source $venv_dir" C-m
tmux send-keys -t "$session:$server_window" "clear" C-m
tmux send-keys -t "$session:$server_window" "python server.py"

# window to study theory
tmux new-window -t $session:5 -n "$study_window"
tmux send-keys -t "$session:$study_window" "cd $study_dir" C-m
tmux send-keys -t "$session:$study_window" "n ." C-m


# Attach session, on the 1st window
tmux attach-session -t "$session:1"
