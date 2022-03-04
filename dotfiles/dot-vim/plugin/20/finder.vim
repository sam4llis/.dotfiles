" Open the active file as a finder window.
command! Finder silent exe '!open ' . expand("%:p:h")
