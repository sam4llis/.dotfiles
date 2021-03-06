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
    prompt_prefix = "     ",
    selection_caret = "  ",
    entry_prefix = "  ",
    sorting_strategy = "ascending",
    layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
             vertical = {
                mirror = false,
            },
            width = 0.8,
            height = 0.8,
            preview_cutoff = 120,
  },

    -- layout_strategy = "vertical",
    -- sorting_strategy = "ascending",
    -- layout_config = {
    --   prompt_position = 'top',
    -- },
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

-- require('telescope').load_extension('fzf')
