#!/bin/sh

printf "\\n%s\\n" "This is the current URL"
git remote -v

printf "\\n%s" "Enter the name of the account which will interact with this git repository: "
read -r name

printf "\\n%s" "Enter the PAT: "
read -r PAT

printf "\\n%s" "Changing the URL to include the name and the PAT"
repo_name="$(basename "$(git config --get remote.origin.url)")"
git remote set-url origin https://"${name}":"${PAT}"@github.com/"${name}"/"${repo_name}"

printf "\\n%s\\n" "This is the new URL: "
git remote -v

printf "\\n%s" "Enter the email of the account interacting with this repository: "
read -r email

git config user.name "${name}"
git config user.email "${email}"

printf "\\n%s" "Name and email configured for this repository"
