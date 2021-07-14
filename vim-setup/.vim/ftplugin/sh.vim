" Bash Specific customisation

" Adding in the 'comment lines' logic from the other scripts.
" Basically, enter visual mode
" Select the lines you want to comment using j and/or k
" Press the key. Voila!
noremap <F4> :norm I# <CR>

" Key mapping to auto run bash scripts
noremap <buffer> <F5> :w<CR>:vert term bash "%"<CR>
