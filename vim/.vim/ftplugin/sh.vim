" Bash Specific customisation

" Bash linting
set makeprg=shellcheck
set errorformat=In\ %f\ line\ %l:

augroup bashSpecific
    autocmd!
    " Automatic execution on :write
    autocmd BufWritePost *.sh silent make! <afile> | silent redraw!
    " Automatic opening of the quickfix window
    autocmd QuickFixCmdPost make vertical cwindow|vertical resize +35

augroup END

" Press to comment
vnoremap <F3> :norm I#<Space><CR>
nnoremap <F3> :norm I#<Space><CR>

" And, to uncomment
vnoremap <F4> :norm ^xx<CR>
nnoremap <F4> :norm ^xx<CR>

" Key mapping to auto run bash scripts
noremap <buffer> <F5> :w<CR>:below terminal++rows=15 bash "%"<CR>

" remap to insert a function
nnoremap <Leader>f ifunction<Space><Space>()<Space>{<CR><CR>}<ESC>2kwhi
