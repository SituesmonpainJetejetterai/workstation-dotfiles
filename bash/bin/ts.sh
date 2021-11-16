#!/bin/sh

# Start 2 tmux sessions, one for work and another for config
# Split the window in the config session horizontally
ts() {
    # Check for the tmux variable (set when inside tmux)
    if [ -z "$TMUX" ]; then
        if tmux has-session 2>/dev/null; then
            # Attach to session
            tmux a
        else
            printf "\n%s" "session doesn't exist"
            # Switch to directory with git repos
            cd ~/git-repos/setups || return
            # Start tmux and name the window as "config" but don't attach
            tmux new -t config -d
            # Split a window in tmux
            tmux split-window -t config -h
            # Come back to current directory
            cd - || return
            # Create new tmux window called "work"
            tmux new -t work -d
            # Attach to tmux session called config
            tmux a -t config
        fi
    else
        printf "\n%s" "Already in a tmux session"
        return
    fi
}

ts
