" PYTHON SPECIFIC COMMANDS

autocmd!

" Treat all .py files as markdown
autocmd BufNewFile,BufRead *.py set filetype=python

" Linting Python, the vanilla way
setlocal makeprg=pylint

" Automatic execution on :write
autocmd BufWritePost *.py silent make! <afile> | silent redraw!

" Automatic opening of the quickfix window
autocmd QuickFixCmdPost [^l]* cwindow

colorscheme mountaineer-grey 
