#!/bin/sh

# Change to a directory from anywhere in the FS
cdf() {
    # Find all directories
    finder() {
        find "$HOME" -name ".git" -prune -o -type d -print
    }
    # List all the directories with less
    finder | nl -w 1 -s: | less -FX

    printf "\n%s" "Number for directory: "
    read -r directory

    # Switch to directory
    cd "$(finder | sed -n """${directory}"" p")" || return
}

cdf
