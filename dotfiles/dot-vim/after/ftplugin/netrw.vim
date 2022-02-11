" let g:netrw_banner=0                            " Disable netrw's header.
let g:netrw_keepdir = 1                         " Keep the current directory immune from the browsing directory.
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'  " Hide dotfiles on load.
hi! link netrwMarkFile Search                   " Highlight marked files.
