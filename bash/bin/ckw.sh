#!/bin/sh

help() {
    printf "\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n" "There are various flags which can be invoked, and can change the output as desired" \
        "The flag \"-v\" is to search for the word in vim" \
        "The flag \"-s\" is to search for the word in scripts" \
        "The flag \"-f\" is to search for the word in defined functions" \
        "The flag \"-a\" is to search for the word in defined aliases" \
        "The flag \"-A\" is to search for the word in scripts, functions and aliases" \
        "The flag \"-h\" is to show the \"help\" function"
}

vim_search=0
script_search=0
function_search=0
alias_search=0

word="$(for list in "$@"; do : ; done ; printf "%s" "${list}")"

while getopts "vsfaAh" opts
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

if [ "${vim_search}" = 1 ]; then

    # If a match exists in the "vimrc"
    grep -HE "remap|command!" "$HOME/.vim/vimrc" | sed "s/\".*//; /^$/d" | grep -n "${word}" --colour=always | less -FXR
fi

if [ "${script_search}" = 1 ]; then

    # If a script of that name exists
    find "$HOME" -path "*/bin/*" -type f -name "*${word}*" -print0 | xargs -0 -r less -FXR
fi

if [ "${function_search}" = 1 ]; then

    # If a function of that name exists in ".bash_functions.sh"
    sed -n "/^${word}()/,/^}/p" "$HOME/bin/.bash/.bash_functions.sh" | less -FXR 2> /dev/null
fi

if [ "${alias_search}" = 1 ]; then

    # If an alias of that name exists in ".bash_aliases"
    grep -Hwne "alias\s${word}" "$HOME/bin/.bash/.bash_aliases" --color=always | xargs -0 -I {} printf "\n%s\n%s\n" "Alias:~ " "{}" 2> /dev/null
fi
