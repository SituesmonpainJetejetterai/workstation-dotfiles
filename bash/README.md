# I aim for this to be an information dump on bash

## Quotes and escaping

*Link*: https://wiki.bash-hackers.org/syntax/quoting

In summary:

> - **per-character escaping** using a backslash: `\$stuff`
> - **weak quoting** with double-quotes: `"stuff"`
> - **strong quoting** with single-quotes: `'stuff'`

> Bash provides another quoting mechanism: Strings that contain ANSI C-like escape sequences.

## How to Use $() and ${} Expansions in a Shell Script

*Link*: https://linuxhint.com/use_expansions_shell_script/

Basically, use `$()` to substitute bash commands (or functions), and `${}` to substitute a bash variable/parameter.

## Safety shortcomings in the POSIX shell

*Link*: https://github.com/matu3ba/dotfiles_skeleton/blob/main/POSIXunsafe
