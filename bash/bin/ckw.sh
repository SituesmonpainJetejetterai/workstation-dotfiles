#!/bin/sh

# Check definition of keyword
# It checks if the keyword is defined in the interactive shell and in the vimrc
ckw() {
    # Bash functions defined in the interactive shell
    # Supress all errors, display through less if output doesn't fit the screen
    type "${1}" 2>/dev/null | less -FXR
    grep -Hwne "${1}" "$HOME/bin/.bash/.bash_functions.sh" --color=always | tr -d "{"

    # Show matches from vimrc
    grep -HEn "remap|command!" "$HOME/.vim/vimrc" | sed -e 's/\s*\".*//; /^$/d' | grep -w "${1}" --color=always | less -FXR
}

ckw "$@"
