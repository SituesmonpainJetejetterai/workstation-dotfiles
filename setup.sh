#!/usr/bin/env bash

# Updating the system and installing some applications.

printf "\nUpdating the system, removing vim and installing applications\n\n"
sudo apt update -y && sudo apt upgrade -y
printf "\n"
sudo apt purge vim -y && sudo apt autoremove -y
print "\n"
sudo apt install tmux vim-gtk lynx tree htop git shellcheck pylint python3 less -y
printf "\n"

# if [[ $PWD == ~ ]]; then
    # echo 'Running this script from your home dir is pointless.'
    # exit 1
# fi 

# variable
setup_path="$HOME/git-repos/setups"

# vim setup

printf "\nupdating gruvbox.vim\n"

cd "$setup_path/vim/.vim/colors/" && { curl -sSO https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim; cd - || return; }

printf "\nupdating config in ~/.vim\n"
rm -rf "$HOME/.vim" || rm "$HOME/.vim"
ln -si "$setup_path/vim/.vim" "$HOME"

# tmux setup

printf "\ncopying over the tmux configuration file\n"
ln -sf "$setup_path/tmux/.tmux.conf" "$HOME"

# git setup

printf "\ncopying over the global git config file\n"
ln -sf "$setup_path/git/.gitconfig" "$HOME"

# bash setup

printf "\ncopying over the scripts for bash configuration\n"
cd "$HOME" && ln -sf "$setup_path/bash/.bash" "$HOME" && cd - || return

printf "\nadding lines to ~/.bashrc to source the scripts\n\n"

## Escaping the character ${f} with \ helps to keep its literal value, i.e. outputs it as the string: "${f}"

string=$(cat <<EOT
# ---
## Sourcing fucking everything
for f in $HOME/.bash/.*
do
    if [ ! -d "\${f}" ]; then source "\${f}"; fi
done
EOT
)

grep -qx "$string" "$HOME/.bashrc" || echo "$string" >> "$HOME/.bashrc"
