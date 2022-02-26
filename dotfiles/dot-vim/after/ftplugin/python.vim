function! SetupMarks() abort
  exe '0/def main/mark z'
  exe '0/import/mark i'
endfunction

augroup python_marks
  autocmd!
  autocmd BufEnter *.py silent! call SetupMarks()
augroup END

" Run active buffer.
nnoremap <leader>r :lua require('terminal').run_active_buffer('python3', true)<CR>

" Autocomplete Character Mappings:
inoremap <buffer> __ ____<esc>hi
