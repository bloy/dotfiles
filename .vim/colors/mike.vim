" Vim color file

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
colorscheme default
let g:colors_name = "mike"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Normal     guifg=Grey80	guibg=Black
highlight Search     guifg=Black	guibg=Red
highlight Visual     guifg=Grey25
highlight Cursor     guifg=Black	guibg=white
highlight Special    guifg=Orange
highlight Comment    guifg=#80a0ff			gui=italic
highlight StatusLine guifg=white	guibg=darkblue
highlight Statement  guifg=white			gui=bold
highlight Type						gui=NONE
highlight FoldColumn guibg=darkgrey guifg=white 
highlight Folded guibg=darkgrey guifg=white

" Console
highlight Search      ctermfg=Black	ctermbg=Red	cterm=NONE
highlight IncSearch					cterm=reverse 
highlight Visual					cterm=reverse
highlight StatusLine  ctermfg=black	ctermbg=cyan	cterm=NONE
highlight StatusLineNC ctermfg=black	ctermbg=lightgrey cterm=NONE
highlight VertSplit   cterm=reverse

highlight Special     ctermfg=Brown
highlight Comment     ctermfg=Blue
highlight Statement   ctermfg=white			cterm=bold
highlight Type						cterm=NONE
highlight FoldColumn  ctermbg=darkgrey	ctermfg=white
highlight Folded      ctermbg=darkgrey  ctermfg=white


