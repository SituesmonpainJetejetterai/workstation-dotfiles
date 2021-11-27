#!/bin/sh

# Check definition of keyword

ckw() {

    # Flags:
    # 1. "-a" to search for matching characters with the complete search scope of the script.
    # 2. "-S" to search specifically for the search query with the complete search scope of the script.
    # 3. "-v" to search specifically for matches in the "vimrc".
    # 4. "-s" to search specifically for scripts with the name matching the characters in the search string.
    # 5. "-f" to search using only the self-concocted "find" scripts.
    # 6. "-t" to search using only the "type" application (will miss mentions in scripts and might not be included in all installations).
    # 7. "-h" to show the "help" function.

    help() {
    printf "\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s" "There are various flags which can be invoked, and can change the output as desired" \
        "The flag \"-a\" is to search for matching characters with the complete search scope of the script." \
        "The flag \"-S\" is to search specifically for the search query with the complete search scope of the script." \
        "The flag \"-v\" is to search specifically for matches in the \"vimrc\"." \
        "The flag \"-V\" is to search for exact matches in the \"vimrc\"." \
        "The flag \"-s\" is to search specifically for scripts with the name matching the characters in the search string." \
        "The flag \"-f\" is to search using only the self-concocted \"find\" and \"grep\" commands." \
        "The flag \"-t\" is to search using only the \"type\" application (will miss mentions in scripts and might not be included in all installations)." \
        "The flag \"-h\"is to show the \"help\" function."
    }

    search_all_fuzzy=0              # Corresponds to "-a"
    search_all=0                    # Corresponds to "-S"
    search_vim=0                    # Corresponds to "-v"
    search_vim_specific=0           # Corresponds to "-V"
    search_scripts=0                # Corresponds to "-s"
    search_from_self=0              # Corresponds to "-f"
    search_with_type=0              # Corresponds to "-t"

    while getopts "aSvVsfth" opts
    do
        case ${opts} in
            a)
                search_all_fuzzy=1
                ;;
            S)
                search_all=1
                ;;
            v)
                search_vim=1
                ;;
            V)
                search_vim_specific=1
                ;;
            s)
                search_scripts=1
                ;;
            f)
                search_from_self=1
                ;;
            t)
                search_with_type=1
                ;;
            h)
                help
                return
                ;;
            \?)
                printf "\n%s" "Invalid character. Exiting..."
                return
                ;;
            ""|*)
                printf "\n%s" "That's not how it works"
                help
                return
                ;;
        esac
    done

    # If no flags are mentioned, go with the default option: search_all=1.
    if [ $OPTIND = 1 ]; then
        search_all=1
    fi

    shift $(($OPTIND - 1))

    search_term="$(for list in "$@"; do : ; done ; printf "%s" "${list}")"
    if [ "${search_all_fuzzy}" = 1 ]; then
        # If a script with those characters in its name exists.
        find "$HOME" -path "*/bin/*" -type f -name "*${search_term}*" -exec less -FXR {} \;
    fi
    if [ "${search_all}" = 1 ]; then
        # If the search query yields a function, alias or file, use type to show it.
        type "${search_term}" | less -FXR 2>/dev/null
        # If a script with the name in the search query exists, display the contents.
        find "$HOME" -path "*/bin/*" -type f -name "${search_term}" -exec less -FXR {} \;
    fi
    if [ "${search_vim}" = 1 ]; then
        # Search for a match in the vimrc.
        grep -HE "remap|command!" "$HOME/.vim/vimrc" | sed "s/\s*\".*//; /^$/d" | grep -n "${search_term}" --colour=always | less -FXR
    fi
    if [ "${search_vim_specific}" = 1 ]; then
        # Search for an exact match in the vimrc.
        grep -HE "remap|command!" "$HOME/.vim/vimrc" | sed "s/\s*\".*//; /^$/d" | grep -wn "${search_term}" --colour=always | less -FXR
    fi
    if [ "${search_scripts}" = 1 ]; then
        # If the search is to be restricted only to user-defied scripts.
        find "$HOME" -path "*/bin/*" -type f -name "*${search_term}*" -exec less -FXR {} \;
    fi
    if [ "${search_from_self}" = 1 ]; then
        # If a script with that name exists.
        find "$HOME" -path "*/bin/*" -type f -name "*${search_term}*" -exec less -FXR {} \;
        # If a function with that name exists.
        grep -n "${search_term}" "$HOME/bin/.bash/.bash_functions.sh" --color=always 2>/dev/null | tr -d "{"
        sed -n "/^${search_term}()/,/^}/p" "$HOME/bin/.bash/.bash_functions.sh" | less -FXR
        # If an alias with that name exists.
        grep -Hwne "alias\s${1}" "$HOME/bin/.bash/.bash_aliases" --color=always 2>/dev/null
    fi
    if [ "${search_with_type}" = 1 ]; then
        # If only "type" is utilised for the search.
        type "${search_term}" | less -FXR 2>/dev/null
    fi
}

ckw "$@"
