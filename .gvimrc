set guioptions=cgmrL
if has('win32') 
        set guifont=Bitstream_Vera_Sans_Mono:h11
else
        set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
endif
if has('gui_macvim')
        set guifont=Monaco:h14
endif
set lines=43 columns=80

" taglist gui override settings
let Tlist_Close_On_Select = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Inc_Winwidth = 1
let Tlist_Show_Menu = 1
