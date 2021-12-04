#!/bin/sh


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
            y|Y|g|p|"")
                printf "\n%s" "Enter a branch name, or press \"Enter\" to push to the current branch: "
                read -r branch
                if [ "${branch}" = "" ]; then
                    # If branch was not specified
                    git push --force origin "$(git rev-parse --abbrev-ref HEAD)"
                else
                    if [ "${commit}" = "r" ]; then
                        # If the git commit --amend option was used
                        git push --force-with-lease origin "${branch}"
                    elif [ "${commit}" = "o" ]; then
                        # If multiple commits were changed
                        git push --force origin "${branch}"
                    fi
                fi
                ;;
            *)
                printf "\n%s" "Not pushing"
                return
                ;;
        esac
    fi
}

gam
