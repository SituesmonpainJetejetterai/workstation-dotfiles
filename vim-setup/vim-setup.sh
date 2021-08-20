#!/usr/bin/env bash

if [[ $PWD == ~ ]]; then
    echo 'Running this script from your home dir is pointless.'
    exit 1
fi

echo 'If you want to copy .vim/ in ~/.vim, press 1'
echo 'If you want to do a dry run of copying .vim/ into ~/.vim, press 2'
echo 'If you want to copy ~/.vim/ in .vim, press 3'
echo 'If you want to do a dry run of copying ~/.vim/ in .vim, press 4'

read -p "What do you want to do?: " option

case "$option" in 
    "1") rsync -av .vim/ ~/.vim;;
    "2") rsync -anv .vim/ ~/.vim;;
    "3") rsync -av ~/.vim/ .vim;;
    "4") rsync -anv ~/.vim/ .vim;;
    *) echo "You're stupid!";;
esac
