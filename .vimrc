" vim600: set foldmethod=marker:

" general setup  
let s:cur_rtp = &runtimepath
let s:new_rtp = "~/.dotfiles/vim," . s:cur_rtp . ",~/.dotfiles/vim/after"
let &runtimepath = s:new_rtp
if has('win32') 
  set shell=bash.exe
endif

set t_Co=256

call pathogen#infect()
call pathogen#helptags()

" if we're on a GUI or in a good xterm, use the mouse
set mouse=a
set ttymouse=xterm2

" taglist settings
let Tlist_Close_On_Select = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Show_Menu = 1

" supertab
let g:SuperTabDefaultCompletionType = "context"

" python 
let python_highlight_all = 1
let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '[%n]'

" NERDtree
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1

" powerline
let g:Powerline_stl_path_style = 'filename'

map <Leader>tt :TlistToggle<CR>
map <Leader>tn :NERDTreeTabsToggle<CR>

" functions 
function! ReplaceSmartQuotes() " 
  :%s/&/\&amp;/ge " ampersand
  :%s//\&#8216;/ge " left single quote
  :%s//\&#8217;/ge " right single quote
  :%s//\&#8220;/ge " left double quote
  :%s//\&#8221;/ge " right double quote
  :%s//\&#8230;/ge " elipsis
  :%s//\&#8212;/ge " en dash
  :%s//\&#8211;/ge " em dash
endfunction
command! ReplaceSmartQuotes :call ReplaceSmartQuotes() " 


" mappings 
map <F9> :new<CR>:read !git diff<CR>:set syntax=diff buftype=nofile<CR>gg
 
" tab complete
set wildmenu
set wildmode=longest,list:longest

" file information 
set modeline
set fileformats=unix,dos,mac
set backupcopy=yes
set nobackup
set writebackup


" viminfo 
"   200 files marks, global marks, 50 lines per register, no hlsearch
"   10 search lines, all saved in ~/.viminfo
set viminfo='200,f1,\"50,h,/10,:0,@0,n~/.viminfo


" session options  
set sessionoptions=buffers,curdir,folds,globals,help,localoptions
set sessionoptions+=options,slash,unix,winsize


" search options 
set incsearch
set hlsearch
set ignorecase
set smartcase


" editing options 
set laststatus=2
set statusline=%f%m%r%h%w%=%l,%c/%L\ %y%{fugitive#statusline()}%{virtualenv#statusline()}
set showmatch
set shiftwidth=2
set softtabstop=2
set tabstop=8
set expandtab
set autoindent
set smartindent
set cinoptions=(0,W1s
syntax on
set background=dark
colorscheme molokai
filetype indent on
filetype plugin on

if exists('+colorcolumn')
  set colorcolumn=80
endif

let home_wiki = {}
let home_wiki.path = '~/Dropbox/Notes/wiki/'
let home_wiki.path_html = '~/Dropbox/Notes/html/'
let home_wiki.auto_export = 1
let ccap_wiki = {}
let ccap_wiki.path = '~/Dropbox/CCAP/wiki/'
let ccap_wiki.path_html = '~/Dropbox/CCAP/html/'
let ccap_wiki.auto_export = 1

let g:vimwiki_list = [ home_wiki, ccap_wiki ]

let g:tagbar_type_vimwiki = {
      \ 'ctagstype' : 'vimwiki',
      \ 'kinds' : [ 'h:header', ],
      \ 'sort' : 0
      \ }

let g:rails_gem_projections = {
      \ "fabrication": {
      \   "spec/fabricators/*_fabricator.rb": {
      \     "command": "fabricator",
      \     "affinity": "model",
      \     "alternate": "app/models/%s.rb",
      \     "related": "db/schema.rb#%p",
      \     "test": "spec/models/%s_spec.rb",
      \     "template": "Fabricator(:%s) do\nend"}}}
