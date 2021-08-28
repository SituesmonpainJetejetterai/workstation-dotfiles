#!/usr/bin/env bash

if [[ $PWD == ~ ]]; then
    echo 'Running this script from your home dir is pointless.'
    exit 1
fi 

dot="$(cd "$(dirname "$0")"; pwd)"
config_path="$dot/.vim"
colour_path="$dot/.vim/colors/gruvbox.vim"

echo 'updating gruvbox.vim'

curl -o gruvbox.vim https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim

echo 'updating config in $HOME/.vim'

if [ -d "$HOME/.vim" ]; then
    rm -r ~/.vim/
    ln -s .vim ~/.vim
else
    ln -s .vim ~/.vim
fi
