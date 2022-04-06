" MARKDOWN SPECIFIC CONFIGURATION

" Specifying fenced-in languages.
let g:markdown_fenced_languages = ['javascript', 'python', 'c', 'ruby', 'sh', 'yaml', 'html', 'vim', 'json', 'diff']

" Spellcheck in British English
set spell spelllang=en_gb complete+=kspell

" Corrects spelling errors
" Jumps to the previous spelling mistake with [s
" Picks the first suggestion with 1z=
" Jumps back with `]a
" Press 'u' to undo
" Link: https://castel.dev/post/lecture-notes-1/#correcting-spelling-mistakes-on-the-fly
" Press <C+l> to activate
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

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
setlocal statusline+=\%=\Wordcount:\%(\ %{WordCount()}\ %)

" Key remap to insert the date and time as a timestamp
nnoremap dt i<C-R>=strftime("%Y-%m-%d %a %H:%M:%S")<CR><Esc>

" Map k and j to work with wrapped lines
noremap <silent> <buffer> k gk
noremap <silent> <buffer> j gj
