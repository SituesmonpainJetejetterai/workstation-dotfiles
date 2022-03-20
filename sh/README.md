# I aim for this to be an information dump on bash

- A primary resource that, perhaps everyone learning `bash` should read: [Bash Reference Manual](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash)
- [A very useful `.bashrc` file](https://www.reddit.com/r/commandline/comments/9md3pp/a_very_useful_bashrc_file/)
- [What is your favourite alias that you made?](https://www.reddit.com/r/commandline/comments/pmtnwj/what_is_your_favorite_alias_that_you_made/)
- [Safety shortcomings in the POSIX shell](https://github.com/matu3ba/dotfiles_skeleton/blob/main/POSIXunsafe)
- [Common and not-so-common `*nix` shell footguns](https://an3223.github.io/blog/20210907_shelldonts.html)

Very informative.

---

# [Quotes and escaping](https://wiki.bash-hackers.org/syntax/quoting)

In summary:

> - **per-character escaping** using a backslash: `\$stuff`
> - **weak quoting** with double-quotes: `"stuff"`
> - **strong quoting** with single-quotes: `'stuff'`

> Bash provides another quoting mechanism: Strings that contain ANSI C-like escape sequences.

# [How to Use `$()` and `${}` Expansions in a Shell Script](https://linuxhint.com/use_expansions_shell_script/)

Basically, use `$()` to substitute bash commands (or functions), and `${}` to substitute a bash variable/parameter.


# [What does "{} \;" mean in the find command?](https://askubuntu.com/questions/339015/what-does-mean-in-the-find-command)

`find` has been very important for me, I just pushed a commit where I used it. The `\;` just tells `find` that you have executed the command and `find` can now exit.\
There is another suffix, i.e. `+`, but I haven't used it yet.

## Extra resources:
- [find: missing argument to -exec](https://stackoverflow.com/questions/2961673/find-missing-argument-to-exec)
- [This](https://stackoverflow.com/a/2962015) link shows how to run bash commands using `exec` in `find`. Very impressive.
- The rest of the answers are worthwhile too, I found another showing how to run multiple `exec`s in `find`.

# [`xargs: unmatched single quote; by default quotes are special to xargs unless you use the -0 option`](https://www.reddit.com/r/bash/comments/pl1ukb/xargs_unmatched_single_quote_by_default_quotes/)

> Some of the file names found by `find` contained a single quote like in `let's dance.txt`. `xargs` treats quotes special way by default:
> > `xargs` reads items from the standard input, delimited by blanks (which can be protected with double or single quotes ...

> To prevent that behaviour, use `-print0` with `find` and `-0` with`xargs`.

# What to do when bash shows an error for your function name

`unalias <name>`

This is because on sourcing `.bashrc`, it can only update existing aliases and functions. It does not start from scratch.

# [How to make less paginate only when the input is larger than the screen size?](https://stackoverflow.com/questions/45221266/how-to-make-less-paginate-only-when-the-input-is-larger-than-the-screen-size)

> `mycmd | less -F`

> The `-F` option is nicely combined with `-X` which will skip clearing of the screen before listing (can also have it as a default with `LESS='-FX'`).

# How to suppress errors in bash

Append the command with `2>/dev/null`. Directing to `1>/dev/null` will suppress output (`STDOUT`) while `2>/dev/null` will suppress errors (`STDERR`).

# How to Display Specific Lines of a File in Linux Command Line

`sed -n '<line-number>p' <file/output>`

Can also be used with pipes.

# [Add Line Numbers to Output on Linux Command Line](https://www.putorius.net/nl-command-basic-usage.html)
- `nl`
- `nl -s:`
- `nl -s:" "`
- `nl -n ln`
- `nl -n rz`

And more.

# [How can I make a script take multiple arguments?](https://unix.stackexchange.com/questions/198952/how-can-i-make-a-script-take-multiple-arguments)

> just need to iterate over the `$@` array

# Change the `PS1`

- [How to Change / Set up bash custom prompt (PS1) in Linux](https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html)
- [How To Change Your PS1 Bash Prompt (And Add Emojis)](https://tynick.com/blog/06-12-2019/how-to-change-your-ps1-bash-prompt-and-add-emojis/)
- [Adding Color and Customize the Bash Prompt (PS1)](https://www.marksanborn.net/linux/adding-color-and-customize-the-bash-prompt-ps1/)
- [PS1 prompt explained for Linux/Unix](https://www.linuxnix.com/linuxunix-shell-ps1-prompt-explained-in-detail/)
- [Bash Shell PS1: 10 Examples to Make Your Linux Prompt like Angelina Jolie](https://www.thegeekstuff.com/2008/09/bash-shell-ps1-10-examples-to-make-your-linux-prompt-like-angelina-jolie/)
- [Bash Shell PS1: 10 Examples to Change Your Linux Prompt](https://networkengineer.me/2015/06/17/bash-shell-ps1-10-examples-to-change-your-linux-prompt/)
- [Hack 40. Change the prompt color using tput](https://linux.101hacks.com/ps1-examples/prompt-color-using-tput/)

# `sed`

- To select different elements in the input with `sed`, use `\(.*\)` to partition the input. Then, substitute it with something like `\1`.
    - Example: If I have a string like `origin main`, and I wanted `origin:main`, I'd do `s/\(.*\)\s\(.*\)/\1:\2/`.

# Using flags in shell (`POSIX`)

`getopts` is a `POSIX` defined utility to utilise flags (or switches) with a shell script/command/function and the like.  
`getopts` is generally run in a while loop to iterate over the provided flags and check for each one separately.  
Its behaviour would be easier to explain with an example:
```bash
while getopts ":hb:o:" opt; do
    case ${opt} in
        h)
            help
            ;;
        b)
            name="$OPTARG"
            printf "\n%s" "${name}"
            ;;
        o)
            name="$OPTARG"
            printf "\n%s" "${name}"
            ;;
        :)
            printf "\n%s" "Missing argument: source file to copy"
            exit 1
            ;;
        \?)
            printf "\n%s%s" "Invalid option: " "${OPTARG}"
            exit 1
            ;;
        *)
            printf "\n%s" "You are useless. Try again"
            help
            exit 1
            ;;
    esac
done
```

## Syntax
- The basic syntax of `getopts` is: `getopts optstring name [arg...]`.
- In this example, `optstring` is `:hb:o:`.
- Any flag in the `optstring` which needs an input should be followed by a `:`. For example, `h` is not followed by a colon, while `b` and `o` are, thus they require option-arguments.
- `name` is `opt`.
- The arguments are generally defined while executing the script in the shell (like, name of a file).
- `help` is a function I had used in the original script to show the usage of the script.

## Usage
I will be using this resource (it is honestly amazing how `getopts` is explained in such detail in just one page): [getopts](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/getopts.html)
- The various options in the `case-esac` statement are the choice of flags available to the user.
- The first three options, i.e. `h`, `o` and `b` are the accepted (and defined) flags for this script.
- The rest of the options, i.e. `:`, `\?` and `*` are cases to handle scenarios like "No argument specified", "Invalid option" and "The rest" (in that order).
    - I realise that this part will need some explanation.
    - The case of `$name` (`$opt` in the case of this example) being set to `:` means that, after parsing the available flags, `getopts` encounters a case of missing option-argument, it will set `$OPTARG` to the argument found (note that there is no argument, which means that `$OPTARG` becomes blank). This is not an error, however if you try to print `$OPTARG` you will get a blank line. The relevant quotes from the page mentioned above are:
        - > If an option-argument is missing:
        - > If the first character of optstring is a <colon>, the shell variable specified by name shall be set to the <colon> character and the shell variable OPTARG shall be set to the option character found.
    - If `$name` (`$opt` in this case) is set to `?`, it means that the option character used while executing the script was not found; i.e. it is an illegal character. Note that we need to "escape" the `?`, using `\?` in the `case-esac` statement. The relevant quotes are:
        - > If an option character not contained in the optstring operand is found where an option character is expected, the shell variable specified by name shall be set to the <question-mark> ( '?' ) character. In this case, if the first character in optstring is a <colon> ( ':' ), the shell variable OPTARG shall be set to the option character found, but no output shall be written to standard error
        - > This condition shall be considered to be an error detected in the way arguments were presented to the invoking application, but shall not be an error in `getopts` processing.
    - And for any other case, the `*` is a `case-esac` specific option to handle cases not already defined.
- And on the `$OPTIND` variable;
    - > When the end of options is encountered, the `getopts` utility shall exit with a return value greater than zero; the shell variable `OPTIND` shall be set to the index of the first operand, or the value "$#" +1 if there are no operands; the name variable shall be set to the <question-mark> character. Any of the following shall identify the end of options: the first "--" argument that is not an option-argument, finding an argument that is not an option-argument and does not begin with a '-', or encountering an error.

The search for `getopts` was encouraged by [this](https://www.reddit.com/r/bash/comments/qtmbtg/small_script_to_make_a_backup_file_can_somebody/) Reddit post (and the GitHub gist mentioned in it).

*A few other resources*;

## `getopts`

- [parameters and switches in bash script](https://stackoverflow.com/questions/33760956/parameters-and-switches-in-bash-script#33761327)
- [BASH “switch case” in Linux with practical example](https://linuxcent.com/bash-switch-case-in-linux-with-practical-example/)
- [How do I handle switches in a shell script?](https://unix.stackexchange.com/questions/20975/how-do-i-handle-switches-in-a-shell-script)
- [`getopts` - parse utility options](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/getopts.html)
- [Small `getopts` tutorial](https://wiki.bash-hackers.org/howto/getopts_tutorial)
- [An example of how to use `getopts` in bash](https://stackoverflow.com/questions/16483119/an-example-of-how-to-use-getopts-in-bash)

# Get the last directory from a bunch

`find . -type d | sort | tail -1`

# `regex` info dump

[regular-expressions.info](https://www.regular-expressions.info/tutorial.html)

# Alternative command to get total memory in system

`vmstat -s | grep -G "total\smemory" | sed -e "s/\(.*\)\s\(.\)\s\(.*\)\s\(.*\)/\1/; s/.*\s//"`

# List all files, each in a new line with hyphens replaced by underscores

`ls -a | sed "s/\s+/\n/" | sed "s/\-/\_/g"`
