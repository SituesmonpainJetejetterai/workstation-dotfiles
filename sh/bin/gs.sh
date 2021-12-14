#!/bin/sh

gs() {
    git status -sb
    printf "\n%s" "Edit?: "
    read -r number
    if [ "${number}" = "" ]; then
        return
    else
        vim "$(git status -sb | sed "s/#.*//; /^$/d; s/.*\s//" | sed -n "${number}p")"
    fi
}

gs
