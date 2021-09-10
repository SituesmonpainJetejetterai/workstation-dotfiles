# I aim for this to be an information dump on bash

A primary resource that, perhaps everyone learning `bash` should read: [Bash Reference Manual](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash)

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

#[`xargs: unmatched single quote; by default quotes are special to xargs unless you use the -0 option`](https://www.reddit.com/r/bash/comments/pl1ukb/xargs_unmatched_single_quote_by_default_quotes/)

> Some of the file names found by `find` contained a single quote like in `let's dance.txt`. `xargs` treats quotes special way by default:
> > `xargs` reads items from the standard input, delimited by blanks (which can be protected with double or single quotes ...

> To prevent that behaviour, use `-print0` with `find` and `-0` with`xargs`.
