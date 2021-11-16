# Setting up stuff

This will be a repository documenting how I set up/will be setting up various things, mostly software.

Intended for personal use, however it's free to the world, if anybody is looking for a reference.

## Basic setup

Simply `symlink` all the relevant files and directories to the correct locations, and voilà! Everything works.

I've written a script called `setup.sh` which is at the root of this directory. It has the symlink locations hard-coded for now, because that works for me. I'll think about improving it when I get the time.

***Where do I `symlink` everything?***

- `.vim/` to `$HOME`
- `.tmux.conf` to `$HOME`
- `.gitconfig` to `$HOME`
- `bin/` to `$HOME`

No need to worry, `setup.sh` will `symlink` everything and append the text at the end of `~/.bashrc` so that all the relevant files are sourced properly.
