#!/bin/sh

# Abbreviation for "make new script"
# Link: https://stackoverflow.com/questions/21115121/how-to-test-if-string-matches-a-regex-in-posix-shell-not-bash

mns() {
    cd "$HOME/bin" || return

    printf "\n%s" "Enter the name of the script: "
    read -r script

    check() {
        printf "%s" "${script}" | if grep -qG "\.sh"; then printf "%s" "0"; else printf "%s" "1"; fi
    }

    if [ check = "0" ]; then
        vim "${script}"
    elif [ check = "1" ]; then
        script="${script}.sh"
        vim "${script}"
    fi

    if [ -f "${script}" ]; then
        chmod u+x "${script}"
    fi
}

mns
