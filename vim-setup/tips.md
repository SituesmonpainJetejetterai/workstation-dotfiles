#### symlink the .vim directory here to a .vim directory in the $HOME directory. Only use this while in the $HOME directory,

`ln -s <path/to/.vim> .vim`


# Instructions to implement a good vim experience.

A good resource to read: https://www.reddit.com/r/vim/wiki/vimrctips

## Reach the ends of a line in vim

Link: Answer: https://stackoverflow.com/questions/105721/how-do-i-move-to-end-of-line-in-vim

- To go the end of the line and edit,
    ```
    <Shift>+a
    ```
- To go the beginning of the file and edit,
    ```
    <Shift>+i
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
- Press <Shift>+>
- To de-indent, press <Shift>+<

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
## To refresh a file

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

## To undo/redo

- undo:
`u`: to undo the changes till the last time in normal mode
- redo:
`cntrl+r`: redo the changes, i.e. undo the undo


