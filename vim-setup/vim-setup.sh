#!/usr/bin/env bash

if [[ $PWD == ~ ]]; then
    echo 'Running this script from your home dir is pointless.'
    exit 1
fi 

dot="$(cd "$(dirname "$0")"; pwd)"
colour_path="$dot/.vim/colors/"

echo 'updating gruvbox.vim'

cd "$colour_path" && { curl -O https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim; cd -; }

echo 'updating config in $HOME/.vim'

if [ -d "$HOME/.vim/" ]; then
    rm -r "$HOME/.vim/"
    ln -s "$dot/.vim" "$HOME"
else
    ln -s "$dot/.vim" "$HOME"
fi
