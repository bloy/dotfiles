" my filetype file

if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.ifm	setfiletype ifm
augroup END
