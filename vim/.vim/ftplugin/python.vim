" PYTHON SPECIFIC COMMANDS

" Link: https://vim.fandom.com/wiki/Errorformat_and_makeprg
if exists("current_compiler")
  finish
endif
let current_compiler = "pylint"

" Using the in-built compiler support for pylint to lint python
compiler pylint

" Make and display errors for Python
augroup Lintpy
    autocmd!
    " Automatic execution on :write
    autocmd BufWritePost *.py silent make! <afile> | silent redraw!
    " Automatic opening of the quickfix window
    autocmd QuickFixCmdPost [^l]* vertical cwindow | vert resize +40
augroup END

" map <F5> to run python files
nnoremap <silent> <buffer> <F4> :update<CR>:below terminal++rows=15 python3 "%"<CR>

" Remap to auto-write a function
nnoremap <silent> <Leader>f idef<Space><Space>():<ESC>3hi
