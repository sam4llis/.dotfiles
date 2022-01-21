if has("autocmd")
  augroup templates
    autocmd! BufNewFile *.sh silent 0r ~/.vim/template/skeleton.sh
  augroup END
endif
