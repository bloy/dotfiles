" Vim color file
" Maintainer:	Thorsten Maerz <info@netztorte.de>
" Last Change:	2001 Jul 23
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
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

" Console
highlight Normal     ctermfg=LightGrey	ctermbg=Black
highlight Search     ctermfg=Black	ctermbg=Red	cterm=NONE
highlight Visual					cterm=reverse
highlight Cursor     ctermfg=Black	ctermbg=white	cterm=bold
highlight Special    ctermfg=Brown
highlight Comment    ctermfg=Blue
highlight StatusLine ctermfg=darkblue	ctermbg=white	cterm=NONE
highlight Statement  ctermfg=white			cterm=bold
highlight Type						cterm=NONE
