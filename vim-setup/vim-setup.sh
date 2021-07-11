#!/usr/bin/env bash

# Vim setup script. This sript will be used to set up vim for programming in any new machine.
# The .vim/ directory is already created and is ready to be copied into $HOME
# If not present, it will copy the entire folder, essentially making vim workable, with the required config.

# While using vim on the machine, I might make changes. Instead of copying each file by hand, I'll just copy everything inside $HOME/.vim here, and push. Easy.

# use chmod u+x script to make it executable.

if [[ $PWD == ~ ]]; then
    echo 'Running this script from your home dir is pointless.' && exit 1;
fi

# Actual logic
if ! [[ -d ~/vim ]]; then
    rsync -anv .vim/ ~/.vim
    echo "copied .vim/ into ~/.vim for first time setup"
fi

read -rn1 -p 'To copy .vim/ into ~/.vim, press 1. To copy ~/vim/ into .vim, press 2: '
if [[ $REPLY == [1] ]]; then
    rsync -anv .vim/ ~/.vim
if [[ $REPLY == [2] ]]; then
    rysnc -anv ~/.vim/ .vim
else
    echo "shut up" && exit 1;
fi

# read -rn1 -p 'Sync ~/.vim into ./.vim? [y/n]: '
#  [[ -z $REPLY ]] || echo

# if [[ $REPLY == [yY] ]]; then
#     rsync -anv ~/.vim/ .vim
# fi
