#!/bin/sh

th() {

    printf "\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n" "The prefix I use for \"tmux\" is \"M-w\"" \
        "\"M-w + k\" will completely terminate any running instance of the server" \
        "\"M-w + '\" will split the window horizontally (i.e. vertical splits)" \
        "\"M-w + \"\" will split the window vertically (i.e. horizontal splits)" \
        "To move up, down, left or right between panes, use \"M-w + k/j/h/l\" (in that order)" \
        "To resize a split pane, use \"M + </_/+/>\"" \
        "Reload tmux configuration using \"M-r\"" \
        "To move forward/back between windows, use \"M + n/p\"" \
        "To kill a window, use \"M-q\"" \
        "To spawn a new window, use \"M-t\"" \
        "To kill a pane, use \"M-x\""
}

th
