#!/bin/sh

# View logs and optionally clear screen
gl() {
    git log --oneline
    printf "\n%s" "Clear?: "
    if read -r input; then
        case "$input" in
            y|Y|q|"")
                clear
                ;;
        esac
    fi
}

gl
