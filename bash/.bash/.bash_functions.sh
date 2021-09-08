#!/usr/bin/bash

# Setting functions


# ---


# System functions

## grep the commands I've put into the shell using a pager to scroll
function hg () {
    history | grep "${1}" | less
}

# Git functions

## Shows the branch I'm currently on while inside a git repository
function parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

## Shows the git diff in a colourful pager
function gd () {
    git diff "${1-.}"
}

# apt functions

## The "$1" parameter takes the first argument passed to the function in the shell as input

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
