--             _                     _                           _
--    ___ ___ | | ___  _ __ ___  ___| |__   ___ _ __ ___   ___  | |_   _  __ _
--   / __/ _ \| |/ _ \| '__/ __|/ __| '_ \ / _ \ '_ ` _ \ / _ \ | | | | |/ _` |
--  | (_| (_) | | (_) | |  \__ \ (__| | | |  __/ | | | | |  __/_| | |_| | (_| |
--   \___\___/|_|\___/|_|  |___/\___|_| |_|\___|_| |_| |_|\___(_)_|\__,_|\__,_|

if vim.fn.empty('~/.config/nvim/plugged/catppuccin') ~= 1 then
  vim.cmd('colorscheme catppuccin')

  -- Increase border visibility.
  vim.cmd('highlight VertSplit guifg=' .. require('catppuccin.core.color_palette').black4)
end
