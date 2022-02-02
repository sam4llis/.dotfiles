function! SetupMarks() abort
  exe '0/def main/mark z'
  exe '0/import/mark i'
endfunction

augroup python_marks
  autocmd!
  autocmd BufEnter *.py silent! call SetupMarks()
augroup END

" Add shortcut for quickly running scripts.
nnoremap <leader>r :w <bar> :vsp +term\ python\ %<cr>

" Autocomplete Character Mappings:
inoremap <buffer> __ ____<esc>hi
