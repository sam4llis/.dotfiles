if !has("nvim-0.5.0")
    finish
endif

lua <<EOF

  local cmp = require("cmp")

  cmp.setup {

    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },

    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    },

  sources = ({
    { name = "nvim_lsp", keyword_length = 2 },
    { name = "buffer", keyword_length = 2 },
    { name = "ultisnips" },
  }),

  experimental = {
    native_menu = false,
    ghost_text = true,
  },

  }

  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
      }, {
      { name = 'cmdline', max_item_count = 10, keyword_length = 2 }
    })
  })

  -- Add vim-dadbod-completion
  _ = vim.cmd [[
    augroup DadbodSql
      au!
      autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion', keyword_length = 5 } } }
    augroup END
  ]]

  _ = vim.cmd [[
    augroup CmpZsh
      au!
      autocmd Filetype zsh lua require'cmp'.setup.buffer { sources = { { name = "zsh" }, } }
    augroup END
  ]]

EOF
