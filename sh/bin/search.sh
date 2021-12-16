#!/bin/sh

# Search for text in files inside current folder
# sed G simply appends a newline character followed by the contents of the hold space to the pattern space.
# To search in another directory, give the full path as the second argument
search() {
    help() {
        printf "\n%s\n%s\n%s" "By default, this function searches for matching characters." \
            "If you want to look for an exact match, use the \"-w\" flag" \
            "If you want to specify a location to search in, put that location (directory path) after the search term"
    }

    # Invoke the "help" function when used without flags and arguments
    if [ $# -eq 0 ]; then
        help
        return
    fi

    # Get the argument specified (the logic is that the word required will be the last argument)
    word="$(for list in "$@"; do : ; done ; printf "%s" "${list}")"

    while getopts "wh" opts
    do
        case ${opts} in
            w)
                grep --exclude-dir=".git/" -IHnrw "${word}" --color=always | less -FXR
                ;;
            h)
                help
                return
                ;;
            \?)
                printf "\n%s" "Sorry, wrong flag"
                return
                ;;
            *)
                printf "\n%s" "Sorry, try that again please"
                return
                ;;
        esac
    done

    if [ $OPTIND -eq 1 ]; then
        grep --exclude-dir=".git/" -IHnr "${word}" --color=always | less -FXR
    fi
    shift $((OPTIND-1))
}

search "$@"
