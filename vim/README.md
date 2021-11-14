# Instructions to implement a good vim experience.

A good resource to read: https://www.reddit.com/r/vim/wiki/vimrctips

# `statusline`

When you want to evaluate an expression with spaces/characters/etc, wrap it inside a `%(%)`. i.e.`%(%{expression}%)`. This let me use padding in my `statusline` for git-branch updates.


---

# Toggle numbers

`:set inv<command>`

# Lines

## Reach the ends of a line in vim

Link: Answer: https://stackoverflow.com/questions/105721/how-do-i-move-to-end-of-line-in-vim

- To go the end of the line and edit,
    ```
    A
    ```
- To go the beginning of the file and edit,
    ```
    I
    ```
- To get to the beginning of the line,
    ```
    0
    ```
- To get to the first non-whitespace character,
    ```
    ^
    ```
- To get to the end of a line,
    ```
    $
    ```
## Indent multiple lines

- Enter visual mode.
- Select lines.
- Press `>`
- To de-indent, press `<`

## Put a space between lines in normal mode

`o` to put a space below the line
`O` to put a space above the line

Both will take you to insert mode.

## Edit at the end of a word

`a`

## Capitalise/lowercase the first letter

`b~`

## To edit/work with text inside a "block"

`<command>ib`

`<command>` could be anything. For example, I can use a key remap to delete surrounding brackets if I delete the first bracket in the pair. The command for that would be `yibvabp` which would first copy the content inside the block, then visually select the entire block, then copy the contents on the text containing the brackets, so in essence the brackets would get deleted (although I no longer use this, I have a better key-remap).
---


# Files

## Moving to various parts of a file

To move to the beginning of the visible area of the file, `H`.\
To move to the middle of the visible area of the file, `M`.\
To move to the end of the visible area of the file, `L`.

## Comparing two files in Vim

*Link*: https://unix.stackexchange.com/questions/1386/comparing-two-files-in-vim

- To compare changes in a file 
    ```
    :diffthis
    ```

## To open up `netrw` in a vertical pane

`:Vex`

## To open a new file in a vertical split window

```
:vs path/to/file
```

## To refresh a file

The best way to actually refresh changes would be `so %`. If you're working with a new file, you'll probably do `so <file>`.

## To edit a file in vim

```
:e
```
*or to be forceful*

```
:e!
```

## To quit and save & quit a file

In normal mode, to quit without saving;
```
ZQ
```

In normal mode, to save and quit;
```
ZZ
```

## To see the recently edited (or opened) files

`:browse oldfiles`

## To undo/redo

- undo:
`u`: to undo the changes till the last time in normal mode
- redo:
`cntrl+r`: redo the changes, i.e. undo the undo


---


# Search

## To view the buffer for copied text

`:p`

## To copy lines between vim and another application 

This requires the use of the system clipboard. On `*nix` systems, that's the X11 clipboard. Because in most server environments, vim is not installed with the clipboard feature enabled (by the package manager), I needed to find an alternative.

For now, temporarily, `tmux` to the rescue.

However, for `tmux` doesn't really discriminate about what's on the screen, i.e. even my line numbers are copied along with the text, making it a hot mess.

Simply `:set nonu nornu` to switch off all line numbers.\
Copy text (and refactor it to an extent)\
Type `:set nu rnu` to bring back both types of line numbers.

I have also commented out some key mappings in the `vimrc` in case I get vim with the system clipboard flag enabled.

## To search

`/`, then type what you want to find

## To search and replace in normal mode

```
:%s/search/replace/g
```
`%s`: signifies searching the entire contents of the file.
`search`: word to search for
`replace`: word to replace with
`g`: replace in the entire file

## To search and replace in visual mode

`:s/search/replace/g` to search and replace text in selected lines.

*Example*;\
**To capitalise the first letter of the first word in a sentence**: `'<,'>:s/^./\U&/`
- The `^.` signifies the first letter of the first word at the beginning of the line.
    - Say I wanted to capitalise the first letter of the first word in a comment (signified with a `#\s`), I'd do `'<,'>:s/^#\s./\U&/`.
- The `U&` is the code to capitalise the part highlighted in the search. I escape it because stackoverflow said so.

## To go to next/previous occurrence of the word

- Either use the search
    - Click <CR> after `/<string>`
    - Use `n` to move to next occurrence
    - Use `N` to move to previous occurrence
- Sometimes, the word is too big and/or complicated
    - Put the cursor on the word
    - Press `*` to move to next occurrence
    - Press `#` to move to previous occurrence

*Link for reference*: https://stackoverflow.com/questions/6607630/find-next-in-vim


---


# Errors

## `errorformat` or `efm`

It is important to set up the right `errorformat` or the quickfix window won't open, even if there are errors. There are 2 main steps to get errors to show up in the quickfix window:

- Set `makerpg` properly, and install the linter/checker.
- Set the `errorformat` properly, so the `:cwindow` will open automatically, because vim needs to be able to parse the errors.

Check the `python.vim` and `sh.vim` files for examples on `errorformat`.

As for resources, I found a few. The one right below is the most important, as it defines each option that can be used in the `errorformat`. 
- [The error format](http://vimdoc.sourceforge.net/htmldoc/quickfix.html#errorformat) - From the Vim docs (online)

There are some others, like,
- [Errorformats](https://vim.fandom.com/wiki/Errorformats) - Vim Tips Wiki
- [Integrate Pylint and Pychecker support](https://vim.fandom.com/wiki/Integrate_Pylint_and_Pychecker_support) - Vim Tips Wiki
- [Errorformat for java/ant/junit/cygwin/bash](https://vim.fandom.com/wiki/Errorformat_for_java/ant/junit/cygwin/bash) - Vim Tips Wiki
- [Vim errorformat Demystified](https://flukus.github.io/vim-errorformat-demystified.html)


---


# Resources

- [Vim Tips (Revisited)](https://bluz71.github.io/2021/09/10/vim-tips-revisited.html)
