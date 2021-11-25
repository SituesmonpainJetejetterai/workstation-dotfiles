# Setting up stuff

This will be a repository documenting how I set up/will be setting up customisations for my linux workstation. It's intended for personal use.

## Basic setup

Simply `symlink` all the relevant files and directories to the correct locations, and voilà! Everything works.

I've written a script called `setup.sh` which is at the root of this directory. ~~It has the symlink locations hard-coded for now, because that works for me. I'll think about improving it when I get the time.~~ Whilst the destination for the `symlink`s are still hardcoded (and I don't know how I can *not hardcode* those), `setup.sh` will now use its absolute path (tested from the `/home` directory), and does not need a hardcoded path.

***Where do I `symlink` everything?***

- `.vim/` to `$HOME`
- `.tmux.conf` to `$HOME`
- `.gitconfig` to `$HOME`
- `bin/` to `$HOME`

No need to worry, `setup.sh` will `symlink` everything and append the text at the end of `~/.bashrc` so that all the relevant files are sourced properly.

*Note: These scripts have been tested on Debian 10 and Ubuntu 20.04, so I assume that these should work well for Debian and its derivatives. I'll include other distros if I need them, later on*.
