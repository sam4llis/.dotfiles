" TODO(sam3llis):
" Add distinct toggle commands for terminal and REPL, so they can both be
" toggled simultanously without affecting one another. This could maybe just
" be a change from global to local parameters.
" Also allow a way to visually select code to be sent to a REPL.

if !has("nvim")
    finish
endif

let s:buf_floating = -1
let s:window = -1


function! CreateFloatingWindow()
  let ui = nvim_list_uis()[0] " Generate current UI dimensions.

  let width  = float2nr(ui.width * 0.6)
  let height = float2nr(ui.height * 0.6)
  let row    = float2nr((&lines - height) / 2)
  let col    = float2nr((&columns - width) / 2)

  let s:opts = {'relative': 'editor', 'width': width, 'height': height, 'row': row, 'col': col, 'style': 'minimal', 'border': 'rounded'}

  let s:buf_floating = nvim_create_buf(v:false, v:true)        " Create a new buffer.
  let s:window = nvim_open_win(s:buf_floating, v:true, s:opts) " Open the new buffer with window options.
  call setwinvar(s:window, '&winhighlight', 'Normal:Normal')   " Set background color of the active terminal buffer.
endfunction


function! OpenFloatingTerminal(...)
  if !bufexists(s:buf_floating)
    call call('AddTerminal', a:000)
    let s:buf_term = winbufnr(winnr())
  else
    call CreateFloatingWindow()
    silent! execute 'buffer ' . s:buf_term
endif
endfunction


function! CloseFloatingTerminal()
  if win_gotoid(s:window)
    hide
  endif
endfunction


function! AddTerminal(...)
  call CreateFloatingWindow()
  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif
  let s:id = b:terminal_job_id
endfunction


function! ToggleFloatingTerminal(...)
  if win_gotoid(s:window)
    call CloseFloatingTerminal()
  else
    " call OpenFloatingTerminal()
    call call('OpenFloatingTerminal', a:000)
  endif

  " When the terminal buffer is closed, reset the floating buffer variable.
  autocmd TermClose * let s:buf_floating = -1
endfunction

" FIXME(sam3llis): WORK IN PROGRESS - EXECUTE VISUAL SELECTIONS.
augroup send_to_term
  autocmd!
  autocmd TermOpen * if &buftype ==# 'terminal' |
        \   let t:send_to_term = +expand('<abuf>') |
        \ endif
augroup END


function! s:op(type, ...)
  let [sel, rv, rt] = [&selection, @@, getregtype('"')]
  let &selection = "inclusive"

  if a:0
    silent exe "normal! `<" . a:type . "`>y"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  elseif a:type == 'block'
    silent exe "normal! `[\<C-V>`]y"
  else
    silent exe "normal! `[v`]y"
  endif

  call s:send_to_term(@@)

  let &selection = sel
  call setreg('"', rv, rt)
endfunction

function! s:send_to_term(keys)
  let bufnr = get(t:, 'send_to_term', 0)
  if bufnr > 0 && bufexists(bufnr) && getbufvar(bufnr, '&buftype') ==# 'terminal'
    let keys = substitute(a:keys, '\n$', '', '')
    call OpenFloatingTerminal()
    call chansend(bufnr, keys . "\<cr>")
    echo "Sent " . len(keys) . " chars -> " . bufname(bufnr)
  else
    echo "Error: No terminal"
  endif
endfunction

command! -range -bar SendToTerm call s:send_to_term(join(getline(<line1>, <line2>), "\n"))
nmap <script> <Plug>(send-to-term-line) :<c-u>SendToTerm<cr>
nmap <script> <Plug>(send-to-term) :<c-u>set opfunc=<SID>op<cr>g@
xmap <script> <Plug>(send-to-term) :<c-u>call <SID>op(visualmode(), 1)<cr>
