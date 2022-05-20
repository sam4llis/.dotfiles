if vim.fn.has('nvim-0.6.0') ~= 1 then
  vim.api.nvim_err_writeln("The plugin `telescope.nvim` requires Neovim 0.6.0.")
  vim.api.nvim_err_writeln("Please update your Neovim.")
  return
end

local actions = require("telescope.actions")

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<esc>"] = actions.close,
      },
    },
  },
  pickers = {},
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

require('telescope').load_extension('fzf')
