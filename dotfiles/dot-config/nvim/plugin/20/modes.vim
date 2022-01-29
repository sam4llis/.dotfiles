lua <<EOF
  local cp = require("catppuccin.core.color_palette")

  vim.opt.cursorline = true

  require('modes').setup({
    colors = {
      copy = cp.peach,
      delete = cp.red,
      insert = cp.green,
      visual = cp.flamingo,
    },
    line_opacity = 0.1,
    focus_only = true,
  })

EOF
