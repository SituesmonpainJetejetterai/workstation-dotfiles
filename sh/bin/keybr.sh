#!/bin/sh

printf "\n%s" "Welcome to a keyboard practice session"
printf "\n%s" "Press \"1\" for level 1, \"2\" for level 2, \"3\" for level 3, and \"4\" for level 4: "
if read -r level; then
    case ${level} in
        1)
            while true;
            do
                attempt="$(head /dev/urandom | tr -dc 'a-z' | head -c10)"
                printf "\n%s" "${attempt}"
                printf "\n%s" "Enter: "
                read -r word
                while [ "${word}" != "${attempt}" ];
                do
                    printf "\n%s" "Enter: "
                    read -r word
                done
            done
            ;;
        2)
            while true;
            do
                attempt="$(head /dev/urandom | tr -dc 'A-Za-z' | head -c15)"
                printf "\n%s" "${attempt}"
                printf "\n%s" "Enter: "
                read -r word
                while [ "${word}" != "${attempt}" ];
                do
                    printf "\n%s" "Enter: "
                    read -r word
                done
            done
            ;;
        3)
            while true;
            do
                attempt="$(head /dev/urandom | tr -dc 'A-Za-z0-9'! | head -c15)"
                printf "\n%s" "${attempt}"
                printf "\n%s" "Enter: "
                read -r word
                while [ "${word}" != "${attempt}" ];
                do
                    printf "\n%s" "Enter: "
                    read -r word
                done
            done
            ;;
        4)
            while true;
            do
                attempt="$(head /dev/urandom | tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' | head -c25)"
                printf "\n%s" "${attempt}"
                printf "\n%s" "Enter: "
                read -r word
                while [ "${word}" != "${attempt}" ];
                do
                    printf "\n%s" "Enter: "
                    read -r word
                done
            done
            ;;
        *)
            printf "\n%s" "Nope, exiting..."
            ;;
    esac
fi
