# Setting Aliases

## System

alias al='grep -w "alias" ~/.bash/.bash_aliases' ## list all aliases
alias upds='echo -e "\nUpdating package lists\n" && sudo apt update -y && echo -e "\nLooking to upgrade packages\n" && sudo apt upgrade -y && echo -e "\nCleaning up redundant packages/applications\n" && sudo apt autoremove -y' ## updating the system
alias sob='clear && source ~/.bashrc' ## sourcing the .bashrc after update
alias mset='cd $HOME/git-repos/setups' ## move to my favourite directory
alias rset='cd $HOME/git-repos/setups/ && bash setup.sh && cd -' ## setting up and updating tools

## Git

alias gs='git status -sb' ## Checking the git status.
alias ga='git add' ## Add a file to Git.
alias gc='git commit' ## Commit changes to the code.
alias gp='git push -u origin' ## Push to a branch in origin
alias gl='git log --oneline' ## View the logs, each commit in a separate line

## Vim

alias vial='grep -E "noremap|command!" ~/.vim/vimrc | less' ## List all vim remaps

## Tree

alias tree='tree --dirsfirst -F'

## Calendar

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


