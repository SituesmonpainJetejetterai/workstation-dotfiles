#!/bin/sh

# File and folder removal all-in-one
rma() {

    # Delete both files and folders, and suppress any errors
    rm -rf "$@" 2>/dev/null
    rm -f "$@" 2>/dev/null
    printf "\n%s\n" "Attempted to delete all files and folders mentioned as arguments"
    # Show the contents of the directory and their number (both files and directories)
    ls -apF && printf "\n" && find . -maxdepth 1 | wc -l
}

rma "$@"
