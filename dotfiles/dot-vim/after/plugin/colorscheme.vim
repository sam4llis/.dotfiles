" Colorscheme options.
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    let g:onedark_terminal_italics = 1
  endif

  if (has("termguicolors"))
    set termguicolors
  endif

endif

set background=dark
colorscheme one
