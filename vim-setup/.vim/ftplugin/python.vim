" PYTHON SPECIFIC COMMANDS

" Linting python, the vanilla way
set makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p

set errorformat=%f:%l:\ %m

" Python autocmds
augroup PythonSpecific
    autocmd!
    " Automatic execution on :write
    autocmd BufWritePost *.py silent make! <afile> | silent redraw!
    " Automatic opening of the quickfix window
    autocmd QuickFixCmdPost [^l]* cwindow
augroup END

" Added a keymap to comment a bunch of lines together.
" The way this works is, enter into visual mode by pressing 'v'
" Move the cursor over the lines, either with arrow keys or 'h', 'j', 'k', 'l'
" Finally, type this super short key combination. Viola!
noremap <F3> :norm I#<Space><CR>

" And, to uncomment
noremap <F4> :norm 0xx<CR>

" map <F5> to run python files
noremap <buffer> <F5> :w<CR>:vert term python3 "%"<CR> 
