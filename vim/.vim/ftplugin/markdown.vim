" MARKDOWN SPECIFIC CONFIGURATION

" Specifying fenced-in languages.
let g:markdown_fenced_languages = ['javascript', 'python', 'c', 'ruby', 'sh', 'yaml', 'html', 'vim', 'coffee', 'json', 'diff']

" Spellcheck in British English
setlocal spell spelllang=en_gb complete+=kspell

" Show bold and italics
setlocal conceallevel=2

" Live word count: https://vim.fandom.com/wiki/Word_count
let g:word_count=wordcount().words
function WordCount()
    if has_key(wordcount(),'visual_words')
        let g:word_count=wordcount().visual_words."/".wordcount().words " count selected words
    else
        let g:word_count=wordcount().cursor_words."/".wordcount().words " or shows words 'so far'
    endif
    return g:word_count
endfunction

" Set the status line to show the live word count
set statusline+=\%=\Wordcount:\ %{WordCount()}\ \|\ Modified:\ %{strftime('%T\ %Z')}

" Key remap to insert the date and time as a timestamp
nnoremap dt i<C-R>=strftime("%Y-%m-%d %a %H:%M:%S")<CR><Esc>

" Map k and j to work with wrapped lines
noremap <silent> <buffer> k gk
noremap <silent> <buffer> j gj

" set a colour scheme
" error detection is not working with the default gruvbox scheme
" Neither is it working with badwolf, which I would've liked to use
" colorscheme onedark
