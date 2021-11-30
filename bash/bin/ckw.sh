#!/bin/sh

word="${1}"

# If a script of that name exists
find "$HOME" -path "*/bin/*" -type f -name "*${word}*" -exec less -FXR {} \; && printf "\n%s%s\n" "${word}" ".sh is a shell script"

# If a function of that name exists in ".bash_functions.sh"
sed -n "/^${word}()/,/^}/p" "$HOME/bin/.bash/.bash_functions.sh" | xargs -0 -I {} printf "\n%s\n%s" "${word} is a function defined in the interactive shell" "{}" 2> /dev/null

# If an alias of that name exists in ".bash_aliases"
grep -Hwne "alias\s${word}" "$HOME/bin/.bash/.bash_aliases" --color=always | xargs -0 -I {} printf "\n%s%s\n" "Alias:~ " "{}" 2> /dev/null
