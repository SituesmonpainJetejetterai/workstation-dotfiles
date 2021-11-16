#!/bin/sh

# Restore a staged file
gr() {
    staged_files="$(git diff --name-only --cached)"
    printf "\n"
    printf "%s" "${staged_files}" | nl -s:
    printf "\n%s" "Which files do you want to restore?"
    printf "\n%s" "Enter the number(s) for individual file(s), or press Enter to unstage everything: "
    read -r unstage_files
    if [ -z "${unstage_files}" ]; then
        git restore --staged .
    else
        for i in ${unstage_files};
        do
            git restore --staged "$(printf "%s" "${staged_files}" | sed -n "${i}p")"
        done
    fi
}

gr
