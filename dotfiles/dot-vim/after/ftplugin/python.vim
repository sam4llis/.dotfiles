function! SetupMarks() abort
  exe '0/def main/mark z'
  exe '0/import/mark i'
endfunction

augroup python_marks
  autocmd!
  autocmd BufEnter *.py silent! call SetupMarks()
augroup END

" Run active buffer.
nnoremap <silent> <leader>r :lua require('terminal').run_active_buffer('python3', true)<CR>

" Load IPython REPL.
tnoremap <silent> <C-\><C-r> <C-\><C-n>:lua require('terminal').run_repl('ipython')<CR>
nnoremap <silent> <C-\><C-r> :lua require('terminal').run_repl('ipython')<CR>

" Autocomplete Character Mappings:
inoremap <buffer> __ ____<esc>hi
