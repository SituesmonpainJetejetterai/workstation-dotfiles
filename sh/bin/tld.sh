#!/bin/sh

# To last directory
# Link: https://stackoverflow.com/questions/229551/how-to-check-if-a-string-contains-a-substring-in-bash

tld() {
    # An abbreviation of "the last directory"
    # Either move to the latest directory, or make one
    printf "\n%s" "Would you like to enter the last directory, or make one?: "
    read -r op
    case ${op} in
        n|N|y|Y|e|"")
            cd "$(find . -type d | sort | tail -1)" || return
            ;;
        m|M|c|C)
            the_date="$(date --rfc-3339=date)"
            mkdir "${the_date}"
            cd "${the_date}" || return
            printf "\n%s" "Want to make a file?: "
            read -r yes_file
            if [ "${yes_file}" = "y" ] || [ "${yes_file}" = "Y" ] || [ "${yes_file}" = "" ]; then
                printf "\n%s" "Enter filename: "
                read -r name
                vim "${name}"
            fi
            ;;
        *)
            printf "\n%s" "Do that again please"
            ;;
    esac
}

tld
