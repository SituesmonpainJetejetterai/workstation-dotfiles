#!/usr/bin/env sh

# Set the terminal to show colours

export TERM=xterm-256color

# Showing system information
clear
cd "$HOME" || return

printf "PUBLIC IP: %s\n" "$(curl -sS ifconfig.me)"
printf "USER: %s\n" "$USER"
printf "TIME: %s\n" "$(date '+%a %d %b %T %Y %Z')"
printf "UPTIME: %s\n" "$(uptime -p)"
printf "CPU: %s\n" "$(lscpu | grep "Model\sname" | sed "s/.*:\s*//")"
printf "CPU Usage: %s\n" "$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')"
printf "KERNEL: %s\n" "$(uname -rms)"
printf "PACKAGES: %s\n" "$(dpkg --get-selections | wc -l)"
printf "MEMORY: %s\n" "$(free -m -h | awk '/Mem/{print $3"/"$2}')"
printf "\n"

# Show the PS1
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

    export PS1="\n\[$(tput setab 7)$(tput setaf 1)\]\$(error_code)\[$(tput setab 0)$(tput setaf 3)\] \u\[$(tput setb 0)$(tput setaf 7)\]@\[$(tput setb 2)$(tput setaf 6)\]\h\[$(tput setb 6)$(tput setaf 2)\] -> \[$(tput setb 6)$(tput setaf 8)\]\w\[$(tput setaf 1)\] \$(git_info)\n\[$(tput bold)$(tput setaf 4)\]\_$ \[$(tput sgr0)\]"
}
output_PS1

# Set vim keys for bash
set -o vi

















# printf "-------------------------------System Information----------------------------"
# printf "Hostname:\t\t"$(hostname)
# printf "uptime:\t\t\t"$(uptime | awk '{print $3,$4}' | sed 's/,//')
# printf "Manufacturer:\t\t"`cat /sys/class/dmi/id/chassis_vendor`
# printf "Product Name:\t\t"`cat /sys/class/dmi/id/product_name`
# printf "Version:\t\t"`cat /sys/class/dmi/id/product_version`
# printf "Serial Number:\t\t"`cat /sys/class/dmi/id/product_serial`
# printf "Machine Type:\t\t"$(vserver=$(lscpu | grep Hypervisor | wc -l); if [ $vserver -gt 0 ]; then echo "VM"; else echo "Physical"; fi)
# printf "Operating System:\t"`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
# printf "Kernel:\t\t\t"`uname -r`
# printf "Architecture:\t\t"`arch`
# printf "Processor Name:\t\t"`awk -F':' '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//'`
# printf "Active User:\t\t"`w | cut -d ' ' -f1 | grep -v USER | xargs -n1`
# printf "System Main IP:\t\t"`hostname -I`
# printf "Public IP:\t\t"`curl -sS ifconfig.me`
# echo ""
# printf "-------------------------------CPU/Memory Usage------------------------------"
# printf "Memory Usage:\t"`free | awk '/Mem/{printf("%.2f%"), $3/$2*100}'`
# printf "Swap Usage:\t"`free | awk '/Swap/{printf("%.2f%"), $3/$2*100}'`
# printf "CPU Usage:\t"`cat /proc/stat | awk '/cpu/{printf("%.2f%\n"), ($2+$4)*100/($2+$4+$5)}' |  awk '{print $0}' | head -1`
# echo ""
# printf "-------------------------------Disk Usage >80%-------------------------------"
# df -Ph | sed s/%//g | awk '{ if($5 > 80) print $0;}'
# echo ""

# set -o vi


