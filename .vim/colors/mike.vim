" Vim color file

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
colorscheme default
let g:colors_name = "mike"

"highlight Normal     ctermfg=LightGrey	ctermbg=Black
highlight Search     ctermfg=Black	ctermbg=Red	cterm=NONE
highlight Visual					cterm=reverse
highlight Cursor     ctermfg=Black	ctermbg=white	cterm=bold
highlight Special    ctermfg=Brown
highlight Comment    ctermfg=Blue
highlight Statement  ctermfg=white			cterm=bold
highlight Type						cterm=NONE
highlight FoldColumn ctermbg=darkgrey ctermfg=white

highlight StatusLine ctermfg=darkblue ctermbg=lightgrey cterm=NONE
highlight StatusLineNC ctermfg=darkgrey ctermbg=lightgrey cterm=NONE
highlight VertSplit cterm=reverse
