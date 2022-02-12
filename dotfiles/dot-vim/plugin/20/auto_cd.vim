function! AutoDirectory()
  let current_file = expand('%:p')
  if getftype(current_file) == 'link'
    let current_file = resolve(current_file)
  endif
  exe ':lcd' . fnamemodify(current_file, ':h')
  :silent let git_dir = system('git rev-parse --git-dir')[:-2]
  let is_not_git_dir = matchstr(git_dir, '^fatal:.*')
  if empty(is_not_git_dir)
    exe ':lcd' . fnamemodify(git_dir, ':p:h:h')
  endif
endfunction

if has('autocmd')
  augroup working_directory
    autocmd!
    autocmd BufRead * call AutoDirectory()
  augroup END
endif
