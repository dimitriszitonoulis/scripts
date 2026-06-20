#!/bin/sh

state_dir="$HOME/.local/state"
state_file="$state_dir/hyprsunset_shader_state"
temperature=$1
state="ON"

# create dir if it does not exist
mkdir -p "$state_dir"

if [ -f "$state_file" ]; then
    read -r state <$state_file
fi

if [ -z "$temperature" ]; then
    echo "No gamma specified"
    exit 1
fi

if [ "$state" = "OFF" ]; then
    hyprctl hyprsunset temperature "$temperature" >/dev/null
    echo "ON" >$state_file
    exit 0
fi

hyprctl hyprsunset identity >/dev/null
echo "OFF" >$state_file
exit 0
