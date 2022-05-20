if !exists("g:loaded_unimpaired") || exists("g:loaded_unimpaired_conf")
  finish
endif
let g:loaded_unimpaired_conf = 1

function! CustomUnimpairedMoveUp(count)
  silent! execute "norm" . a:count . "\<Plug>unimpairedMoveUp=="
  silent! call repeat#set("\<Plug>CustomUnimpairedMoveUp", a:count)
endfunction

function! CustomUnimpairedMoveDown(count)
  silent! execute "norm" . a:count . "\<Plug>unimpairedMoveDown=="
  silent! call repeat#set("\<Plug>CustomUnimpairedMoveDown", a:count)
endfunction

function! CustomUnimpairedMoveSelectionUp(count)
  silent! execute "norm" . a:count . "\<Plug>unimpairedMoveSelectionUp"
  silent! execute "norm gv="
  silent! call repeat#set("\<Plug>CustomUnimpairedMoveSelectionUp", a:count)
endfunction

function! CustomUnimpairedMoveSelectionDown(count)
  silent! execute "norm" . a:count . "\<Plug>unimpairedMoveSelectionDown"
  silent! execute "norm gv="
  silent! call repeat#set("\<Plug>CustomUnimpairedMoveSelectionDown", a:count)
endfunction

noremap <silent> <Plug>CustomUnimpairedMoveUp :<C-U>call CustomUnimpairedMoveUp(v:count1)<CR>
noremap <silent> <Plug>CustomUnimpairedMoveDown :<C-U>call CustomUnimpairedMoveDown(v:count1)<CR>
noremap <silent> <Plug>CustomUnimpairedMoveSelectionUp :<C-U>call CustomUnimpairedMoveSelectionUp(v:count1)<CR>
noremap <silent> <Plug>CustomUnimpairedMoveSelectionDown :<C-U>call CustomUnimpairedMoveSelectionDown(v:count1)<CR>

nmap [e <Plug>CustomUnimpairedMoveUp
nmap ]e <Plug>CustomUnimpairedMoveDown
vmap [e <Plug>CustomUnimpairedMoveSelectionUp
vmap ]e <Plug>CustomUnimpairedMoveSelectionDown
