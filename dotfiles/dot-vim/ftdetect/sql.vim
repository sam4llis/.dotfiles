if has("autocmd")
  augroup templates
    autocmd! BufNewFile *.sql silent 0r ~/.vim/template/skeleton.sql
  augroup END
endif
