# Setting up stuff 

This will be a repository documenting how I set up/will be setting up various things, mostly software. 

Intended for personal use, however it's free to the world, if anybody is looking for a reference.

## Basic setup

Simply symlink all the relevant files and directories to the correct locations, and viola! Everything works.

I've written a script called `setup.sh` which is at the root of this directory. It has the symlink locations hard-coded for now, because that works for me. I'll think about improving it when I get the time.

***Where do I `symlink` everything?***

- `.vim/` to `$HOME`
- `.tmux.conf` to `$HOME`
- `.bash/` to `$HOME`

Out of these, only the `~/.bashrc` will need some editing. Get in there and enable the relevant aliases you like.
Then, add in the following lines (assuming you've run `setup.sh` already, or have manually symlinked the directories and files):

```bash
for f in $HOME/.bash/.*
do
    if [ ! -d $f ]; then source "$f"; fi
done
```

Note that `.bash_variables` can store anything, and is basically an alternative to editing the `~/.profile` on your system. I like it that way, because I'm not dependent on the configuration of the OS.


### git variables

I've started with putting in git credentials as variables (nobody access my PC so no problem). The next step is to replace the `origin` url in the git repositories with the respective username and password variables in the url, so I don't have to keep typing in my `PAT` every time (believe me even caching credentials sucks after a while).

Edit: I found [this](https://www.shellhacks.com/git-config-username-password-store-credentials/) link that basically explains how to do what I've done above. Lol
