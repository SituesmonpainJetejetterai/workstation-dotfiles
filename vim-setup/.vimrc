" BASIC SETUP:

" enter the current millenium
set nocompatible

" enable syntax, plugins (for netrw) and indentation
syntax enable
filetype plugin indent on
set autoindent

" Setting up the tabs from the Vim wiki on reddit
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

" omnifunc settings
au FileType python setl ofu=pythoncomplete#CompletePython

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" MISCELLANEOUS:

" highlight matching [{()}]
set showmatch

" show line numbers
set number

" improve text search inside a file
set incsearch
set hlsearch

" code folding
set foldenable
set foldlevelstart=10
set foldmethod=syntax

" Have lines wrap instead of continue off-screen
set linebreak

" Gives Vim access to a broader range of colours
set termguicolors

" MARKDOWN SPECIFIC CONFIGURATION

" Most distributions will not have a coffee.vim in
" /usr/share/vim/vim$$/syntax/, in which case, you can simply download it from
" here: https://github.com/duythinht/vim-coffee/blob/master/colors/coffee.vim
" It's needed to bring a better colour scheme for .md files

" Specifying fenced-in languages.
let g:markdown_fenced_languages = ['javascript', 'ruby', 'sh', 'yaml', 'javascript', 'html', 'vim', 'coffee', 'json', 'diff']

augroup MarkdownHelp
	autocmd!	
	" Treat all .md files as markdown
        autocmd BufNewFile,BufRead *.md set filetype=markdown
	" Spellcheck in British English
	autocmd FileType markdown setlocal spell spelllang=en_gb
augroup END

" PYTHON SPECIFIC COMMANDS

augroup PythonLinting
	autocmd!
	" Treat all .py files as markdown
	autocmd BufNewFile,BufRead *.py set filetype=python
	" Linting Python, the vanilla way
	autocmd FileType python setlocal makeprg=pylint
	" Automatic execution on :write
	autocmd BufWritePost *.py silent make! <afile> | silent redraw!
	" Automatic opening of the quickfix window
	autocmd QuickFixCmdPost [^l]* cwindow
augroup END

" KEY MAPPINGS
" In order,
" mapped , as the <Leader>
" mapped :q! to ,q
" mapped :wq to ,wq
" mapped :vertical terminal to ,t
" mapped the action to open :help in a vertical tab to ,vh

" copied a command from a reddit comment to invoke the help command with an
" argument, but vertically

" mapped keys to move around windows


let g:mapleader=","

cnoremap <Leader>q :q!<CR>
cnoremap <Leader>wq :wq<CR>
cnoremap <Leader>t :vertical terminal<CR>
cnoremap <Leader>vh :vert help<CR>
command! -nargs=? -complete=help Vh vert help <args>

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
