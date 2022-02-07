" Bash Specific customisation

" Link: https://vim.fandom.com/wiki/Errorformat_and_makeprg
if exists("current_compiler")
  finish
endif
let current_compiler = "shellcheck"

" Using the in-built compiler for shellcheck to lint shell scripts
compiler shellcheck

" Show shell errors upon make
augroup Lintsh
    autocmd!
    " Automatic execution on :write
    autocmd BufWritePost *.sh silent make! <afile> | silent redraw!
    " Automatic opening of the quickfix window
    autocmd QuickFixCmdPost [^l]* vertical cwindow | vert resize +40
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Key map to auto run bash scripts
noremap <silent> <buffer> <F4> :w<CR>:below terminal++rows=15 sh "%"<CR>

" Key map to insert a function
nnoremap <Leader>f i()<Space>{<CR><CR>}<ESC>2ki
