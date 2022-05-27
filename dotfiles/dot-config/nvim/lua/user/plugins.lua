--         _             _             _
--   _ __ | |_   _  __ _(_)_ __  ___  | |_   _  __ _
--  | '_ \| | | | |/ _` | | '_ \/ __| | | | | |/ _` |
--  | |_) | | |_| | (_| | | | | \__ \_| | |_| | (_| |
--  | .__/|_|\__,_|\__, |_|_| |_|___(_)_|\__,_|\__,_|
--  |_|            |___/

if vim.fn.empty(vim.fn.glob('~/.config/nvim/autoload/plug.vim')) == 1 then
  vim.cmd('!' .. "sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'")
  if vim.fn.has('nvim-0.7.0') == 1 then
    vim.api.nvim_create_autocmd('VimEnter', { command = 'PlugInstall --sync | source $MYVIMRC' })
  else
    vim.api.nvim_err_writeln('Lua autocmds require Neovim 0.7.0.')
    vim.api.nvim_err_writeln('Please update your Neovim.')
    return
  end
end

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

  -- Vim.
  Plug('joechrisellis/vim-git-arglist')
  Plug('joechrisellis/vim-searchlist')
  Plug('tpope/vim-commentary')
  Plug('tpope/vim-dadbod')
  Plug('tpope/vim-fugitive')
  Plug('tpope/vim-projectionist')
  Plug('tpope/vim-ragtag')
  Plug('tpope/vim-repeat')
  Plug('tpope/vim-rhubarb')
  Plug('tpope/vim-rsi')
  Plug('tpope/vim-sleuth')
  Plug('tpope/vim-surround')
  Plug('tpope/vim-unimpaired')
  Plug('tpope/vim-vinegar')

  -- Treesitter.
  Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
  Plug('nvim-treesitter/nvim-treesitter-textobjects')
  Plug('nvim-treesitter/playground')

  -- Telescope.
  Plug('nvim-lua/plenary.nvim')
  Plug('nvim-telescope/telescope.nvim')
  Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

  -- Colorschemes.
  Plug('catppuccin/nvim', { as = 'catppuccin' })

  -- Miscellaneous.
  Plug('lewis6991/gitsigns.nvim')
  Plug('neovim/nvim-lspconfig')
  Plug('jose-elias-alvarez/null-ls.nvim')

  -- My Plugins.
  Plug('~/Documents/nvim-plugins/nvim-buoy')
  Plug('~/Documents/nvim-plugins/nvim-stratus')

vim.call('plug#end')
