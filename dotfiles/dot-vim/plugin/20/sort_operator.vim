function SortOp(type = '') abort
  if a:type ==# ''
    set opfunc=SortOp
    return 'g@'
  endif
  exe "'[,']sort"
endfunction

function ReverseSortOp(type = '') abort
  if a:type ==# ''
    set opfunc=ReverseSortOp
    return 'g@'
  endif
  exe "'[,']sort!"
endfunction
