colorscheme mike
syntax on

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

" key mappings
:map <c-w><c-t> :WMToggle<cr>
:map <c-w><c-f> :FirstExplorerWindow<cr>
:map <c-w><c-b> :BottomExplorerWindow<cr>

" plugin-specific options
"" php plugin
let php_sql_query = 0
let php_folding = 1

"" cvscommand
let CVSCommandEdit = 'split'
let CVSCommandDiffOpt = 'u'
let CVSCommandDeleteOnHide = 1

"" winmanager
let persistentBehaviour = 0
