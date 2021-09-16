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
    autocmd QuickFixCmdPost [^l]* vertical cwindow|vert resize +40

augroup END

" To comment
vnoremap <F3> :norm I#<Space><CR>

" And, to uncomment
vnoremap <F4> :norm ^xx<CR>

" map <F5> to run python files
nnoremap <buffer> <F5> :update<CR>:below terminal++rows=15 python3 "%"<CR>

" Remap to auto-write a function
nnoremap <silent> <Leader>f idef<Space><Space>():<ESC>3hi

" Set the status line to show the live word count
set statusline+=\ %f
set laststatus=2
