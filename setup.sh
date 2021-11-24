#!/bin/sh

# Updating the system and installing some applications.

printf "\n%s\n\n" "Updating the system, removing vim and installing applications"
sudo apt update -y && sudo apt upgrade -y
printf "\n"
sudo apt purge vim -y && sudo apt autoremove -y
printf "\n"
sudo apt install screen vim-gtk tree htop git shellcheck pylint python3 less curl -y
printf "\n"

# if [[ $PWD == ~ ]]; then
    # echo 'Running this script from your home dir is pointless.'
    # exit 1
# fi

# variable
setup_path="$HOME/git-repos/workstation-dotfiles"

# vim setup

printf "\n%s\n" "updating config in ~/.vim"
ln -sf "${setup_path}/vim/.vim" "$HOME"

# tmux setup

printf "\n%s\n" "copying over the tmux configuration file"
ln -sf "${setup_path}/tmux/.tmux.conf" "$HOME"

# screen setup

printf "\n%s\n" "copying over the screen onfiguration file"
ln -sf "${setup_path}/screen/.screenrc"

# git setup

printf "\n%s\n" "copying over the global git config file"
ln -sf "${setup_path}/git/.gitconfig" "$HOME"

# bash setup

printf "\n%s\n" "copying over the scripts for bash configuration"
ln -sf "${setup_path}/bash/bin" "$HOME/bin"

printf "\n%s\n\n" "adding lines to ~/.bashrc to source the scripts"

## Escaping the character ${f} with \ helps to keep its literal value, i.e. outputs it as the string: "${f}"

string=$(cat <<EOT
# ---
## Sourcing fucking everything
for f in $HOME/bin/.bash/.*
do
    if [ ! -d "\${f}" ]; then source "\${f}"; fi
done
EOT
)

grep -qx "$string" "$HOME/.bashrc" || echo "$string" >> "$HOME/.bashrc"
