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

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Key map to auto run bash scripts
noremap <silent> <buffer> <F4> :w<CR>:below terminal++rows=15 sh "%"<CR>

" Key map to insert a function
nnoremap <Leader>f i()<Space>{<CR><CR>}<ESC>2ki
