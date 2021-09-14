#!/usr/bin/env bash

# Setting functions
## The "$1" parameter takes the first argument passed to the function in the shell as input

# ---


# System functions

## grep the commands I've put into the shell using a pager to scroll
function hg () {
    history | grep "${1}" | less
}

## search for text in files inside current folder
## add one other parameter (for example: `w`, `H` etc) to `grep` - note that these are `grep` parameters, nothing new.
## `sed G` simply appends a newline character followed by the contents of the hold space to the pattern space.
function search () {
    if [ -z "${2}" ];
    then
        find . -type f -print0 | xargs -0 -I {} grep "${1}" {} | sed G | less
    else
        find . -type f -print0 | xargs -0 -I {} grep -"${2}" "${1}" {} | sed G | less
    fi
}

## regex practice
function rexp () {
    # grep -hse "\'.*\'" "temp.md"
    printf "\nWelcome to the regex practice session!\nEnter the path of the file you want to practice on: "
    read -r file
    while true
    do
        printf "\nReading input regex syntax: "
        read -r syntax
        grep -hse "${syntax}" "${file}"
    done
}


# Tmux functions

## start 2 tmux sessions, one for work and another for config
## split the window in the config session horizontally
function ts () {
    if [ -z "$TMUX" ]; then
        if tmux has-session 2>/dev/null; then
            tmux a
        else
            echo -e "session doesn't exist"
            cd ~/git-repos/setups || return
            tmux new -t config -d
            tmux split-window -t config -h
            cd - || return
            tmux new -t work -d
            tmux a -t config
        fi
    else
        echo -e "Already in a tmux session"
        return
    fi
}


# Git functions

## Show the branch I'm currently on while inside a git repository
function parse_git_branch () {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

## Show the git diff in a colourful pager
## If a file is not in the git list of files, use less to show its contents
function gd () {
    if [ -z "${1}" ]; then
        git diff .
    else
        if [[ -n "$(git ls-files "${1}")" ]]; then
            git diff "${1}"
        else
            less "${1}"
        fi
    fi
}

## Merge remote changes with the local branch
## Needs argument specifying the branch
function gfm () {
    git fetch origin "${1}" && git merge -s recursive -X theirs origin "${1}"
}

## Forcibly pull remote changes and override local changes
## Needs argument specifying the branch
function gdf () {
    git fetch --all && git reset --hard origin/"${1}"
}

## Perform the git action on all subdirectories with .git/ in them.
## Help: https://stackoverflow.com/questions/3497123/run-git-pull-over-all-subdirectories
function gall () {
    find . -type d -name ".git" -printf "%h: " -prune -exec git --git-dir={} "${1}" \;
    # find . -name ".git" -type d -print | xargs -P10 -I{} git --git-dir={} "${1}"
}

## Delete branch locally and remotely
function gdel () {
    git branch -d "${1}" && git push origin --delete "${1}"
}

# apt functions

## install a package
function ins () {
    sudo apt install "${1}" -y
}

## purge an application & cleanup
function del () {
    sudo apt purge "${1}" -y && sudo apt autoremove -y
}
