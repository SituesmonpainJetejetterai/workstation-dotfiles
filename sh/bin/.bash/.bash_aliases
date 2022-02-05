# Setting Aliases

# System

alias upds="sudo apt-get update -y && sudo apt-get full-upgrade -y && sudo apt-get autoremove -y" # Update the system
alias sob="clear && source ~/.bashrc" # Sourcing the .bashrc after update
alias mst="cd $HOME/git-repos/workstation-dotfiles && git status -sb" # Move to my favourite directory, and show git status
alias cl="clear && printf "\"%s\\n\\n\"" "\"$PWD\"" && ls -apF && printf "\"\\n\"" && find . -maxdepth 1 | wc -l" # Clear and list all objects, with the total number of objects
alias la="ls -alt" # Check all files with permissions
alias l="clear && ls -apF --color=auto" # Clear the screen and check all contents of current directory
alias b="cd .." # Go up one directory
alias cdl='cd "$(ls -rt | head -n1)" && ls -apF' # Move to most recently updated directory and show all contents
alias i='sudo apt install "${1}" -y' # Install an application
alias d='sudo apt purge "${1}" -y && sudo apt autoremove -y' # Delete and application and cleanup after
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'" # Use this to look busy when boss comes around
alias als="alias | less -FX" # Show the system list of running aliases with less
alias fns="declare -f | less -FX" # Show the system list of functions with less
alias tp="top && clear" # Show the system monitor and clear when done
alias shut="sudo shutdown now" # Shutdown the machine
alias reboot="sudo reboot now" # Reboot the machine
alias tld="cd \"$(date --rfc-3339=date)\" && ls -apF" # Move to the directory named the current date

# Bash

alias al='grep -w "alias" ~/bin/.bash/.bash_aliases | less -FX' # List all aliases
alias fn='cat ~/bin/.bash/.bash_functions.sh | sed "s/\s*#.*//g; /^$/ d" | less -FX' # List all user-defined functions
alias vb="vim ~/bin/.bash/" # Open the folder to edit bash configuration
alias val="vim ~/bin/.bash/.bash_aliases" # Use vim to edit bash aliases
alias vfn="vim ~/bin/.bash/.bash_functions.sh" # Use vim to edit bash functions
alias vst="vim ~/bin/.bash/.bash_startup.sh" # Use vim to edit the bash startup script

## Aliases to invoke scripts
alias cdf="cdf.sh" # Call "cdf.sh"
alias ckw="ckw.sh" # Call "ckw.sh"
alias rma="rma.sh" # Call "rma.sh"
alias ts="ts.sh" # Call "ts.sh"
alias search="search.sh" # Call "search.sh"
alias keybr="keybr.sh" # Call "keybr.sh", my personal take on keybr.com
alias mtd="mtd.sh" # Call "mtd.sh"
alias mns="mns.sh" # Call "mns.sh"
alias dt="dt.sh" # Call "dt.sh"
alias e="e.sh" # Call "e.sh"

# Git

alias vg="vim ~/.gitconfig" # Edit gitconfig with vim
alias gw="git switch" # Switch to a branch (if new, use the "-c" flag)

## Aliases to invoke scripts
alias gacp="gacp.sh" # Call "gacp.sh"
alias gam="gam.sh" # Call "gam.sh"
alias gfm="gfm.sh" # Call "gfm.sh"
alias gr="gr.sh" # Call "gr.sh"
alias grp="grp.sh" # Call "grp.sh"
alias gdf="gdf.sh" # Call "gdf.sh"
alias gurl="gurl.sh" # Call "gurl.sh"
alias gd="gd.sh" # Call "gd.sh"
alias gs="gs.sh" # Call "gs.sh"

# Vim

alias v="vim" # Start vim with one letter
alias vv="vim ~/.vim/vimrc" # Edit the vimrc
alias vial="sed 's/\s*\".*//; /^$/d' ~/.vim/vimrc | grep -E 'remap|command!' | less -FX" # Show all vim key remaps

# Tmux

alias vt="vim ~/.tmux.conf" # Use vim to edit the tmux config
alias t="tmux -2" # Start with 256 colours as default
alias th="th.sh" # Call "th.sh" (help-text for tmux)

# Tree

alias tree="tree --dirsfirst -F" # Show directories first, with the '/' to represent them

# Ed

alias ed="ed -p:" # Show the semicolon for ed to distinguish between command and insert mode
