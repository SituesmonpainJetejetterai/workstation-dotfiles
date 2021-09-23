# Setting Aliases

## System

alias upds='echo -e "\nUpdating package lists\n" && sudo apt update -y && echo -e "\nLooking to upgrade packages\n" && sudo apt upgrade -y && echo -e "\nCleaning up redundant packages/applications\n" && sudo apt autoremove -y' ## updating the system
alias sob='clear && source ~/.bashrc' ## Sourcing the .bashrc after update
alias dc='cd' ## Type dc instead of cd; no problem
alias sl='ls' ## Type sl instead of ls; no problem
alias mst='cd $HOME/git-repos/setups && git status -sb' ## Move to my favourite directory, and show git status
alias rst='cd $HOME/git-repos/setups/ && bash setup.sh && cd -' ## Setting up and updating tools
alias cl='clear && echo -e "$PWD" && ls -a && printf "\n" && ls -a | wc -l' ## Clear and list all objects, with the total number of objects
alias la='ls -alt' ## Check all files with permissions
alias shrug='echo "¯\_(ツ)_/¯"' ## Shrug; add | pbcopy to copy to clipboard automatically
alias ff='find . -type f -iname' ## Find files in current directory
alias fd='find . -type d -iname' ## Find subdirectories
alias b='cd ..' ## Go up one directory
alias cdl='cd "$(ls -rt | head -n1)" && ls -a' ## Move to most recently updated directory and show all contents
alias si='sudo apt install "${1}" -y' ## Install an application
alias sd='sudo apt purge "${1}" -y && sudo apt autoremove -y' ## Delete and application and cleanup after
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'" ## Use this to look busy when boss comes around

## Bash

alias al='grep -w "alias" ~/.bash/.bash_aliases | less' ## List all aliases
alias fn='cat ~/.bash/.bash_functions.sh | sed "s/\s*#.*//g; /^$/ d" | less -r' ## List all user-defined functions
alias vb='vim ~/.bash/' ## Open the folder to edit bash configuration
alias val='vim ~/.bash/.bash_aliases' ## Use vim to edit bash aliases
alias vfn='vim ~/.bash/.bash_functions.sh' ## Use vim to edit bash functions

## Git

alias vg='vim ~/.gitconfig' ## Edit gitconfig with vim
alias gs='git status -sb' ## Checking the git status.
alias ga='git add' ## Stage a file
alias gaa='git add -A' ## Stage all files
alias gc='git commit' ## Commit changes to the code.
alias gp='git push -u origin' ## Push to a branch in origin
alias gl='git log --oneline' ## View the logs, each commit in a separate line
alias gw='git switch' ## Switch to another, existing branch
alias gwf='git switch -C' ## Switch to a new branch

## Vim

alias v='vim' ## Start vim with one letter
alias vv='vim ~/.vim/vimrc' ## Edit the vimrc
alias vial="sed -e 's/\s*\".*//; /^$/d' ~/.vim/vimrc | grep -E 'remap|command!' | less -r" ## Show all vim key remaps

## Tmux

alias vt='vim ~/.tmux.conf' ## Use vim to edit the tmux config
alias tmux='tmux -2' ## Start with 256 colours as default

## Tree

alias tree='tree --dirsfirst -F' ## Show directories first, with the '/' to represent them

## Calendar: different months of the calendar

alias jan='cal -m 01'
alias feb='cal -m 02'
alias mar='cal -m 03'
alias apr='cal -m 04'
alias may='cal -m 05'
alias jun='cal -m 06'
alias jul='cal -m 07'
alias aug='cal -m 08'
alias sep='cal -m 09'
alias oct='cal -m 10'
alias nov='cal -m 11'
alias dec='cal -m 12'
