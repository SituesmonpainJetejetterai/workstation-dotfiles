#!/bin/sh

# Show the git diff in a colourful pager
# Show both tracked and untracked files
gd() {
    # Find files which are still to be committed
    still_to_be_committed() {
        git status -sb | sed "s/#.*//; s/M//; s/.*\\s//; /^$/d"
    }

    still_to_be_committed | nl -s:

    printf "\n%s" "Enter the number(s) of the file(s) you want to see the diff for, or press \"enter\" to see the diff for all uncommitted files: "
    read -r numbers

    if [ -z "${numbers}" ]; then
        # Show a diff for the tracked files
        git diff .
        # Show a diff for all the untracked files
        # The first command lists all of the untracked files
        # Which is then piped to another git command which shows the changes in the untracked files
        # Which is piped to less in case the output doesn't fit the screen
        git ls-files -z --other --exclude-standard | xargs -0 -I {} git diff --color -- /dev/null {} | less -FXR 2>/dev/null
    else
        for f in ${numbers}
        do
            # A variable containing the name of the file to be staged
            file=$(still_to_be_committed | sed -n "${f}p")
            if [ -n "$(git ls-files "${file}")" ]; then
                # Tracked file (part of git repo)
                git diff "${file}"
            else
                # Untracked file (not part of git repo yet)
                git diff --color -- /dev/null "${file}" | less -FXR
            fi
        done
    fi
}

gd
