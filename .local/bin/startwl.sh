#!/bin/bash

# Notification daemon
dunst &

# Status bar
waybar &

# Start PipeWire before Hyprland to ensure it's in the same D-Bus session
gentoo-pipewire-launcher &

# "exec" means that no subsequent commands in that file will be executed
exec dbus-run-session Hyprland
