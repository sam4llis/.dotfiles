function! SetupMarks() abort
  exe '0/def main/mark z'
  exe '0/import/mark i'
endfunction

augroup python_marks
  autocmd!
  autocmd BufEnter *.py silent! call SetupMarks()
augroup END

" Floating REPL.
nnoremap <buffer> <silent> <C-\><C-r> :call ToggleFloatingTerminal('"python3"')<CR>
tnoremap <silent> <C-\><C-r> <C-\><C-n><C-W>:call ToggleFloatingTerminal()<CR>

" Floating script.
nnoremap <buffer> <silent> <localleader>r :w <bar> :call AddTerminal('"python3" "<C-r>%"')<CR>

" Autocomplete Character Mappings:
inoremap <buffer> __ ____<esc>hi
