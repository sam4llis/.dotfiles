" Add shortcut for quickly running scripts.
nnoremap <leader>r :w <bar> :vsp +term\ node\ %<cr>

" Floating console.
nnoremap <buffer> <silent> <localleader>c :call FloatTerminal('"node"')<CR>

" Floating script.
nnoremap <buffer> <silent> <localleader>r :w <bar> :call FloatTerminal('"node" "<C-r>%"')<CR>
