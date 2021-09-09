# Information dump on git

## How to write commit messages

*Link1*: https://chris.beams.io/posts/git-commit/<br/>
*Link2*: https://chaitanyacodes.hashnode.dev/basics-of-git-and-writing-good-commit-messages<br/>
*Link3*: https://stackoverflow.com/questions/33097657/how-to-write-a-good-git-commit-message<br/>
*Link4*: https://git-scm.com/book/en/v2/Distributed-Git-Contributing-to-a-Project

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

