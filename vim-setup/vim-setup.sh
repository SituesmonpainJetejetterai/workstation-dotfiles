#!/usr/bin/env bash

if [[ $PWD == ~ ]]; then
    echo 'Running this script from your home dir is pointless.'
    exit 1
fi 

echo 'Installing/updating checkinstall for ease of use'
sudo apt install checkinstall -y

echo 'cleaning up previous versions of vim'
if [ -d "$HOME/vim/" ]; then
    cd "$HOME/vim/src/" && sudo dpkg -r src
fi
sudo apt purge vim -y && sudo apt autoremove -y

echo 'Downloading/updating the vim source'
if [ -d "$HOME/vim/" ]; then
    cd "$HOME/vim/" && git pull
else
    cd "$HOME" && git clone https://github.com/vim/vim.git
fi

echo 'Downloading/updating dependencies'
sudo apt-get -y build-dep vim
sudo apt install libncurses-dev -y

echo 'Compiling vim'
rm "$HOME/vim/src/auto/config.cache"
cd "$HOME/vim/" && ./configure --with-x=yes --disable-gui
cd "$HOME/vim/src" && sudo checkinstall

# ---


# Done. The new package has been installed and saved to
# 
 # /home/happy/vim/src/src_20210901-1_amd64.deb
# 
 # You can remove it from your system anytime using:
# 
      # dpkg -r src


# ---


dot=$(dirname "$0")
colour_path="$dot/.vim/colors/"

echo 'updating gruvbox.vim'

cd "$colour_path" && { curl -O https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim; cd -; }

echo 'updating config in $HOME/.vim'

if [ -L "$HOME/.vim" ] && [ -e "$HOME/.vim" ]; then
    echo 'Link exists'
else
    ln -s "$dot/.vim" "$HOME"
fi
