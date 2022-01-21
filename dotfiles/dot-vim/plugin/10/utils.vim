" Execute a command will preserving the current view.
function PreserveView(cmd)
  let l:saved_view = winsaveview()
  exe a:cmd
  call winrestview(l:saved_view)
endfunction

" Dedent lines so that the minimally indented line(s) start at column zero.
function! DedentLines(lines)
  let indentation_values = deepcopy(a:lines)
  let re = '\v^\s*'
  call map(indentation_values, "len(matchstr(v:val,'" . re . "'))")
  let min_indentation = min(indentation_values)

  let dedented_lines = deepcopy(a:lines)
  let re = '\v^\s{' . string(min_indentation) . '}'
  call map(dedented_lines, "substitute(v:val, '" . re . "', '', '')")
  return dedented_lines
endfunction
