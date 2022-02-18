function! AutoDirectory() abort
  let l:fugitive_worktree = FugitiveWorkTree()
  if !empty(l:fugitive_worktree)
    execute 'lcd' . l:fugitive_worktree
  endif
endfunction

if has('autocmd')
  augroup working_directory
    autocmd!
    autocmd BufRead * call AutoDirectory()
  augroup END
endif
