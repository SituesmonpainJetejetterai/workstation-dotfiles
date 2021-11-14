#!/bin/sh

# SYSTEM FUNCTIONS

# File and folder removal all-in-one
rma() {

    # Delete both files and folders, and suppress any errors
    rm -rf "$@" 2>/dev/null
    rm -f "$@" 2>/dev/null
    printf "\n%s\n" "Attempted to delete all files and folders mentioned as arguments"
    # Show the contents of the directory and their number (both files and directories)
    ls -apF && printf "\n" && find . -maxdepth 1 | wc -l
}

# Grep the commands I've put into the shell using a pager to scroll
# Show coloured grep output through less
hg() {
    history | grep "${1}" --color=always | less -FXR
}

# Check definition of keyword
# It checks if the keyword is defined in the interactive shell and in the vimrc
ckw() {
    # Bash functions defined in the interactive shell
    # Supress all errors, display through less if output doesn't fit the screen
    type "${1}" 2>/dev/null | less -FX

    # Show matches from vimrc
    grep -HEn 'remap|command!' "$HOME/.vim/vimrc" | sed -e 's/\s*\".*//; /^$/d' | grep -w "${1}" --color=always | less -FXR
}

# Search for text in files inside current folder
# sed G simply appends a newline character followed by the contents of the hold space to the pattern space.
# To search in another directory, give the full path as the second argument
search() {
        find "${2:-.}" -type f ! -path "*/\.git/*" ! -iname ".bash_history" -print0 | xargs -0 -I {} grep -IHnrw "${1}" {} --color=always | sed G | less -FXR
}

# Regex practice
rexp() {
    # grep -hse "\'.*\'" "temp.md"
    printf "\n%s" "Welcome to the regex practice session!\nEnter the path of the file you want to practice on: "
    read -r file
    while true
    do
        printf "\n%s" "Reading input regex syntax: "
        read -r syntax
        grep -hse "${syntax}" "${file}" --color=auto
    done
}

# Count number of lines in all files in a directory(including subdirectories)
# Can specify directory, or will act in current directory
cnl() {
    find "${1:-.}" -type f -print | sed 's/.*/"&"/' | xargs  wc -l | less -FXR
}

# Move to a directory and show all contents
# If no directory is mentioned, show the $HOME directory
# Link: https://opensource.com/article/19/7/bash-aliases
c() {
    DIR="$*";
    # If no DIR given, go home
    if [ $# -lt 1 ]; then
        DIR=$HOME;
    fi;
    cd "${DIR}" && ls -Fa --color=auto
}

# Change to a directory from anywhere in the FS
cdf() {
    # Find all directories
    finder() {
        find "$HOME" -name ".git" -prune -o -type d -print
    }
    # List all the directories with less
    finder | nl -w 1 -s: | less -FX

    printf "\n%s" "Number for directory: "
    read -r directory

    # Switch to directory
    cd "$(finder | sed -n """${directory}"" p")" || return
}

# Find a file
ff() {
    find . -type f -name "*${1}*" | less -FX
}

# Find a directory
fd() {
    find . -type d -name "*${1}*" | less -FX
}

# TMUX FUNCTIONS

# Start 2 tmux sessions, one for work and another for config
# Split the window in the config session horizontally
ts() {
    # Check for the tmux variable (set when inside tmux)
    if [ -z "$TMUX" ]; then
        if tmux has-session 2>/dev/null; then
            # Attach to session
            tmux a
        else
            printf "\n%s" "session doesn't exist"
            # Switch to directory with git repos
            cd ~/git-repos/setups || return
            # Start tmux and name the window as "config" but don't attach
            tmux new -t config -d
            # Split a window in tmux
            tmux split-window -t config -h
            # Come back to current directory
            cd - || return
            # Create new tmux window called "work"
            tmux new -t work -d
            # Attach to tmux session called config
            tmux a -t config
        fi
    else
        printf "\n%s" "Already in a tmux session"
        return
    fi
}

# GIT FUNCTIONS

# Show the git diff in a colourful pager
# Show both tracked and untracked files
gd() {
    # If the first argument does not exist
    if [ -z "${1}" ]; then
        # Show a diff for the tracked files
        git diff .
        # Show a diff for all the untracked files
        # The first command lists all of the untracked files
        # Which is then piped to another git command which shows the changes in the untracked files
        # Which is piped to less in case the output doesn't fit the screen
        git ls-files -z --other --exclude-standard | xargs -0 -I {} git diff --color -- /dev/null {} | less -FXR 2>/dev/null
    else
        if [ -n "$(git ls-files "${1}")" ]; then
            # Tracked file (part of git repo)
            git diff "${1}"
        else
            # Untracked file (not part of git repo yet)
            git diff --color -- /dev/null "${1}"
        fi
    fi
}

# Merge remote changes with the local branch
# Can merge with remote on current branch, or a specific branch
gfm() {
    printf "\n%s\n" "Merging remote changes with local branch"
    if [ -z "${1}" ]; then
        current_branch="$(git rev-parse --abbrev-ref HEAD)"
        git fetch origin "${current_branch}" && git merge -s recursive -X theirs origin "${current_branch}"
    else
        git fetch origin "${1}" && git merge -s recursive -X theirs origin "${1}"
    fi
}

# Forcibly pull remote changes and override local changes
# Optional argument to specify the branch, otherwise will act on current branch
gdf() {
    printf "\n%s" "Enter branch to reset from. Default is current branch: "
    if read -r branch; then
        git fetch --all && git reset --hard origin/"${branch}"
    else
        current_branch="$(git rev-parse --abbrev-ref HEAD)"
        git fetch --all && git reset --hard origin/"${current_branch:-main}"
    fi
}

# Perform the git action on all subdirectories with .git/ in them.
# Help: https://stackoverflow.com/questions/3497123/run-git-pull-over-all-subdirectories
gall() {
    find . -type d -name ".git" -printf "%h: " -prune -exec git --git-dir={} "${1}" \;
    # find . -name ".git" -type d -print | xargs -P10 -I{} git --git-dir={} "${1}"
}

# Delete branch locally and remotely
gdel() {
    git branch -d "${1}" && git push origin --delete "${1}"
}

# Function to edit commit messages and push them
gam() {
    # Show the git commits
    git log --oneline

    # Take input
    printf "\n%s" "Change recent, or older commits? Type \"r\" for recent, \"o\" for older: "
    if read -r commit; then
        case ${commit} in
            r)
                # Change the most recent commit
                git commit --amend
                ;;
            o)
                # Change a bunch of commits
                printf "\n%s" "How many commits do you want to change?: "
                if read -r n; then
                    git rebase -i HEAD~"${n}"
                fi
                ;;
            *)
                printf "\n%s\n" "I don't even know what to change"
                return
                ;;
        esac
    fi

    printf "\n%s" "Note that this function will push to remote:- origin"
    printf "\n%s" "If you don't want that, exit the function and push manually"
    printf "\n%s" "Press y/Y/g/p to push: "
    if read -r push; then
        case ${push} in
            y|Y|g|p)
                if read -r branch; then
                    if [ "${commit}" = "r" ]; then
                        # If the git commit --amend option was used
                        git push --force-with-lease origin "${branch:-main}"
                    elif [ "${commit}" = "o" ]; then
                        # If multiple commits were changed
                        git push --force origin "${branch:-main}"
                    fi
                else
                    # If branch was not specified
                    git push --force origin "$(git rev-parse --abbrev-ref HEAD)"
                fi
                ;;
            *)
                printf "\n%s" "Not pushing"
                return
                ;;
        esac
    fi
}

# Pull the repository to handle conflicts before staging files
# Adds the files specified (or everything), commits, and pushes automatically.
gacp() {

    # Find files with merge conflicts
    merge_conflict_files(){
        git diff --name-only --diff-filter=U
    }

    # Find files which are still to be committed
    still_to_be_committed(){
        git status -sb | sed "s/#.*//; s/M//; s/.*\s//; /^$/d"
    }

    # Edit files part of a merge conflict
    go_edit() {
        file="$(merge_conflict_files | sed -n "${1}p")"

        if [ -n "$(git ls-files "${file}")" ]; then
            git diff "${file}"
        fi
        vim "${file}"
    }

    # Get the changes from the remote
    get_changes() {
        printf "\n%s\n" "We need to incorporate changes from the remote before pushing our own commits"
        printf "\n%s" "To simply rebase with the remote, press \"r\""
        printf "\n%s" "To stash unstaged changes and apply them after pulling from remote, press \"s\""
        printf "\n%s" "To stash untracked changes, rebase with remote and then apply changes, press \"rs\" (this is the default option)"
        printf "\n%s\n" "To continue without doing anything, press Enter (carriage return)"

        if read -r track; then
            case "${track}" in
                r)
                    printf "\n%s\n" "Just rebasing..."
                    git pull --rebase
                    ;;
                s)
                    printf "\n%s\n" "Stashing changes and pulling from remote"
                    git stash
                    git pull
                    git stash apply
                    ;;
                "")
                    printf "\n%s\n" "Continuing, hope you know what you've done"
                    ;;
                rs|*)
                    printf "\n%s\n" "Stashing and rebasing"
                    git pull --rebase --autostash
                    ;;
            esac
        fi
   }

    do_changes() {
        resume="y"
        while [ "${resume}" = "y" ] || [ "${resume}" = "Y" ];
        do
            printf "\n%s" "If you want to edit a file (in case of a conflict), press \"e\""
            printf "\n%s\n" "If you want to start committing and pushing, press \"c\""
            if read -r option; then
                case "${option}" in
                    e)
                        total=$(merge_conflict_files | wc -l)
                        if [ "${total}" -eq "0" ]; then
                            printf "\n%s\n" "Seems like there are no files with conflicts"
                        else
                            merge_conflict_files | nl -s:
                            printf "\n%s" "Press enter to edit each file one by one, in the order shown."
                            printf "\n%s" "Otherwise, specify the number(s) of the file(s) you want to edit: "
                            read -r numbers
                            if [ -z "${numbers}" ]; then
                                i=1
                                while [ ${i} -le "${total}" ]; do
                                    go_edit "${i}"
                                    i=$(( i + 1 ))
                                done
                            else
                                for n in ${numbers}; do
                                    go_edit "${n}"
                                done
                            fi
                        fi
                        ;;
                    c)
                        still_to_be_committed | nl -s:

                        printf "\n%s" "Enter the number(s) of the file you want to commit: "
                        read -r numbers

                        if [ -z "${numbers}" ]; then
                            # If no argument specified, stage all files by including all numbers
                            printf "\n%s\n" "Staging all files"
                            still_to_be_committed
                            printf "\n%s" "Do you want to see the diff of the changes?: "
                            read -r sd
                            if [ "${sd}" = "y" ] || [ "${sd}" = "Y" ] || [ "${sd}" = "g" ] || [ "${sd}" = "d" ]; then
                                git diff .
                                git ls-files -z --other --exclude-standard | xargs -0 -I {} git diff --color -- /dev/null {} | less -FXR 2>/dev/null
                            fi
                            git add -A
                        else
                            # Add specified numbers
                            printf "\n%s\n" "Staging specified files"
                            for f in ${numbers}
                            do
                                # A variable containing the name of the file to be staged
                                file=$(still_to_be_committed | sed -n "${f}p")
                                # Print the name of the file while staging it
                                printf "\n%s" "${file}"
                                printf "\n%s" "do you want to see the diff of the changes?: "
                                read -r sd
                                if [ "${sd}" = "y" ] || [ "${sd}" = "Y" ] || [ "${sd}" = "g" ] || [ "${sd}" = "d" ]; then
                                    if [ -n "$(git ls-files "${file}")" ]; then
                                        git diff "${file}"
                                    else
                                        git diff --color -- /dev/null "${file}"
                                    fi
                                fi
                                git add "${file}"
                            done
                        fi

                        printf "\n\n%s" "Time for the commit message"
                        printf "\n%s" "If you want to use an editor (vim) for the commit message, press 'v'. Otherwise, simply type the commit message: "
                        read -r op
                        if [ "${op}" = "v" ]; then
                            # Open the text editor (vim in my case) to type the commit message
                            printf "\n%s\n\n" "Opening vim..."
                            git commit
                            printf "\n%s\n" "Closed vim. Check your commit message."
                        else
                            # Type the commit message directly
                            printf "\n%s\n" "Using the given commit message."
                            git commit -m "${op}"
                            printf "\n%s\n" "Closed vim. Check your commit message."
                        fi
                        ;;
                esac
            fi

            printf "\n%s" "Want to go again? Press \"y\" or \"Y\" to repeat: "
            read -r resume

        done
    }

    push_changes() {
        printf "\n%s\n" "Do you want to push? Press \"y\" or \"Y\" to do so: "
        if read -r push; then
            case "${push}" in
                y|Y|"")
                    printf "\n%s" "Enter the remote and the branch to push to. If not provided, the defaults of 'origin' and the current branch will be used: "
                    read -r remote branch
                    if [ -z "${branch}" ];
                    then
                        current_branch="$(git rev-parse --abbrev-ref HEAD)"
                        printf "\nPushing to origin and %s\n" "${current_branch}"
                        git push -u origin "${current_branch}"
                    else
                        printf "\n%s\n" "Pushing changes..."
                        git push -u "${remote:-origin}" "${branch}"
                    fi
                    ;;
                *)
                    printf "\n%s\n" "Not pushing"
                    ;;
            esac
        fi
    }

get_changes
do_changes
push_changes

}


# Git switch function
# Either switch to a new branch with the "f" argument
# Or switch to an existing branch
gw() {
    if [ -z "${2}" ]; then
        git switch "${1}"
    elif [ "${2}" = "f" ]; then
        git switch -c "${1}"
    else
        printf "\n%s" "Sorry, doesn't work like that"
    fi
}

# View logs and optionally clear screen
gl() {
    git log --oneline
    printf "\n%s" "Clear?: "
    if read -r input; then
        case "$input" in
            y|Y|"")
                clear
                ;;
        esac
    fi
}

# Remove commit(s) already pushed to remote repository
# Can be used to reset history till particular commit
grp() {
    printf "\n%s" "Enter the commit till which you want to delete history: "
    read -r commit

    if [ -z "${commit}" ];
    then
        return
    fi

    printf "\n%s" "Enter the branch (default is main): "
    read -r branch

    printf "\n%s" "Enter the remote (default is origin): "
    read -r remote

    git push "${remote:-origin}" +"${commit}":"${branch:-main}"
    printf "\n%s" "Hint: use the function gdf to remove useless commits both locally and remotely"
}

# Restore a staged file
gr() {
    staged_files="$(git diff --name-only --cached)"
    printf "\n"
    printf "%s" "${staged_files}" | nl -s:
    printf "\n%s" "Which files do you want to restore?"
    printf "\n%s" "Enter the number(s) for individual file(s), or press Enter to unstage everything: "
    read -r unstage_files
    if [ -z "${unstage_files}" ]; then
        git restore --staged .
    else
        for i in ${unstage_files};
        do
            git restore --staged "$(printf "%s" "${staged_files}" | sed -n "${i}p")"
        done
    fi
}
