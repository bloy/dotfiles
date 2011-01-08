" vim600: set foldmethod=marker:
" $Id$

" general setup  
let s:cur_rtp = &runtimepath
let s:new_rtp = "~/.dotfiles/.vim," . s:cur_rtp . ",~/.dotfiles/.vim/after"
let &runtimepath = s:new_rtp
if has('win32') 
	set shell=bash.exe
endif

" if we're on a GUI or in a good xterm, use the mouse
set mouse=a


" plugin- and syntax-specific options 
" php 
let php_folding = 1

" python 
let python_highlight_all = 1

" perl 
let perl_fold = 1



" functions 
function! ReplaceSmartQuotes() " 
  :%s/&/\&amp;/ge " ampersand
  :%s/‘/\&#8216;/ge " left single quote
  :%s/’/\&#8217;/ge " right single quote
  :%s/“/\&#8220;/ge " left double quote
  :%s/”/\&#8221;/ge " right double quote
  :%s/…/\&#8230;/ge " elipsis
  :%s/–/\&#8212;/ge " en dash
  :%s/—/\&#8211;/ge " em dash
endfunction
command! ReplaceSmartQuotes :call ReplaceSmartQuotes() " }}}


" mappings 
map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
 

" file information 
set fileformats=unix,dos,mac
set backupcopy=yes
set nobackup
set nowritebackup


" viminfo 
"   200 files marks, global marks, 50 lines per register, no hlsearch
"   10 search lines, all saved in ~/.viminfo
set viminfo='200,f1,\"50,h,/10,:0,@0,n~/.viminfo


" session options  
set sessionoptions=buffers,curdir,folds,globals,help,localoptions
set sessionoptions+=options,resize,winpos,slash,unix,winsize


" search options 
set incsearch
set hlsearch
set ignorecase
set smartcase
set laststatus=2


" editing options 
set statusline=%f\ %m\ %r%h%w%=%l/%L(%P)\ %y
set showmatch
set shiftwidth=8
set softtabstop=8
set expandtab
set autoindent
set smartindent
set cinoptions=(0,W1s
colorscheme mike
syntax on
filetype indent on
filetype plugin on

