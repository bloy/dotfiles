
" set runtimepath+=~/.config/.vim
" set runtimepath+=~/.config/.vim/after
colorscheme mike
highlight FoldColumn guibg=darkgrey guifg=white ctermbg=darkgrey ctermfg=white
syntax on

nmap <F2> :w!<CR>:!aspell check %<CR>:e! %<CR>

set fileformats=unix,dos,mac
set backupcopy=yes
set nobackup
set nowritebackup

" viminfo
"   200 files marks, global marks, 50 lines per register, no hlsearch
"   10 search lines, all saved in ~/.viminfo
set viminfo='200,f1,\"50,h,%,/10,:0,@0,n~/.viminfo

" session options
set sessionoptions=buffers,curdir,folds,globals,help,localoptions
set sessionoptions+=options,resize,winpos,slash,unix,winsize

" search options
set incsearch
set hlsearch
set ignorecase
set smartcase
set laststatus=2
set statusline=%f\ %m\ %r%=%y

" editing options
set showmatch
set shiftwidth=2
set softtabstop=2
set foldcolumn=0
set autoindent
set smartindent
filetype indent on
filetype plugin on

" plugin-specific options
let php_sql_query = 1
let php_folding = 1

let CVSCommandEdit = 'split'
