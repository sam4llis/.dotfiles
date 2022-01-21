function! s:FlattenParagraphs(line1, line2)
  " Why the weird regex /.\n./?
  " It's because, from `:h J`:
  "     Join [count] lines, with a minimum of two lines.
  " If there's less than two lines we get funky behaviour. So we have to
  " perform the norm! command for all paragraphs where there are >= 2 lines.
  silent! exe a:line1 . ',' . a:line2 . 'g/.\n./norm!vipJ'
endfunction

function! s:WrapParagraphs(line1, line2)
  silent! exe a:line1 . ',' . a:line2 . 'g/./norm!gqip'
endfunction

command! -range=% FlattenParagraphs call s:FlattenParagraphs(<line1>, <line2>)
command! -range=% WrapParagraphs call s:WrapParagraphs(<line1>, <line2>)
