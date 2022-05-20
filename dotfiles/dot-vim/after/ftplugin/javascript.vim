" " Add shortcut for quickly running scripts.
" nnoremap <leader>r :w <bar> :vsp +term\ node\ %<cr>

" " Floating REPL.
" nnoremap <buffer> <silent> <C-\><C-r> :call ToggleFloatingTerminal('"node"')<CR>
" tnoremap <silent> <C-\><C-r> <C-\><C-n><C-W>:call ToggleFloatingTerminal()<CR>

" " Floating script.
" nnoremap <buffer> <silent> <localleader>r :w <bar> :call AddTerminal('"node" "<C-r>%"')<CR>
