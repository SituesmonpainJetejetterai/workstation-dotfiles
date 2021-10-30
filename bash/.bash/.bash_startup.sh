#!/usr/bin/env sh

# Set the terminal to show colours
export TERM=xterm-256color

# Clear the screen when executing the bash shell. Useful when I'm sourcing the .bashrc
clear

# Showing system information
printf "PUBLIC IP: %s\n" "$(curl -sS ifconfig.me)"
printf "USER: %s\n" "$USER"
printf "TIME: %s\n" "$(date '+%a %d %b %T %Y %Z')"
printf "UPTIME: %s\n" "$(uptime -p)"
printf "CPU: %s\n" "$(lscpu | grep "Model\sname" | sed "s/.*:\s*//")"
printf "CPU Usage: %s\n" "$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')"
printf "KERNEL: %s\n" "$(uname -rms)"
printf "PACKAGES: %s\n" "$(dpkg --get-selections | wc -l)"
printf "MEMORY: %s\n" "$(free -m -h | awk '/Mem/{print $3"/"$2}')"

# Show a custom PS1
output_PS1() {
    git_info() {
        git_branch() {
            # git rev-parse --abbrev-ref HEAD 2>/dev/null | sed -e "s/\(.*\)/(\1)/"
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
            echo "B=$(git_branch) Ch=$(git_changed) C=$(git_commits_ahead)" | sed -e "s/\(.*\)\s\(.*\)\s\(.*\)/(\1; \2; \3)/"
        fi
    }

    error_code() {
        printf "%s" "$?"
    }

    export PS1="\n\[$(tput setab 7)$(tput setaf 1)\]\$(error_code)\[$(tput setab 0)$(tput setaf 3)\] \u\[$(tput setb 0)$(tput setaf 7)\]@\[$(tput setb 2)$(tput setaf 6)\]\h\[$(tput setb 6)$(tput setaf 2)\] in \[$(tput setb 6)$(tput setaf 8)\]\w\[$(tput setaf 1)\] \$(git_info)\n\[$(tput bold)$(tput setaf 4)\]\_$ \[$(tput sgr0)\]"
}
output_PS1

# Set vim keys for bash
set -o vi
