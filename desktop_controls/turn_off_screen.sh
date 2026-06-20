#!/bin/sh

state_dir="$HOME/.local/state"
state_file="$state_dir/toggle_screen_state"

monitor="$1"
if [ -z "$monitor" ]; then
    echo "No monitor specified"
    exit 1
fi

current_brightness=$(brightnessctl -d "$monitor" get)
default_brightness="50%"

# create state file if it does not exist
mkdir -p "$state_dir"

if [ $current_brightness -eq 0 ]; then
    if [ -f "$state_file" ]; then
        brightnessctl -d "$monitor" set "$(cat "$state_file")"
        exit
    fi

    brightnessctl -d "$monitor" set "$default_brightness"
    exit
fi

echo "$current_brightness" >"$state_file"
brightnessctl -d "$monitor" set 0
exit
