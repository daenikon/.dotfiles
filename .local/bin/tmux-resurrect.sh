#!/bin/bash

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    echo "tmux is not installed. Please install tmux to use this script."
    exit 1
fi

# Check if tmux-resurrect is installed
if [ ! -d "$HOME/.config/tmux/plugins/tmux-resurrect" ]; then
    echo "tmux-resurrect plugin is not found. Please install tmux-resurrect to use this script."
    exit 1
fi

log() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1"
}

# Create a new detached tmux session if none exists
if ! tmux has-session 2>/dev/null; then
    log "Creating a new tmux session"
    tmux new-session -d
else
    log "A tmux session already exists. Skipping session creation."
fi

log "Restoring tmux session using tmux-resurrect"
if tmux run "$HOME/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh"; then
    log "Tmux session restored successfully"
else
    log "Failed to restore tmux session"
    exit 1
fi

log "Attaching to the tmux session"
if tmux attach-session; then
    log "Attached to tmux session"
else
    log "Failed to attach to tmux session or tmux session exited"
    exit 1
fi
