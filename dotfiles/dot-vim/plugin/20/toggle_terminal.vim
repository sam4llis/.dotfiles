if !has("nvim")
    finish
endif

let g:buf_floating = -1
let g:window = -1

function! CreateFloatingWindow()
  let ui = nvim_list_uis()[0] " Generate current UI dimensions.

  let width  = float2nr(ui.width * 0.6)
  let height = float2nr(ui.height * 0.6)
  let row    = float2nr((&lines - height) / 2)
  let col    = float2nr((&columns - width) / 2)

  let g:opts = {'relative': 'editor', 'width': width, 'height': height, 'row': row, 'col': col, 'style': 'minimal', 'border': 'rounded'}

  let g:buf_floating = nvim_create_buf(v:false, v:true)        " Create a new buffer.
  let g:window = nvim_open_win(g:buf_floating, v:true, g:opts) " Open the new buffer with window options.
  call setwinvar(g:window, '&winhighlight', 'Normal:Normal')   " Set background color of the active terminal buffer.
endfunction


function! CreateFloatingTerminal(...)
  call CreateFloatingWindow()
  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif
endfunction


function! OpenFloatingTerminal()
  if !bufexists(g:buf_floating)
    call AddTerminal()
    let g:buf_term = winbufnr(winnr())
  else
    call CreateFloatingWindow()
    silent! execute 'buffer ' . g:buf_term
endif
endfunction


function! CloseFloatingTerminal()
  if win_gotoid(g:window)
    hide
  endif
endfunction


function! AddTerminal(...)
  call CreateFloatingWindow()
  if a:0 == 0
    terminal
    " startinsert
  else
    call termopen(a:1)
    " startinsert
  endif
endfunction


function! ToggleFloatingTerminal()
  if win_gotoid(g:window)
    call CloseFloatingTerminal()
  else
    call OpenFloatingTerminal()
  endif
endfunction
