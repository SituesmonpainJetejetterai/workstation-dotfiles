" Vim Specific configuration.
 
" Comment out lines
" The way this works is, get into visual mode
" Select the lines with j and/or k
" press the key which is mapped. Viola!
noremap <F2> :norm I" <CR>
 
" And to uncomment
noremap <F3> :norm ^xx<CR>
