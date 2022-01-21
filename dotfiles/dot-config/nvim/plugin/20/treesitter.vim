if !has("nvim-0.5.0")
    finish
endif

lua <<EOF

  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
      enable = true,
      custom_captures = {
        ["go_snake_case_identifier"] = "ErrorMsg",
      },
    },
    indent = {
      enable = false,
    },
    incremental_selection = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["]vv"] = "@parameter.inner",
          ["]vf"] = "@funtion.outer",
          ["]vc"] = "@class.outer",
        },
        swap_previous = {
          ["[vv"] = "@parameter.inner",
          ["[vf"] = "@function.outer",
          ["[vc"] = "@class.outer",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- Whether to set jumps in the jumplist.
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
    },
  }

EOF
