#!/usr/bin/bash

# Setting functions

## Setting git functions

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

## apt function

### The "$1" parameter takes the first argument passed to the function in the shell as input
ins()
{
    sudo apt install "$1" -y
}

del ()
{
    sudo apt purge "$1" -y && sudo apt autoremove -y
}
