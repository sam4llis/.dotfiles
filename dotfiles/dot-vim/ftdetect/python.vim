if has("autocmd")
  augroup templates
    autocmd! BufNewFile *.py silent 0r ~/.vim/template/skeleton.py
  augroup END
endif
