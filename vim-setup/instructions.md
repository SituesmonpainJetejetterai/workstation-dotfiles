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
