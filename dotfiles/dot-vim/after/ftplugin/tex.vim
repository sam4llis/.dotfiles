set cc=

" Run 'make' asynchronously on file save
let &makeprg='if [ -f Makefile ]; then make; else make -C ..; fi'

" Spell checker
setlocal cole=2
setlocal spell spelllang=en_gb
