#!/bin/sh

# SYSTEM FUNCTIONS

# Shrug
shrug() {
    printf "\n%s" "¯\\_(ツ)_/¯"
#     pbcopy
#     printf "\n%s" "¯\\_(ツ)_/¯ copied to your clipboard"
}

# Grep the commands I've put into the shell using a pager to scroll
# Show coloured grep output through less
hg() {
    history | grep "${1}" --color=always | less -FXR
}

# Count number of lines in all files in a directory(including subdirectories)
# Can specify directory, or will act in current directory
cnl() {
    find "${1:-.}" -type f -print | sed 's/.*/"&"/' | xargs  wc -l | less -FXR
}

# Find a file
ff() {
    find . -type f -name "*${1}*" | less -FX
}

# Find a directory
fd() {
    find . -type d -name "*${1}*" | less -FX
}

# Move to a directory and show all contents
# If no directory is mentioned, show the $HOME directory
# Link: https://opensource.com/article/19/7/bash-aliases
c() {
    DIR="$*";
    # If no DIR given, go home
    if [ $# -lt 1 ]; then
        DIR=$HOME;
    fi;
    cd "${DIR}" && ls -Fa --color=auto
}

i() {
    sudo apt install "${@}" -y
}

d() {
    sudo apt purge "${@}" -y && sudo apt autoremove -y
}

# GIT FUNCTIONS

# Perform the git action on all subdirectories with .git/ in them.
# Help: https://stackoverflow.com/questions/3497123/run-git-pull-over-all-subdirectories
gall() {
    find . -type d -name ".git" -printf "%h: " -prune -exec git --git-dir={} "${1}" \;
}

# Delete branch locally and remotely
gdel() {
    git branch -d "${1}" && git push origin --delete "${1}"
}

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
