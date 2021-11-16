#!/bin/sh

# Git switch function
# Either switch to a new branch with the "f" argument
# Or switch to an existing branch
gw() {
    if [ -z "${2}" ]; then
        git switch "${1}"
    elif [ "${2}" = "f" ]; then
        git switch -c "${1}"
    else
        printf "\n%s" "Sorry, doesn't work like that"
    fi
}

gw "$@"
