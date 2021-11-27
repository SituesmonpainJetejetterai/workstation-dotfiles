#!/bin/sh

# Updating the system and installing some applications.

printf "\n%s\n\n" "Updating the system, removing vim and installing applications"
sudo apt update -y && sudo apt-get full-upgrade -y
printf "\n"
sudo apt purge vim -y && sudo apt autoremove -y
printf "\n"
sudo apt install tmux vim-gtk tree htop git shellcheck pylint python3 less curl -y
printf "\n"

# variable
setup_path="$(dirname "$(readlink -f "$0")")"

# vim setup

printf "\n%s\n" "symlinking vim config in ~/.vim"
ln -sf "${setup_path}/vim/.vim" "$HOME"

# tmux setup

printf "\n%s\n" "symlinking the tmux configuration file"
ln -sf "${setup_path}/tmux/.tmux.conf" "$HOME"

# git setup

printf "\n%s\n" "symlinking the global git config file"
ln -sf "${setup_path}/git/.gitconfig" "$HOME"

# bash setup

printf "\n%s\n" "symlinking the scripts for bash configuration"
ln -sf "${setup_path}/bash/bin" "$HOME"

printf "\n%s\n" "adding lines to ~/.bashrc to source the scripts"

## Escaping the character ${f} with \ helps to keep its literal value, i.e. outputs it as the string: "${f}"

string=$(cat <<EOT
# ---
## Sourcing fucking everything
for f in $HOME/bin/.bash/.*
do
    if [ ! -d "\${f}" ]; then source "\${f}"; fi
done
export PATH=$PATH:$HOME/bin
EOT
)

grep -qx "${string}" "$HOME/.bashrc" || echo "${string}" >> "$HOME/.bashrc"
printf "\n%s%s\n" "This is the current path: " "$PATH"
