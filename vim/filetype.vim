" my filetype file

if exists("did_load_filetypes")
  finish
endif

" use CSS completion for scss files
autocmd FileType scss set omnifunc=csscomplete#CompleteCSS

augroup filetypedetect
  au! BufRead,BufNewFile *.ifm	setfiletype ifm
augroup END
