#!/bin/sh

ckw() {

    help() {
        printf "\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n" "There are various flags which can be invoked, and can change the output as desired" \
            "The flag \"-v\" is to search for the word in vim" \
            "The flag \"-s\" is to search for the word in scripts" \
            "The flag \"-f\" is to search for the word in defined functions" \
            "The flag \"-a\" is to search for the word in defined aliases" \
            "The flag \"-A\" is to search for the word in scripts, functions and aliases" \
            "The flag \"-p\" is to show the \$PATH in a easy-to-read manner, in different lines" \
            "The flag \"-h\" is to show the \"help\" function" \
            "Note that not passing any flags is the same as using \"-A\""
    }

    # Invoke the "help" function when used without flags and arguments
    if [ $# -eq 0 ]; then
        help
        return
    fi

    vim_search=0
    script_search=0
    function_search=0
    alias_search=0

    # Get the argument specified (the logic is that the word required will be the last argument)
    word="$(for list in "$@"; do : ; done ; printf "%s" "${list}")"

    while getopts "vsfaAph" opts
    do
        case ${opts} in
            v)
                vim_search=1
                ;;
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
            p)
                printf "%s" "${PATH}" | sed "s/:/\n/g"
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

    if [ "${vim_search}" = 1 ]; then

        # If a match exists in the "vimrc"
        grep -HE "remap|command!" "$HOME/.vim/vimrc" | sed "s/\".*//; /^$/d" | grep -n "${word}" --colour=always | less -FXR
    fi

    if [ "${script_search}" = 1 ]; then

        # If a script of that name exists
        find "$HOME" -path "*/bin/*" -type f -iname "*${word}*" -print -exec less -FXR {} \;
    fi

    if [ "${function_search}" = 1 ]; then

        # If a function of that name exists in ".bash_functions.sh"
        sed -n "/^${word}()/,/^}/p" "$HOME/bin/.bash/.bash_functions.sh" | less -FXR 2>/dev/null
    fi

    if [ "${alias_search}" = 1 ]; then

        # If an alias of that name exists in ".bash_aliases"
        grep -Hwne "alias\s${word}" "$HOME/bin/.bash/.bash_aliases" --color=always | xargs -0 -I {} printf "\n%s\n%s\n" "Alias:~ " "{}" 2>/dev/null
    fi
}

ckw "$@"
