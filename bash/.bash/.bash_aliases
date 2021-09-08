# Setting Aliases

## System aliases

alias upds='sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y' ## updating the system
alias sob='clear && source ~/.bashrc' ## sourcing the .bashrc after update
alias setup='cd $HOME/git-repos/setups/ && bash setup.sh && cd -' ## setting up and updating tools

## Git aliases

alias pullall='ls | xargs -P10 -I{} git -C {} pull' ## Pull all git repositories which are subdirectories to the current directory
alias pushall='ls | xargs -P10 -I{} git -C {} push' ## Push all git repositories which are subdirectories to the current directory
alias gs='git status -sb' ## Checking the git status.
alias ga='git add' ## Add a file to Git.
alias gc='git commit' ## Commit changes to the code.
alias gp='git push -u origin' ## Push to a branch in origin
alias gl='git log --oneline' ## View the logs, each commit in a separate line

## Tree alias

alias tree='tree --dirsfirst -F'

## Calendar aliases

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


