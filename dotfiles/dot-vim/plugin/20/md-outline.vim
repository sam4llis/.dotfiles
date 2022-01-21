function! s:PrettifyHeader(line_text)
  let l:new_line = substitute(a:line_text, '\v^(#+)\s*(.*)', '\=repeat("\t", len(submatch(1)) - 1) . submatch(2)', '')
  return l:new_line
endfunction

function! s:MdOutlineLine(line_num)
  let l:line_text = getline(a:line_num)
  return a:line_num . "\t" . s:PrettifyHeader(l:line_text)
endfunction

function! s:MdOutline(line1, line2)
  let l:range = a:line1 . ',' . a:line2
  exe l:range . 'g/^#/echo s:MdOutlineLine(line("."))'
endfunction

command! -range=% MdOutline call s:MdOutline(<line1>, <line2>)
