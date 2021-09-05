#!/usr/bin/env bash

if [[ $PWD == ~ ]]; then
    echo 'Running this script from your home dir is pointless.'
    exit 1
fi

if [ -L "$HOME/.config/neofetch/config.conf" ] && [ -e "$HOME/.config/neofetch/config.conf" ]; then
    echo 'Link exists'
else
    rm "$HOME/.config/neofetch/config.conf"
    ln -s "config.conf" "$HOME/.config/neofetch/config.conf"
fi
