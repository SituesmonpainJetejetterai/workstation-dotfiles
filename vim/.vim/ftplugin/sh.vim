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
             

" Adding in the 'comment lines' logic from the other scripts.
" Basically, enter visual mode
" Select the lines you want to comment using j and/or k
" Press the key. Voila!
noremap <F3> :norm I#<Space><CR>

" And, to uncomment
noremap <F4> :norm ^xx<CR>

" Key mapping to auto run bash scripts
noremap <buffer> <F5> :w<CR>:below terminal++rows=15 bash "%"<CR>
