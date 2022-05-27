--             _                     _                           _
--    ___ ___ | | ___  _ __ ___  ___| |__   ___ _ __ ___   ___  | |_   _  __ _
--   / __/ _ \| |/ _ \| '__/ __|/ __| '_ \ / _ \ '_ ` _ \ / _ \ | | | | |/ _` |
--  | (_| (_) | | (_) | |  \__ \ (__| | | |  __/ | | | | |  __/_| | |_| | (_| |
--   \___\___/|_|\___/|_|  |___/\___|_| |_|\___|_| |_| |_|\___(_)_|\__,_|\__,_|

if vim.fn.isdirectory(vim.fn.expand('$HOME') .. '~/.config/nvim/plugged/catppuccin') == 1 then
  vim.g.catppuccin_flavour = "mocha"
  vim.cmd('colorscheme catppuccin')
end

if vim.fn.isdirectory(vim.fn.expand('$HOME') .. '/Documents/nvim-plugins/nvim-tundra') == 1 then
  require('nvim-tundra').setup()
end
