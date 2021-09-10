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

*Eg*: `git commit -m "feat: add likePost()"`

> A properly formed Git commit subject line should always be able to complete the following sentence:
> If applied, this commit will ___your subject line here___

> Use the body to explain what and why vs. how

It seems that if there is a breaking change in the code-base, use `!` to signify the commit.

## [Change Old Commit Message in GIT](https://codedexterous.medium.com/change-old-commit-message-in-git-3d64ce57be72)

> `git rebase -i HEAD~n`
> Replace n by the number of commits you want to review.
> Replace pick with reword before each commit message you want to change.
> In each resulting commit file, type the new commit message, save the file, and close it.
