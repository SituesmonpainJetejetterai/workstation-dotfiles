#### symlink the .vim directory here to a .vim directory in the $HOME directory. Only use this while in the $HOME directory,

`ln -s <path/to/.vim> .vim`


# Instructions to implement a good vim experience.

A good resource to read: https://www.reddit.com/r/vim/wiki/vimrctips

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

## Comparing two files in Vim

Link: https://unix.stackexchange.com/questions/1386/comparing-two-files-in-vim

- To compare changes in a file 
    ```
    :diffthis
    ```
## To open a new file in a vertical split window

```
:vs path/to/file
```

## To open up `netrw` in a vertical pane

`:Vex`

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

## To undo
- This will only work if `:set nocompatible` is set in the `vimrc`.
- Press `u` to undo changes since the last time you were in normal mode, in the current buffer. 

## To view the buffer for copied text
```
:p
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
## To search

`/`, then type what you want to find

## To search and replace

```
:%s/search/replace/g
```
`%s`: signifies searching the entire contents of the file.
`search`: word to search for
`replace`: word to replace with
`g`: replace in the entire file

## To go to next/previous occurrence of the word

- Either use the search
    - Click <CR> after `/<string>`
    - Use `n` to move to next occurrence
    - Use `N` to move to previous occurrence
- Sometimes, the word is too big and/or complicated
    - Put the cursor on the word
    - Press `*` to move to next occurrence
    - Press `#` to move to previous occurrence

Link for reference: https://stackoverflow.com/questions/6607630/find-next-in-vim

## To undo/redo

- undo:
`u`: to undo the changes till the last time in normal mode
- redo:
`cntrl+r`: redo the changes, i.e. undo the undo
