if !has("nvim-0.5.0")
    finish
endif

lua <<EOF

  local cmp = require('cmp')
  local cmp_types = require('cmp.types')

  cmp.setup({
    completion = {
      autocomplete = false,
    },
    experimental = {
      native_menu = false,
      ghost_text = true,
    },
    mapping = {
      ['<C-x><C-o>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp', max_item_count=10 },
    }),
  })

EOF
