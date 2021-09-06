#!/usr/bin/env bash

sudo apt update -y && sudo apt upgrade -y
sudo apt purge vim -y && sudo apt autoremove -y
sudo apt install tmux vim-gtk lynx tree htop git shellcheck pylint python3 -y

# if [[ $PWD == ~ ]]; then
    # echo 'Running this script from your home dir is pointless.'
    # exit 1
# fi 

# vim setup

echo 'updating gruvbox.vim'

cd "$HOME/git-repos/setups/vim/.vim/colors/" && { curl -sSO https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim; cd - || return; }

echo "updating config in $HOME/.vim"
rm -rf "$HOME/.vim" || rm "$HOME/.vim"
ln -si "$HOME/git-repos/setups/vim/.vim" "$HOME"

# tmux setup

ln -sf "$HOME/git-repos/setups/tmux/.tmux.conf" "$HOME"

# bash setup

cd "$HOME" && ln -sf "$HOME/git-repos/setups/bash/.bash" "$HOME" && cd "-" || return
## Check out the README.md on the steps to follow to complete this. I haven't automated this yet.
