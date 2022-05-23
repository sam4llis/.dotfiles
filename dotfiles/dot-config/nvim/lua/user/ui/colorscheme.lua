--             _                     _                           _
--    ___ ___ | | ___  _ __ ___  ___| |__   ___ _ __ ___   ___  | |_   _  __ _
--   / __/ _ \| |/ _ \| '__/ __|/ __| '_ \ / _ \ '_ ` _ \ / _ \ | | | | |/ _` |
--  | (_| (_) | | (_) | |  \__ \ (__| | | |  __/ | | | | |  __/_| | |_| | (_| |
--   \___\___/|_|\___/|_|  |___/\___|_| |_|\___|_| |_| |_|\___(_)_|\__,_|\__,_|

if vim.fn.empty('~/.config/nvim/plugged/catppuccin') ~= 1 then
  vim.cmd('colorscheme catppuccin')
  local cp = require('catppuccin.core.color_palette')

  -- Increase border visibility.
  vim.cmd('highlight VertSplit guifg=' .. cp.black4)

  -- Change default colour for floating window and nvim-telescope borders.
  local border_colour = cp.gray1
  vim.cmd('highlight FloatBorder guifg=' .. border_colour)
  vim.cmd('highlight TelescopeBorder guifg=' .. border_colour)

  -- Change default colour for Vim folds.
  vim.cmd('highlight Folded guifg=' .. cp.flamingo .. ' guibg=' .. cp.black2)

  -- Change default colour for search highlights.
  vim.cmd('highlight Search guifg=' .. cp.red .. ' guibg=' .. cp.black1)
  vim.cmd('highlight IncSearch guifg=' .. cp.red .. ' guibg=' .. cp.black1)
  vim.cmd('highlight Substitute guifg=' .. cp.red .. ' guibg=' .. cp.black1)

end
