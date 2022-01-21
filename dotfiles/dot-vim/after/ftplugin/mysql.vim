nnoremap <leader>r :%!sqlformat --reindent --keywords upper --identifiers lower - <CR> <bar> :w <CR>
vnoremap <leader>r :%!sqlformat --reindent --keywords upper --identifiers lower - <CR> <bar> <Plug>(DBUI_ExecuteQuery) <CR>
