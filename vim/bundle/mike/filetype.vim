if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.pt setfiletype html
augroup END

augroup filetypedetect
  au! BufRead,BufNewFile *.groovy setfiletype groovy
augroup END

if did_filetype()
  finish
endif
if getline(1) =~ '^#!.*[/\\]groovy\>'
  setfiletype groovy
endif
