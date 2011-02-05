set tags+=$HOME/.vim/tags/python.ctags
setlocal shiftwidth=4
setlocal softtabstop=4

python << PATH
import os
import sys
import vim
for p in sys.path:
        if os.path.isdir(p):
                vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
PATH

