#!/bin/sh

# Check definition of keyword
# It checks if the keyword is defined in the interactive shell and in the vimrc
ckw() {
    # Bash functions defined in the interactive shell
    # Supress all errors, display through less if output doesn't fit the screen
#     type "${1}" | less -FXR 2>/dev/null
    find . -name "*${1}*" -exec less -FXR {} \; 2>/dev/null
    grep -Hwne "${1}" "$HOME/bin/.bash/.bash_functions.sh" --color=always 2>/dev/null | tr -d "{"
    grep -Hwne "alias\s${1}" "$HOME/bin/.bash/.bash_aliases" --color=always 2>/dev/null

    # Show matches from vimrc
    grep -HEn "remap|command!" "$HOME/.vim/vimrc" | sed -e 's/\s*\".*//; /^$/d' | grep -w "${1}" --color=always | less -FXR
}

ckw "$@"
