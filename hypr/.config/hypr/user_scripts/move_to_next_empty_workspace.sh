#!/bin/sh

# Get the ID of the active window
window_id=$(hyprctl activewindow -j | jq -r '.address')

# Get the ID of the next available workspace
next_workspace=$(hyprctl workspaces -j | jq 'map(.id) | max + 1')

# Move the window to the next available workspace
hyprctl dispatch movetoworkspace $next_workspace $window_id

# Focus on the next available workspace
hyprctl dispatch workspace $next_workspace

# Wait for 0.5 seconds
sleep 0.5

# Run Neovide in the background
nohup neovide "$@" &

# Exit the script
exit 0

