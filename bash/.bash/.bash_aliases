# Setting Aliases

## System aliases

alias gh='history|grep' ## search command history
alias upds='sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y' ## updating the system
alias sob='clear && source ~/.bashrc' ## sourcing the .bashrc after update
alias setup='cd $HOME/git-repos/setups/ && bash setup.sh && cd $HOME' ## setting up and updating tools

## Git aliases

# alias all='cd %HOME/git-repos && {ls -R -d */.git | sed 's/\/.git//' | xargs -P10 -I{} git -C {} pull} && CD $HOME'
alias pullall='ls | xargs -P10 -I{} git -C {} pull'
alias pushall='ls | xargs -P10 -I{} git -C {} push'
alias gs='git status' ## Checking the git status.
alias ga='git add' ## Add a file to Git.
alias gc='git commit' ## Commit changes to the code.
alias gp='git push -u origin' ## Push to a branch in origin
alias gd='git diff' ## View the difference.

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


