# Setting up stuff 

This will be a repository documenting how I set up/will be setting up various things, mostly software. 

Intended for personal use, however it's free to the world, if anybody is looking for a reference.

## Basic setup

Simply symlink all the relevant files and directories to the correct locations, and viola! Everything works.

I've written a script called `setup.sh` which is at the root of this directory. It has the symlink locations hard-coded for now, because that works for me. I'll think about improving it when I get the time.

## The `.profile`

This is a good place to write it. From `stackoverflow`, I came to know that permanent/regularly used bash variables should be stored in `$HOME/.profile`. 

***git variables***

I've started with putting in git credentials as variables (nobody access my PC so no problem). The next step is to replace the `origin` url in the git repositories with the respective username and password variables in the url, so I don't have to keep typing in my `PAT` every time (believe me even caching credentials sucks after a while).
