#!/bin/bash

# Vim setup script. This has 2 functions;
# To copy ~/.vimrc to .vimrc (current folder)
# To copy coffee.vim (preferred colour scheme for markdown) to /usr/share/vim/vim$$/syntax/ - according to version

# copying the .vimrc
cp ~/.vimrc .vimrc

# copying coffee.vim

DEST_FILE=/usr/share/vim/vim81/syntax/coffee.vim

if ! [[ -f $DEST_FILE ]]; then
  sudo cp coffee.vim $DEST_FILE
fi
