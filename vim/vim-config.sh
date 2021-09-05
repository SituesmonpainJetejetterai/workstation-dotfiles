#!/usr/bin/env bash

if [[ $PWD == ~ ]]; then
    echo 'Running this script from your home dir is pointless.'
    exit 1
fi 

echo 'Installing/updating vim with features'
sudo apt install vim-gtk -y

# dot=$(dirname "$0")
colour_path="$(dirname "$0")/.vim/colors/"

echo 'updating gruvbox.vim'

cd || return "$colour_path" && { curl -O https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim; cd - || return; }

echo "updating config in $HOME/.vim"

cd "$HOME" || exit
if [ -L "$HOME/.vim" ] && [ -e "$HOME/.vim" ]; then
    echo 'Link exists'
else
    ln -s "$HOME/git-repos/setups/vim/.vim" "$HOME"
fi
