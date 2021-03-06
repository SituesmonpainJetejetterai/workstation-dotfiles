#!/bin/sh

# Set the terminal to show colours
export TERM=xterm-256color

# Clear the screen when executing the bash shell. Useful when I'm sourcing the .bashrc
clear

# Start TMUX if not in it already
if [ -z "$TMUX" ]; then
    if tmux has-session 2>/dev/null; then
        # Attach to session
        tmux a
    else
        tmux new
    fi
fi

# Showing system information
printf "%s%s\n" "PUBLIC IP: " "$(curl -sS ifconfig.me)"
printf "%s%s\n" "PRIVATE IP: " "$(hostname -I | awk '{print $1}')"
printf "%s%s\n" "USER: " "${USER}"
printf "%s%s\n" "TIME: " "$(date '+%a %d %b %T %Y %Z')"
printf "%s%s\n" "UPTIME: " "$(uptime -p)"
printf "%s%s\n" "CPU: " "$(lscpu | grep "Model\sname" | sed "s/.*:\s*//")"
printf "%s%s\n" "CPU USAGE: " "$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')"
printf "%s%s\n" "KERNEL: " "$(uname -rms)"
printf "%s%s\n" "PACKAGES: " "$(dpkg --get-selections | wc -l)"
printf "%s%s\n" "MEMORY: " "$(free -m -h | awk '/Mem/{print $3"/"$2}')"
printf "%s%s%s\n" "\$PATH contains " "\$HOME/bin: " "$(if $(printf "%s" "$PATH" | grep -q "$HOME/bin"); then printf "%s" "Yes"; else printf "%s" "No"; fi)"

# Show a custom PS1
output_PS1() {
    git_info() {
        git_branch() {
            git rev-parse --abbrev-ref HEAD 2>/dev/null
        }

        git_changed() {
            git status -s | wc -l
        }

        git_remote() {
            git config --get branch."$(git_branch)".remote
        }

        git_commits_ahead() {
            git rev-list --count "$(git_branch)" --not "$(git_remote)"/"$(git_branch)" 2>/dev/null
        }

        if [ -n "$(git_branch)" ] && [ -n "$(git_commits_ahead)" ]; then
            printf "%s%s%s%s%s%s%s%s" "{" "B=" "$(git_branch)" "; F=" "$(git_changed)" "; C=" "$(git_commits_ahead)" "}"
        fi
    }

    error_code() {
        printf "%s" "$?"
    }

    export PS1="\n\[$(tput setab 7)$(tput setaf 1)\]\$(error_code)\[$(tput setab 0)$(tput setaf 3)\] \u\[$(tput setb 0)$(tput setaf 7)\]@\[$(tput setb 2)$(tput setaf 6)\]\h\[$(tput setb 6)$(tput setaf 2)\] in \[$(tput setb 6)$(tput setaf 5)\]\w\[$(tput setaf 1)\] \$(git_info)\n\[$(tput bold)$(tput setaf 4)\]???$ \[$(tput sgr0)\]"
}
output_PS1

# Set Tabs
tabs -p

# Set vim keys for bash
set -o vi
