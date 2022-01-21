if has("autocmd")
  augroup templates
    autocmd! BufNewFile *.awk silent 0r ~/.vim/template/skeleton.awk
  augroup END
endif
