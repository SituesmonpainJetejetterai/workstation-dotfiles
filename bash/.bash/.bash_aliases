# Setting Aliases

## System

alias upds='echo -e "\nUpdating package lists\n" && sudo apt update -y && echo -e "\nLooking to upgrade packages\n" && sudo apt upgrade -y && echo -e "\nCleaning up redundant packages/applications\n" && sudo apt autoremove -y' ## updating the system
alias sob="clear && source ~/.bashrc" ## Sourcing the .bashrc after update
alias dc="cd" ## Type dc instead of cd; no problem
alias sl="ls" ## Type sl instead of ls; no problem
alias mst="cd $HOME/git-repos/setups && git status -sb" ## Move to my favourite directory, and show git status
alias rst="cd $HOME/git-repos/setups/ && bash setup.sh && cd -" ## Setting up and updating tools
alias cl='clear && echo -e "$PWD" && ls -a && printf "\n" && find . -maxdepth 1 | wc -l' ## Clear and list all objects, with the total number of objects
alias la="ls -alt" ## Check all files with permissions
alias l="clear && ls -CF" ## Clear the screen and check all contents of current directory
alias shrug='echo "¯\_(ツ)_/¯"' ## Shrug; add | pbcopy to copy to clipboard automatically
alias ff="find . -type f -iname" ## Find files in current directory
alias fd="find . -type d -iname" ## Find subdirectories
alias b="cd .." ## Go up one directory
alias cdl='cd "$(ls -rt | head -n1)" && ls -a' ## Move to most recently updated directory and show all contents
alias i='sudo apt install "${1}" -y' ## Install an application
alias d='sudo apt purge "${1}" -y && sudo apt autoremove -y' ## Delete and application and cleanup after
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'" ## Use this to look busy when boss comes around
alias als="alias | less -FX" ## Show the system list of running aliases with less
alias fns="declare -f | less -FX" ## Show the system list of functions with less

## Bash

alias al='grep -w "alias" ~/.bash/.bash_aliases | less -FX' ## List all aliases
alias fn='cat ~/.bash/.bash_functions.sh | sed "s/\s*#.*//g; /^$/ d" | less -FX' ## List all user-defined functions
alias vb="vim ~/.bash/" ## Open the folder to edit bash configuration
alias val="vim ~/.bash/.bash_aliases" ## Use vim to edit bash aliases
alias vfn="vim ~/.bash/.bash_functions.sh" ## Use vim to edit bash functions

## Git

alias vg="vim ~/.gitconfig" ## Edit gitconfig with vim
alias gr="git restore --staged ${1}" ## Restore a file from being staged
alias gs="git status -sb" ## Checking the git status.
alias gl="git log --oneline && clear" ## View the logs, each commit in a separate line

## Vim

alias v="vim" ## Start vim with one letter
alias vv="vim ~/.vim/vimrc" ## Edit the vimrc
alias vial="sed -e 's/\s*\".*//; /^$/d' ~/.vim/vimrc | grep -E 'remap|command!' | less -FX" ## Show all vim key remaps

## Tmux

alias vt="vim ~/.tmux.conf" ## Use vim to edit the tmux config
alias tmux="tmux -2" ## Start with 256 colours as default

## Tree

alias tree="tree --dirsfirst -F" ## Show directories first, with the '/' to represent them
