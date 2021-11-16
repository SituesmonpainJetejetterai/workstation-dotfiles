#!/bin/sh


# Show the git diff in a colourful pager
# Show both tracked and untracked files
gd() {
    # If the first argument does not exist
    if [ -z "${1}" ]; then
        # Show a diff for the tracked files
        git diff .
        # Show a diff for all the untracked files
        # The first command lists all of the untracked files
        # Which is then piped to another git command which shows the changes in the untracked files
        # Which is piped to less in case the output doesn't fit the screen
        git ls-files -z --other --exclude-standard | xargs -0 -I {} git diff --color -- /dev/null {} | less -FXR 2>/dev/null
    else
        if [ -n "$(git ls-files "${1}")" ]; then
            # Tracked file (part of git repo)
            git diff "${1}"
        else
            # Untracked file (not part of git repo yet)
            git diff --color -- /dev/null "${1}"
        fi
    fi
}

gd "$@"
