#!/bin/sh

# Merge remote changes with the local branch
# Can merge with remote on current branch, or a specific branch
gfm() {
    printf "\n%s\n" "Merging remote changes with local branch"
    if [ -z "${1}" ]; then
        # Get the current branch
        current_branch="$(git rev-parse --abbrev-ref HEAD)"
        # Fetch the remote changes from origin and merge recursively with remote changes over local edits
        git fetch origin "${current_branch}" && git merge -s recursive -X theirs origin "${current_branch}"
    else
        git fetch origin "${1}" && git merge -s recursive -X theirs origin "${1}"
    fi
}

gfm "$@"
