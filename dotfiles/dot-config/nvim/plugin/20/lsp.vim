if !has("nvim-0.5.0")
    finish
endif

" Saner completion experience.
set completeopt=menuone,noinsert,noselect
set shortmess+=c

lua << EOF

    local custom_lsp_attach = function(client, bufnr)
        local opts = { noremap=true, silent=true }
        normal_completion_prefix = 'yc'
        visual_completion_prefix = '<leader>y'

        vim.api.nvim_buf_set_option(0, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
        vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(0, 'n', normal_completion_prefix .. 'a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        vim.api.nvim_buf_set_keymap(0, 'n', normal_completion_prefix .. 'd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(0, 'n', normal_completion_prefix .. 'i', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
        vim.api.nvim_buf_set_keymap(0, 'n', normal_completion_prefix .. 'm', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(0, 'n', normal_completion_prefix .. 'n', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(0, 'n', normal_completion_prefix .. 'o', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)
        vim.api.nvim_buf_set_keymap(0, 'n', normal_completion_prefix .. 'r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(0, 'n', normal_completion_prefix .. 's', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.api.nvim_buf_set_keymap(0, 'n', normal_completion_prefix .. 't', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

        if client.resolved_capabilities.document_formatting then
            vim.api.nvim_buf_set_keymap(0, 'n', normal_completion_prefix .. 'f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
        elseif client.resolved_capabilities.document_range_formatting then
            vim.api.nvim_buf_set_keymap(0, 'v', visual_completion_prefix .. 'f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
        end
    end

    local nvim_lsp = require('lspconfig')
    local servers = { 'pylsp', 'rust_analyzer', 'tailwindcss', 'tsserver', 'vimls'}

    for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup {
        on_attach = custom_lsp_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
    end

EOF
