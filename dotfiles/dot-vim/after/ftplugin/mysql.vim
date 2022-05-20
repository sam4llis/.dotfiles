" " Auto-formatting commands.
" nnoremap <leader>f :%!sqlformat --reindent --keywords upper --identifiers lower - <CR>
" vnoremap <leader>f :!sqlformat --reindent --keywords upper --identifiers lower - <CR>

" " Execution commands.
" xnoremap <expr> <Plug>(DBExe)     db#op_exec()
" nnoremap <expr> <Plug>(DBExe)     db#op_exec()
" nnoremap <expr> <Plug>(DBExeLine) db#op_exec() . '_'

" xmap <leader>db  <Plug>(DBExe)
" nmap <leader>db  <Plug>(DBExe)
" omap <leader>db  <Plug>(DBExe)
" nmap <leader>dbb <Plug>(DBExeLine)
