if !has("nvim-0.5.0")
    finish
endif

lua <<EOF

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
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",        -- smart_case | ignore_case | respect_case
      },
    },
  }

  require('telescope').load_extension('fzf')

EOF
