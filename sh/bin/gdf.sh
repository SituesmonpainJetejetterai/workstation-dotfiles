#!/bin/sh

# Forcibly pull remote changes and override local changes
# Optional argument to specify the branch, otherwise will act on current branch
gdf() {
    if [ -z "${1}" ]; then
        printf "\n%s" "Enter branch to reset from. Default is current branch: "
        read -r branch
        if [ "${branch}" != "" ]; then
            # Override local edits and reset hard with remote changes
            git fetch --all && git reset --hard origin\/"${branch}"
        else
            # Get the current branch
            git fetch --all && git reset --hard origin\/"$(git rev-parse --abbrev-ref HEAD)"
        fi
    else
        git fetch --all && git reset --hard origin\/"${1}"
    fi
}

gdf $@
