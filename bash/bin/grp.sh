#!/bin/sh

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

grp
