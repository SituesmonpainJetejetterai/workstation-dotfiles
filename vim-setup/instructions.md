# Instructions to implement a good vim experience.

A good resource to read: https://www.reddit.com/r/vim/wiki/vimrctips

While I had thought that just keeping a `.vimrc` would be enough, doesn't seem like it.

But, I'm lucky it's actually not much more than that.

I'm going to write a bash script, which will do two things:
- Copy `~/.vimrc` to the `.vimrc` in this folder, which will then be backed up with version control.
- Copy `coffee.vim` to `/usr/share/vim/vim81/syntax/` (using vim81 at the time of writing, change according to version).

This should be enough to get me started on editing Python and Markdown files from the command line, which is my main intention of using vim.

Edit: 

Link for coffee.vim: https://github.com/duythinht/inori/blob/master/colors/inori.vim (don't worry about the name).

## How to reach the end of lines in vim? Even when wrapped?

Answer: https://stackoverflow.com/questions/105721/how-do-i-move-to-end-of-line-in-vim

>Just the `$` (dollar sign) key. You can use `A` to move to the end of the line and switch to editing mode (Append). To jump the last non-blank character, you can press `g` then `_` keys.

>The opposite of `A` is `I` (Insert mode at beginning of line), as an aside. Pressing just the `^` will place your cursor at the first non-white-space character of the line.

## Indent multiple lines quickly in vim

Link: https://stackoverflow.com/questions/235839/indent-multiple-lines-quickly-in-vi/235841

>General Commands
>
>>>   Indent line by shiftwidth spaces
><<   De-indent line by shiftwidth spaces
>5>>  Indent 5 lines
>5==  Re-indent 5 lines
>
>>%   Increase indent of a braced or bracketed block (place cursor on brace first)
>=%   Reindent a braced or bracketed block (cursor on brace)
><%   Decrease indent of a braced or bracketed block (cursor on brace)
>]p   Paste text, aligning indentation with surroundings
>
>=i{  Re-indent the 'inner block', i.e. the contents of the block
>=a{  Re-indent 'a block', i.e. block and containing braces
>=2a{ Re-indent '2 blocks', i.e. this block and containing block
>
>>i{  Increase inner block indent
>><i{  Decrease inner block indent

