#!/bin/sh

# To last directory
# Link: https://stackoverflow.com/questions/229551/how-to-check-if-a-string-contains-a-substring-in-bash

mtd() {
    # An abbreviation of "Make Today's directory"
    the_date="$(date --rfc-3339=date)"
    printf "\n%s%s" "Making a directory with the name: " "${the_date}"
    mkdir "${the_date}"
    cd "${the_date}" || return
    printf "\n%s" "Want to make a file?: "
    read -r yes_file
    if [ "${yes_file}" = "y" ] || [ "${yes_file}" = "Y" ] || [ "${yes_file}" = "" ]; then
        printf "\n%s" "Enter filename: "
        read -r name
        vim "${name}"
    fi

    printf "\n%s" "Use the alias \"tld\" to enter this directory!"
}

mtd
