#!/usr/bin/env sh

# Setting functions
## The "$1" parameter takes the first argument passed to the function in the shell as input

# ---


# SYSTEM FUNCTIONS

## File and folder removal all-in-one
rma() {
    if [ "${1}" = "f" ];
    then
        shift
        rm -rf "$@" 2>/dev/null
        rm -f "$@" 2>/dev/null
    else
        rm -rf "$@" 2>/dev/null
        rm -f "$@" 2>/dev/null
    fi
    printf "\n%s\n" "Attempted to delete all files and folders mentioned as arguments"
    ls -a && printf "\n" && find . -maxdepth 1 | wc -l
}

## grep the commands I've put into the shell using a pager to scroll
hg() {
    history | grep "${1}" | less -FX
}

## check if name is already in use as a or an alias
## needs an argument to check the name
## returns file name and line number
ckw() {
    type "${1}" 2>/dev/null | less -FX # Suppress errors, only show output if type "variable" exists
    grep -HEn 'remap|command!' "$HOME/.vim/vimrc" | sed -e 's/\s*\".*//; /^$/d' | grep -w "${1}" | less -FX
}

## search for text in files inside current folder
## `sed G` simply appends a newline character followed by the contents of the hold space to the pattern space.
search() {
        find "${2:-.}" -type f ! -iname ".bash_history" -print0 | xargs -0 -I {} grep -IHnrw "${1}" {} | sed G | less -FX
}

## regex practice
rexp() {
    # grep -hse "\'.*\'" "temp.md"
    printf "\n%s" "Welcome to the regex practice session!\nEnter the path of the file you want to practice on: "
    read -r file
    while true
    do
        printf "\n%s" "Reading input regex syntax: "
        read -r syntax
        grep -hse "${syntax}" "${file}"
    done
}

## count number of lines in all files in a directory(including subdirectories)
## can specify directory, or will act in current directory
cnl() {
    find "${1:-.}" -type f -print | sed 's/.*/"&"/' | xargs  wc -l | less -FX
}

## Move to a directory and show all contents
## If no directory is mentioned, show the $HOME directory
## Link: https://opensource.com/article/19/7/bash-aliases
c() {
    DIR="$*";
    # if no DIR given, go home
    if [ $# -lt 1 ]; then
        DIR=$HOME;
    fi;
    builtin cd "${DIR}" && ls -Fa --color=auto
}

## Change to a directory from anywhere in the FS
cdf() {
    finder() {
        find "$HOME" -name ".git" -prune -o -type d -print
    }
    finder | nl -w 1 -s: | less -FX

    printf "\n%s" "Number for directory: "
    read -r directory
    cd "$(finder | sed -n """$directory"" p")" || return
}

# Find a file
ff() {
    find . -type f -name "*${1}*"
}

# Find a directory

fd() {
    find . -type d -name "*${1}*"
}

# TMUX FUNCTIONS

## start 2 tmux sessions, one for work and another for config
## split the window in the config session horizontally
ts() {
    if [ -z "$TMUX" ]; then
        if tmux has-session 2>/dev/null; then
            tmux a
        else
            printf "\n%s" "session doesn't exist"
            cd ~/git-repos/setups || return
            tmux new -t config -d
            tmux split-window -t config -h
            cd - || return
            tmux new -t work -d
            tmux a -t config
        fi
    else
        printf "\n%s" "Already in a tmux session"
        return
    fi
}

# GIT FUNCTIONS

## Show the git diff in a colourful pager
## If a file is not in the git list of files, use less to show its contents
gd() {
    # If the first argument does not exist
    if [ -z "${1}" ]; then
        git diff .
    else
        # If the file is not new
        if [ -n "$(git ls-files "${1}")" ]; then
            git diff "${1}"
        else
            less -FX "${1}"
        fi
    fi
}

## Merge remote changes with the local branch
## Needs argument specifying the branch
gfm() {
    git fetch origin "${1}" && git merge -s recursive -X theirs origin "${1}"
}

## Forcibly pull remote changes and override local changes
## Needs argument specifying the branch
gdf() {
    printf "\n%s" "Enter branch to reset from. Default is main: "
    read -r branch
    git fetch --all && git reset --hard origin/"${branch:-main}"
}

## Perform the git action on all subdirectories with .git/ in them.
## Help: https://stackoverflow.com/questions/3497123/run-git-pull-over-all-subdirectories
gall() {
    find . -type d -name ".git" -printf "%h: " -prune -exec git --git-dir={} "${1}" \;
    # find . -name ".git" -type d -print | xargs -P10 -I{} git --git-dir={} "${1}"
}

## Delete branch locally and remotely
gdel() {
    git branch -d "${1}" && git push origin --delete "${1}"
}

## Amend commit messages
## Can amend any arbitrary message
## Optionally pushes changes
## Two optional arguments
## Use a number for ${1} to point out which commit message to change
## Use a branch name for ${2} to push to specific branch
gam() {
    # Show the git commits
    git log --oneline

    # Take input
    printf "\n%s" "Change recent, or older commits? Type \"r\" for recent, \"o\" for older: "
    read -r commit

    if [ "${commit}" = "r" ]; then

        # Change the most recent commit
        git commit --amend

    elif [ "${commit}" = "o" ]; then

        # Change an arbitrary number of previous commits
        printf "\n%s" "Number of commits: "

        # Read the number of commit messages to be changed. This number acts as an index for the commits.
        # i.e. We can change the last "n" commit messages

        read -r n

        # Rebase the last "n" commits
        git rebase -i HEAD~"${n}"
    else
        printf "\n%s" "I don't even know what to change\n"

        # Exit the function
        return
    fi

    printf "\n%s" "Do you want to push?: "
    read -r push
    if [ "${push}" = "y" ] || [ "${push}" = "Y" ]; then
        printf "\n%s" "Tell me the remote and branch: "

        # Take multiple inputs for remote and branch
        # In bash, there is an alternative, which is to use the -p flag
        read -r remote branch

        if [ "${commit}" = "r" ]; then

            # The {:-} essentially means that if the argument is not passed/set, use the default value provided
            git push --force-with-lease "${remote:-origin}" "${branch:-main}"

        elif [ "${commit}" = "o" ]; then

            # The {:-} essentially means that if the argument is not passed/set, use the default value provided
            git push --force "${remote:-origin}" "${branch:-main}"
        fi
    else
        printf "\n%s\n" "Not pushed"
        return
    fi
}

## Pull the repository to handle conflicts before staging files
## Adds the files specified (or everything), commits, and pushes automatically.
## Stages selected files if passed as arguments, or stages all changes if no argument is passed.
gacp() {

    # Pull repository before staging files to handle conflicts early
    printf "\n%s" "Remember, rebase only if you have committed all changes. If not, use one of the other options to stash first"
    printf "\n%s\n" "Enter \"r\" to rebase, \"s\" to stash, and \"rs\" to rebase and stash: "
    if read -r track; then
        case "$track" in
            r)
                git pull --rebase
                printf "\n%s" "Just rebasing, please handle conflicting commits if any"
                ;;
            s)
                git stash
                git pull
                git stash apply
                printf "\n%s" "Stashing, performing a pull request and applying stash"
                ;;
            rs|*)
                git pull --rebase --autostash
                printf "\n%s" "Rebasing and stashing"
                ;;
        esac
    fi

    # Set the variable for the while loop
    res="Y"
    while [ "${res}" = "y" ] || [ "${res}" = "Y" ];
    do

        # Function to extract the names of files to be staged
        leftover() {
            git status -sb | sed "s/#.*//; s/M//; s/.*\s//; /^$/d"
        }

        # Show the changed files with line numbers
        printf "\n%s\n" "These are the file(s) which have been changed: "
        leftover | nl -s: | sed -e "s/.*\s//"

        # Choose line numbers to select files to commit. Alternatively, don't choose anything to commit everything
        printf "\n\n%s" "Choose the files you want to stage: "
        read -r files

        if [ -z "${files}" ]; then
            # If no argument specified, add all files
            printf "\n%s\n" "Staging all files"
            git add -A
            leftover
        else
            # Add specified files
            printf "\n%s\n" "Staging specified files"
            for f in ${files}
            do
                # A variable containing the name of the file to be staged
                temp=$(leftover | sed -n "${f}p")
                # Print the name of the file while staging it
                printf "\n%s" "${temp}"
                git add "${temp}"
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

        printf "\n%s" "Do you want to push the changes? Press 'y' or 'Y' to push: "
        read -r yn
        if [ "${yn}" = "y" ] || [ "${yn}" = "Y" ]; then
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
        fi

        printf "\n%s" "Do you want to go again? Enter 'y' or 'Y' to restart the process: "
        read -r res
    done
}

## Git switch function
## Either switch to a new branch with the f argument
## Or switch to an existing branch
gw() {
    if [ -z "${2}" ]; then
        git switch "${1}"
    elif [ "${2}" = "f" ]; then
        git switch -c "${1}"
    else
        printf "\n%s" "Sorry, doesn't work like that"
    fi
}

## View logs and optionally clear screen
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

## Remove commit(s) already pushed to remote repository
## Can be used to reset history till particular commit
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

## Restore a file from being staged
gr() {
    git restore --staged "${1}"
}
