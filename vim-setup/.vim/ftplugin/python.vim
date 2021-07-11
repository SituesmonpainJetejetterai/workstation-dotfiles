" PYTHON SPECIFIC COMMANDS

autocmd!

" Treat all .py files as markdown
autocmd BufNewFile,BufRead *.py set filetype=python

" Linting Python, the vanilla way
setlocal makeprg=pylint\ --help-msg=missing-module-docstring

" Automatic execution on :write
autocmd BufWritePost *.py silent make! <afile> | silent redraw!

" Automatic opening of the quickfix window
autocmd QuickFixCmdPost [^l]* cwindow

" Set the colour scheme
" Copied the molkai-dark colour scheme from: https://raw.githubusercontent.com/pR0Ps/molokai-dark/master/colors/molokai-dark.vim
" make a new file 'molokai-dark.vim' in the folder '.vim/colors'
colorscheme molokai-dark 
