# I aim for this to be an information dump on bash

- A primary resource that, perhaps everyone learning `bash` should read: [Bash Reference Manual](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash)
- [A very useful `.bashrc` file](https://www.reddit.com/r/commandline/comments/9md3pp/a_very_useful_bashrc_file/)
- [What is your favourite alias that you made?](https://www.reddit.com/r/commandline/comments/pmtnwj/what_is_your_favorite_alias_that_you_made/)
---

# [Quotes and escaping](https://wiki.bash-hackers.org/syntax/quoting)

In summary:

> - **per-character escaping** using a backslash: `\$stuff`
> - **weak quoting** with double-quotes: `"stuff"`
> - **strong quoting** with single-quotes: `'stuff'`

> Bash provides another quoting mechanism: Strings that contain ANSI C-like escape sequences.

# [How to Use $() and ${} Expansions in a Shell Script](https://linuxhint.com/use_expansions_shell_script/)

Basically, use `$()` to substitute bash commands (or functions), and `${}` to substitute a bash variable/parameter.

# [Safety shortcomings in the POSIX shell](https://github.com/matu3ba/dotfiles_skeleton/blob/main/POSIXunsafe)

# [Common and not-so-common `*nix` shell footguns](https://an3223.github.io/blog/20210907_shelldonts.html)

Very informative.

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

`nl`  
`nl -s:`  
`nl -s:" "`  
`nl -n ln`  
`nl -n rz`

And more.

# [How can I make a script take multiple arguments?](https://unix.stackexchange.com/questions/198952/how-can-i-make-a-script-take-multiple-arguments)

> just need to iterate over the `$@` array

# `getopts`

- [parameters and switches in bash script](https://stackoverflow.com/questions/33760956/parameters-and-switches-in-bash-script#33761327)
- [BASH “switch case” in Linux with practical example](https://linuxcent.com/bash-switch-case-in-linux-with-practical-example/)
- [How do I handle switches in a shell script?](https://unix.stackexchange.com/questions/20975/how-do-i-handle-switches-in-a-shell-script)
- [`getopts` - parse utility options](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/getopts.html)
- [Small `getopts` tutorial](https://wiki.bash-hackers.org/howto/getopts_tutorial)
- [An example of how to use `getopts` in bash](https://stackoverflow.com/questions/16483119/an-example-of-how-to-use-getopts-in-bash)

# Change the `PS1`

- [How to Change / Set up bash custom prompt (PS1) in Linux](https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html)
- [How To Change Your PS1 Bash Prompt (And Add Emojis)](https://tynick.com/blog/06-12-2019/how-to-change-your-ps1-bash-prompt-and-add-emojis/)
- [Adding Color and Customize the Bash Prompt (PS1)](https://www.marksanborn.net/linux/adding-color-and-customize-the-bash-prompt-ps1/)
- [PS1 prompt explained for Linux/Unix](https://www.linuxnix.com/linuxunix-shell-ps1-prompt-explained-in-detail/)
- [Bash Shell PS1: 10 Examples to Make Your Linux Prompt like Angelina Jolie](https://www.thegeekstuff.com/2008/09/bash-shell-ps1-10-examples-to-make-your-linux-prompt-like-angelina-jolie/)
