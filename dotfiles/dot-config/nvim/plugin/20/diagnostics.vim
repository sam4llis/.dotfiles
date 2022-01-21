if !has("nvim-0.6.0")
    finish
endif

lua << EOF

    normal_completion_prefix = 'yc'
    vim.api.nvim_set_keymap('n', normal_completion_prefix .. 'q', '<cmd>lua vim.diagnostic.setqflist()<CR>', {noremap = true})
    vim.api.nvim_set_keymap('n', normal_completion_prefix .. 'Q', '<cmd>lua vim.diagnostic.setqflist({severity={min=vim.diagnostic.severity.ERROR}})<CR>', {noremap = true})
    vim.api.nvim_set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {noremap = true})
    vim.api.nvim_set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', {noremap = true})
    vim.api.nvim_set_keymap('n', '[G', '<cmd>lua vim.diagnostic.goto_prev({severity={min=vim.diagnostic.severity.ERROR}})<CR>', {noremap = true})
    vim.api.nvim_set_keymap('n', ']G', '<cmd>lua vim.diagnostic.goto_next({severity={min=vim.diagnostic.severity.ERROR}})<CR>', {noremap = true})

    local signs = { Error = "■", Warn = "■", Hint = "■", Info = "■" }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

EOF
