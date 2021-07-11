"molokai-dark theme for Vim

"Set background and reset existing colours
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="molokai-dark"


hi Normal               guifg=#FFFFFF guibg=#000000 gui=NONE      ctermfg=15   ctermbg=16   cterm=NONE
hi Cursor               guifg=bg      guibg=fg                    ctermfg=bg   ctermbg=fg
hi iCursor              guifg=bg      guibg=fg                    ctermfg=bg   ctermbg=fg
hi VisualNOS                          guibg=#403D3D                            ctermbg=238
hi Visual                             guibg=#403D3D                            ctermbg=238
hi CursorLine                         guibg=#1C1C1C gui=NONE                   ctermbg=234  cterm=NONE
hi CursorColumn                       guibg=#1C1C1C                            ctermbg=234

hi Constant             guifg=#AE81FF                             ctermfg=141
 hi String              guifg=#FFDF5F                             ctermfg=221
 hi Character           guifg=#FFDF5F                             ctermfg=221
 hi Number              guifg=#AE81FF                             ctermfg=141
 hi Boolean             guifg=#AE81FF                             ctermfg=141
 hi Float               guifg=#AE81FF                             ctermfg=141

hi Identifier           guifg=#FD971F               gui=NONE      ctermfg=208               cterm=NONE
 hi Function            guifg=#A6E22E                             ctermfg=154

hi Statement            guifg=#F92672                             ctermfg=197
 hi Conditional         guifg=#F92672               gui=bold      ctermfg=197               cterm=bold
 hi Repeat              guifg=#F92672               gui=bold      ctermfg=197               cterm=bold
 hi Label               guifg=#F92672                             ctermfg=197
 hi Operator            guifg=#F92672                             ctermfg=197
 hi Keyword             guifg=#F92672               gui=bold      ctermfg=197               cterm=bold
 hi Exception           guifg=#F92672               gui=bold      ctermfg=197               cterm=bold

hi PreProc              guifg=#A6E22E                             ctermfg=154
 hi Include             guifg=#A6E22E                             ctermfg=154
 hi Define              guifg=#66D9EF                             ctermfg=81
 hi Macro               guifg=#66D9EF                             ctermfg=81
 hi PreCondit           guifg=#A6E22E                             ctermfg=154

hi Type                 guifg=#66D9EF               gui=NONE      ctermfg=81                cterm=NONE
 hi StorageClass        guifg=#FD971F                             ctermfg=208
 hi Structure           guifg=#66D9EF                             ctermfg=81
 hi Typedef             guifg=#66D9EF                             ctermfg=81

hi Special              guifg=#66D9EF                             ctermfg=81
 hi SpecialChar         guifg=#F92672               gui=bold      ctermfg=197               cterm=bold
 hi Tag                 guifg=#F92672                             ctermfg=197
 hi Delimiter           guifg=#8F8F8F                             ctermfg=246
 hi SpecialComment      guifg=#7E8E91               gui=bold      ctermfg=245               cterm=bold
 hi Debug               guifg=#BCA3A3               gui=bold      ctermfg=225               cterm=bold

"Bold and underline matching parens instead of highlighting them.
"This makes it easier to tell the difference between the cursor and the matching paren.
hi MatchParen           guibg=NONE                  gui=underline,bold         ctermbg=NONE cterm=underline,bold

hi Comment              guifg=#7E8E91                             ctermfg=102
hi Todo                 guifg=fg      guibg=bg      gui=bold      ctermfg=fg   ctermbg=bg   cterm=bold
hi Underlined           guifg=NONE                  gui=underline ctermfg=NONE              cterm=underline

hi Directory            guifg=#A6E22E               gui=bold      ctermfg=154               cterm=bold

hi Search               guifg=bg      guibg=#FFE792 gui=NONE      ctermfg=bg   ctermbg=222  cterm=NONE
hi IncSearch            guifg=bg      guibg=#C4BE89 gui=NONE      ctermfg=bg   ctermbg=187  cterm=NONE

hi Folded               guifg=#465457 guibg=bg                    ctermfg=67   ctermbg=bg
hi FoldColumn           guifg=#465457 guibg=bg                    ctermfg=67   ctermbg=bg

hi NonText              guifg=#465457                             ctermfg=239
hi SpecialKey           guifg=#465457                             ctermfg=239

" UI - tab line
hi TabLineFill          guifg=#808080 guibg=#1B1D1E               ctermfg=244  ctermbg=16
hi TabLine              guifg=#808080 guibg=#1B1D1E gui=NONE      ctermfg=244  ctermbg=16   cterm=NONE
hi TabLineSel           guifg=#808080 guibg=#5F6061 gui=bold      ctermfg=244  ctermbg=59   cterm=bold

" UI - window
hi LineNr               guifg=#465457 guibg=#232526               ctermfg=239  ctermbg=235
hi CursorLineNr         guifg=#FD971F guibg=#1C1C1C gui=NONE      ctermfg=208  ctermbg=234  cterm=NONE
hi SignColumn                         guibg=#232526                            ctermbg=235
hi VertSplit            guifg=#808080 guibg=#080808 gui=bold      ctermfg=244  ctermbg=232  cterm=bold
hi ColorColumn                        guibg=#232526                            ctermbg=236

" UI - menus
hi Pmenu                guifg=#66D9EF guibg=bg                    ctermfg=81   ctermbg=bg
hi PmenuSel             guifg=bg      guibg=#808080               ctermfg=bg   ctermbg=244
hi PmenuSbar                          guibg=#080808                            ctermbg=232
hi PmenuThumb           guifg=#66D9EF                             ctermfg=81
hi WildMenu             guifg=#66D9EF guibg=bg                    ctermfg=81   ctermbg=bg

" UI - status line
hi ModeMsg              guifg=#E6DB74                             ctermfg=229
hi MoreMsg              guifg=#E6DB74                             ctermfg=229
hi StatusLine           guifg=#455354 guibg=#dadada               ctermfg=238  ctermbg=253
hi StatusLineNC         guifg=#808080 guibg=#080808               ctermfg=244  ctermbg=232

" UI - messages
hi Error                guifg=fg      guibg=#F92672               ctermfg=fg   ctermbg=197
hi ErrorMsg             guifg=#F92672 guibg=bg      gui=bold      ctermfg=197  ctermbg=bg   cterm=bold
hi WarningMsg           guifg=#FFDF5F guibg=bg      gui=bold      ctermfg=221  ctermbg=bg   cterm=bold
hi Question             guifg=#66D9EF                             ctermfg=81
hi Title                guifg=#FD971F                             ctermfg=208


" Special cases

" vimdiff - use consistent bg color to mark diffs and fg colour for add/remove/change state
if has("diff")
    hi DiffAdd          guifg=#A6E22E guibg=#272822 gui=bold      ctermfg=154  ctermbg=235  cterm=bold
    hi DiffDelete       guifg=#F92672 guibg=#272822 gui=bold      ctermfg=197  ctermbg=235  cterm=bold
    hi DiffChange       guifg=NONE    guibg=#272822               ctermfg=NONE ctermbg=235
    hi DiffText         guifg=#66D9EF guibg=#3b3c36 gui=bold      ctermfg=81   ctermbg=237  cterm=bold
endif

" Git + diff/patch files
hi diffAdded            guifg=#A6E22E guibg=NONE                  ctermfg=154  ctermbg=NONE
hi diffRemoved          guifg=#F92672 guibg=NONE                  ctermfg=197  ctermbg=NONE
hi diffLine             guifg=#00D7AF                             ctermfg=43
hi link diffIndexLine diffLine
hi link diffSubname Normal

" Spell checking
if has("spell")
    hi SpellBad         guisp=#F92672               gui=undercurl              ctermbg=NONE cterm=undercurl
    hi SpellCap         guisp=#FFDF5F               gui=undercurl              ctermbg=NONE cterm=undercurl
    hi SpellLocal       guisp=#FFDF5F               gui=undercurl              ctermbg=NONE cterm=undercurl
    hi SpellRare        guisp=#FFDF5F               gui=undercurl              ctermbg=NONE cterm=undercurl
    if has("patch-8.2.863") " Check for `ctermul` support
        hi SpellBad                                               ctermul=197
        hi SpellCap                                               ctermul=221
        hi SpellLocal                                             ctermul=221
        hi SpellRare                                              ctermul=221
    endif
    " If colored underlines/curls aren't known to be supported set a bg color as a fallback
    if exists("g:molokaidark_undercolor_gui") && !g:molokaidark_undercolor_gui
        hi SpellBad                   guibg=#4A0B22
        hi SpellCap                   guibg=#332C13
        hi SpellLocal                 guibg=#332C13
        hi SpellRare                  guibg=#332C13
    endif
    if !exists("g:molokaidark_undercolor_cterm") || !g:molokaidark_undercolor_cterm
        hi SpellBad                                                            ctermbg=52
        hi SpellCap                                                            ctermbg=58
        hi SpellLocal                                                          ctermbg=58
        hi SpellRare                                                           ctermbg=58
    endif
endif

" Syntastic
hi SyntasticErrorSign   guifg=#F92672 guibg=#232526               ctermfg=197  ctermbg=235
hi SyntasticWarningSign guifg=#FFDF5F guibg=#232526               ctermfg=221  ctermbg=235
"NOTE: The following links are added by Syntastic:
"hi link SyntasticError SpellBad
"hi link SyntasticWarning SpellCap

" vim:cc=24,38,52,66,79,92:tw=0

