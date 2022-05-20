" Open the active file in a Finder window.
command! Finder silent exe '!open ' . expand("%:p:h")
