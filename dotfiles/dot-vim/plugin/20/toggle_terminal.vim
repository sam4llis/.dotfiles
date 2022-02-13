if !has("nvim")
    finish
endif

function! FloatTerminal(...)

  let ui = nvim_list_uis()[0] " Generate current UI dimensions.

  " Window dimensions.
  let width  = float2nr(ui.width * 0.6)
  let height = float2nr(ui.height * 0.6)
  let row    = float2nr((&lines - height) / 2)
  let col    = float2nr((&columns - width) / 2)

  " Terminal options.
  let opts = {'relative': 'editor', 'width': width, 'height': height, 'row': row, 'col': col, 'style': 'minimal', 'border': 'rounded'}

  let s:buf = nvim_create_buf(v:false, v:true)                 " Create a new buffer.
  let s:terminal = nvim_open_win(s:buf, v:true, opts)          " Open the new buffer with terminal options.
  call setwinvar(s:terminal, '&winhighlight', 'Normal:Normal') " Set background color of the active terminal buffer.

  " If a function argument is given, automatically run the argument, otherwise only open a new terminal.
  if  a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif

endfunction
