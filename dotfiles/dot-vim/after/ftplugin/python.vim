function! SetupMarks() abort
  exe '0/def main/mark z'
  exe '0/import/mark i'
endfunction

augroup python_marks
  autocmd!
  autocmd BufEnter *.py silent! call SetupMarks()
augroup END

" Floating console.
nnoremap <buffer> <silent> <localleader>c :call FloatTerminal('"python3"')<CR>

" Floating script.
nnoremap <buffer> <silent> <localleader>r :w <bar> :call FloatTerminal('"python3" "<C-r>%"')<CR>

" Autocomplete Character Mappings:
inoremap <buffer> __ ____<esc>hi
