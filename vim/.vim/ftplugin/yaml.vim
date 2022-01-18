" YAML SPECIFIC COMMANDS

" Link: https://vim.fandom.com/wiki/Errorformat_and_makeprg
if exists("current_compiler")
  finish
endif
let current_compiler = "yamllint"

" Linting YAML
setlocal makeprg=yamllint\ --f\ parsable\ %
setlocal errorformat=%f:%l:\ %m

" Show errors in vertical quickfix window
augroup YAMLquickfix
    autocmd!
    " Automatic execution on :write
    autocmd BufWritePost *.yaml silent make! | silent redraw!
    " Automatic opening of the quickfix window
    autocmd QuickFixCmdPost [^l]* vertical cwindow|vert resize +40
augroup END

" Set up proper indentation
setlocal ts=2
setlocal sts=2
setlocal sw=2
setlocal expandtab

" Set indentation character
let g:indentLine_char = '⦙'
