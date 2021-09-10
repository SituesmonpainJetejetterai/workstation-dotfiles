#!/usr/bin/bash

# Setting functions
## The "$1" parameter takes the first argument passed to the function in the shell as input

# ---


# System functions

## grep the commands I've put into the shell using a pager to scroll
function hg () {
    history | grep "${1}" | less
}

# search for text in files inside current folder
# add one other parameter (generally `w` to match separate words) to `grep`
# `sed G` simply appends a newline character followed by the contents of the hold space to the pattern space.
function search () {
    if [ -z "${2}" ];
    then
        find . -type f -print0 | xargs -0 -I {} grep -H "${1}" {} | sed G | less
    else
        find . -type f -print0 | xargs -0 -I {} grep -H"${2}" "${1}" {} | sed G | less
    fi
}

function cont () {
    tmux new -t work -d
    cd ~/git-repos/setups && tmux new -t config -d \; split-window -h \;
    exec tmux a -t config
}
# Git functions

## Show the branch I'm currently on while inside a git repository
function parse_git_branch () {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

## Show the git diff in a colourful pager
function gd () {
    git diff "${1-.}"
}

## Merge remote changes with the local branch
function gfm () {
    git fetch origin "${1}" && git merge -s recursive -X theirs origin "${1}"
}

## Perform the git action on all subdirectories with .git/ in them.
## Help: https://stackoverflow.com/questions/3497123/run-git-pull-over-all-subdirectories
function gall () {
    find . -type d -name ".git" -printf "%h: " -prune -exec git --git-dir={} "${1}" \;
    # find . -name ".git" -type d -print | xargs -P10 -I{} git --git-dir={} "${1}"
}

# apt functions

## install a package
function ins ()
{
    sudo apt install "${1}" -y
}

## purge an application & cleanup
function del ()
{
    sudo apt purge "${1}" -y && sudo apt autoremove -y
}
