#!/bin/sh

# "e" stands for "Edit", i.e. edit a file/part of a file. I made this because navigating to the "~/bin" directory every time was tiring, and I saw the opportunity to directly edit the function and the alias that I wanted to.
e() {

    # Help function
    help() {
        printf "\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n" "There are various flags which can be invoked, and can change the output as desired" \
            "The flag \"-s\" is to search for a script with that name and edit it" \
            "The flag \"-f\" is to search for the word in defined functions and edit that function" \
            "The flag \"-a\" is to search for the word in defined aliases and edit that alias" \
            "The flag \"-A\" is to search for the word in scripts, functions and aliases, and edit all of them (found)" \
            "The flag \"-h\" is to show the \"help\" function" \
            "Note that not passing any flags is the same as using \"-A\""
    }

    # Variables
    script_search=0
    function_search=0
    alias_search=0

    # Get the argument specified (the logic is that the word required will be the last argument)
    word="$(for list in "$@"; do : ; done ; printf "%s" "${list}")"

    # Defining options
    while getopts "sfaAh" opts
    do
        case ${opts} in
            s)
                script_search=1
                ;;
            f)
                function_search=1
                ;;
            a)
                alias_search=1
                ;;
            A)
                script_search=1
                function_search=1
                alias_search=1
                ;;
            h)
                help
                return
                ;;
            \?)
                printf "\n%s" "Invalid character. Exiting..."
                return
                ;;
            *)
                printf "\n%s" "That's not quite right. Try again."
                return
                ;;
        esac
    done

    # The same behaviour as using "-A" if no flags specified
    if [ $OPTIND -eq 1 ]; then
        script_search=1
        function_search=1
        alias_search=1
    fi
    shift $((OPTIND-1))

    if [ "${script_search}" = 1 ]; then

        # If a script of that name exists
        script="$(find "$HOME" -path "*/bin/*" -type f -name "*${word}*" -print)"
        if [ -f "${script}" ]; then vim "${script}"; else printf "\n%s" "Sorry, script doesn't exist"; fi
    fi

    if [ "${function_search}" = 1 ]; then

        # If a function of that name exists in ".bash_functions.sh"
        vim +"$(grep -Gn "${word}()\s{" "$HOME/bin/.bash/.bash_functions.sh" | sed "s/\:.*//")" "$HOME/bin/.bash/.bash_functions.sh"

        # An alternate method
        # Vim has a search functionality, with which it can first search the file for matches and then open the file to that line.
        # vim +/"${word}"\(\)\ { ~/bin/.bash/.bash_functions.sh
    fi

    if [ "${alias_search}" = 1 ]; then

        # If an alias of that name exists in ".bash_aliases"
        vim +"$(grep -Gn "alias\s${word}=" "$HOME/bin/.bash/.bash_aliases" | sed "s/\:.*//")" "$HOME/bin/.bash/.bash_aliases"
    fi
}

e "$@"
