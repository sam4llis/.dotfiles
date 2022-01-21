if has("nvim")
  let g:slime_target = "neovim"
else
  let g:slime_target = "vimterminal"
endif

let g:slime_vimterminal_config = { "term_finish": "close",
    \ "vertical": 1,
    \ "term_cols": &columns * 1/3,}

let g:slime_vimterminal_cmd = "python"
let g:slime_python_ipython = 1
