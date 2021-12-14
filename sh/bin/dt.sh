#!/bin/sh

# The abbreviation "dt" signifies "date & time"

dt() {
    help() {
        printf "\n%s\n%s\n%s\n%s\n%s" "The flags are: " \
            "\"-d\" for the date" \
            "\"-t\" for the time" \
            "\"-b\" for both" \
            "\"-h\" for help"
    }

    # Variables
    date=0
    time=0

    # Declaring options
    while getopts "dtbh" opts;
    do
        case ${opts} in
            d)
                date=1
                ;;
            t)
                time=1
                ;;
            b)
                date=1
                time=1
                ;;
            h)
                help
                return
                ;;
            *)
                printf "\n%s" "wrong option..."
                return
                ;;
        esac
    done

    if [ "${date}" = 1 ]; then
        date --rfc-3339=date
    fi
    if [ "${time}" = 1 ]; then
        date --rfc-3339=seconds | sed -e "s/\(.*\)\s\(.*\)+\(.*\)/\2 +\3/"
    fi


    # Invoke the "help" function when used without flags and arguments

    if [ $OPTIND -eq 1 ]; then
        help
        return
    fi
    shift $((OPTIND-1))
}

dt "$@"
