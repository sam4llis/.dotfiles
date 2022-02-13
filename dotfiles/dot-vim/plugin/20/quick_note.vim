function! QuickNote() abort

  let fpath = "~/notes/"                          " Path to notes.
  let fname = fpath.strftime("note-%d-%m-%y.txt") " Unique daily filename.
  let ui = nvim_list_uis()[0]                     " Generate current UI dimensions.

  " Window dimensions.
  let width  = float2nr(ui.width * 0.6)
  let height = float2nr(ui.height * 0.6)
  let row    = float2nr((&lines - height) / 2)
  let col    = float2nr((&columns - width) / 2)

  " Window options.
  let opts = {'relative': 'editor', 'width': width, 'height': height, 'row': row, 'col': col, 'style': 'minimal', 'border': 'rounded'}

  " Empty buffer
  let s:buf = nvim_create_buf(v:false, v:true) " Create a new buffer.
  let s:window = nvim_open_win(s:buf, v:true, opts) " Open the new buffer with window options.

  " Window settings.
  let column = 80
  execute "e ".fnameescape(fname)
  execute "set textwidth=" . column
  execute "set colorcolumn=" . column

  if filereadable(expand(fname))
    execute "norm G$"
    execute "norm zz"
  else
    execute "norm GoNotes (".strftime("%d-%m-%y")."):"
    execute "norm G2o"
    execute "norm Gi- "
    execute "norm zz"
  endif

  call setwinvar(s:window, '&winhighlight', 'Normal:Normal') " Set background color of the active window buffer.

endfunction
