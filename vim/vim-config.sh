#!/usr/bin/env bash

if [[ $PWD == ~ ]]; then
    echo 'Running this script from your home dir is pointless.'
    exit 1
fi 

dot=$(dirname "$0")
colour_path="$dot/.vim/colors/"

echo 'updating gruvbox.vim'

cd || return "$colour_path" && { curl -O https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim; cd -; }

echo "updating config in $HOME/.vim"

if [ -L "$HOME/.vim" ] && [ -e "$HOME/.vim" ]; then
    echo 'Link exists'
else
    ln -s "$dot/.vim" "$HOME"
fi
