#!/bin/sh

word="${1}"

# If a script of that name exists
find "$HOME" -path "*/bin/*" -type f -name "*${word}*" -print0 | xargs -0 -r less -FXR

# If a function of that name exists in ".bash_functions.sh"
sed -n "/^${word}()/,/^}/p" "$HOME/bin/.bash/.bash_functions.sh" | less -FXR 2> /dev/null

# If an alias of that name exists in ".bash_aliases"
grep -Hwne "alias\s${word}" "$HOME/bin/.bash/.bash_aliases" --color=always | xargs -0 -I {} printf "\n%s\n%s\n" "Alias:~ " "{}" 2> /dev/null
