# Information dump on git

## How to write commit messages

- [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/)
- [Basics of Git and writing good commit messages](https://chaitanyacodes.hashnode.dev/basics-of-git-and-writing-good-commit-messages)
- [How to write a good Git commit message?](https://stackoverflow.com/questions/33097657/how-to-write-a-good-git-commit-message)
- [5.2 Distributed Git - Contributing to a Project](https://git-scm.com/book/en/v2/Distributed-Git-Contributing-to-a-Project)
- [Semantic Commit Messages](https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716)
- [Conventional Commits](https://www.conventionalcommits.org/)

*In summary*, there are a few (mostly) defined types of commits,

- `feat` - for adding a new feature.
- `fix` - for fixing a bug.
- `docs` - changes related to documentation.
- `style` - development related to styling.
- `refactor` - changes that neither fixes a bug or adds a feature.
- `test` - changes related to adding or refactoring existing tests.
- `chore` or `build` - changes related to build tasks or package configs.
- `perf` - performance-related enhancements to the code.
- `misc` - a personal addition to explain "miscellaneous" edits which don't fit.

*Eg*: `git commit -m "feat: add likePost()"`

> A properly formed Git commit subject line should always be able to complete the following sentence:
> If applied, this commit will ___your subject line here___

> Use the body to explain what and why vs. how

It seems that if there is a breaking change in the code-base, use `!` to signify the commit.

## [Git – Config Username & Password – Store Credentials](https://www.shellhacks.com/git-config-username-password-store-credentials)

Store git credentials for each repository in the `~/.git-credentials` file, and never put in your PAT again.

## [How to Change Commit Message In Git](https://www.w3docs.com/snippets/git/how-to-change-commit-message.html)

*Steps*:
- `git rebase -i HEAD~n` (`n` can be any number).
- Replace `pick` with `reword` for the commit messages you want to change.
- Another window will pop up, amend the commit message in that.
- If your local branch is not updated, you need to `git pull` first.
- Then, push it.

## [How do I “git pull” and overwrite my local changes?](https://koukia.ca/how-do-i-git-pull-and-overwrite-my-local-changes-4b6e3a8de955)

- `git fetch --all`
- `git reset <remote>/<branch>` or `git reset --hard <remote>/<branch>`
- If you still want to keep your local changes, simply make a draft branch with your changes, and then `reset` the other branch.

## Handle merge conflicts in git

### `git rebase`

The first option to try and prevent merge conflicts.
It is not the default behaviour of `git pull` (fetch + merge), but it can rewrite history to provide a linear history.
In my case, it only makes sense to use this in a small repository.
I plan to use `git merge` in big repositories to indicate merges between branches (which I don't care about in a small repository).

Basically,
```
git pull --rebase <remote-name> <branch-name>
```

This comment sums it up;
> Careful though, as your commits will no longer be in chronological order. You have effectively rewritten the history, and this can cause a lot of nasty bugs unless you have very good test coverage. Safer to use merge.

### `git stash`

The idea is to first stash the changes (not commits) in a `stash`, pull the remote changes, and then apply the stash on the new HEAD. An easy method would be to,
`git pull --rebase --autostash`
As you can guess, this will `git pull --rebase` and `git stash` automatically. The commands when broken down are below.

Example commands would be,
```
git stash (for unstaged changes)
git pull (pull from remote)
git stash apply (apply all the dirty changes on top of clean tree)
git add
git commit
git push
```
- [`git pull --rebase --autostash` (stackoverflow)](https://stackoverflow.com/a/68232192)
- [git stash to prevent conflicts](https://stackoverflow.com/a/33281802)
- [git stash (git-scm)](https://git-scm.com/docs/git-stash)
- [Where are Git Stashes stored?](https://stackoverflow.com/questions/40653560/where-are-git-stashes-stored)

*Clear git stash(es)*:
- If you want to clear all of your stashes: `git stash clear`.
- If you want to remove only a specific git stash: `git stash drop <stash-id>`.
- To list all git stashes: `git stash list`.

## Current git branch

`git rev-parse --abbrev-ref HEAD`

## Delete recent commit

If you just want to remove a commit and work with it later (unpushed),

`git reset --soft HEAD~<number-of-commits>`

If you want to remove a commit you have already pushed (changing history in the process),

`git reset --hard HEAD~<number-of-commits>` and `git push -f`

## List staged files

`git diff --name-only --cached`

## List untracked files
*Reference*: https://stackoverflow.com/a/3801554

`git ls-files -z --other --exclude-standard`

By extension, to display the "changed" contents of these untracked files,\
`git ls-files -z --other --exclude-standard | xargs -0 -I {} git diff --color -- /dev/null {} | less -FXR 2>/dev/null`
