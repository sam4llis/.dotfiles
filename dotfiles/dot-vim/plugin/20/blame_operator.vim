function BlameOp(type = '') abort
  if a:type ==# ''
    set opfunc=BlameOp
    return 'g@'
  endif
  exe "'[,']Git blame"
endfunction
