#!/bin/bash

# Vim setup script. This sript will be used to set up vim for programming in any new machine.
# The .vim/ directory is already created and is ready to be copied into $HOME
# If not present, it will copy the entire folder, essentially making vim workable, with the required config.

# While using vim on the machine, I might make changes. Instead of copying each file by hand, I'll just copy everything inside $HOME/.vim here, and push. Easy.

# use chmod u+x script to make it executable.

DEST="$HOME/.vim/"

if ! [[ -d $DEST ]]; then
  cp -r "./.vim/" "$HOME/"
fi

SRC=".vim/"

read -n 1 -p "Copy changes from ~/.vim to .vim? [Y/N] " reply;
if [ "$reply" != "" ]; then echo; fi
if [ "$reply" = "${reply#[Nn]}" ]; then echo; fi
if [ "$reply" = "${reply#[Yy]}" ]; then 
    rm -rf .vim/ && mkdir .vim/ && cp -r $HOME/.vim/* .vim/
fi

