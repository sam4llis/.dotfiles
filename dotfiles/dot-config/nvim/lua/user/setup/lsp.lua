if vim.fn.has('nvim-0.6.1') ~= 1 then
  vim.api.nvim_err_writeln("The plugin `nvim-lspconfig` requires Neovim 0.6.1.")
  vim.api.nvim_err_writeln("Please update your Neovim.")
  return
end

local on_attach = function(client, bufnr)
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

  if client.server_capabilities.document_formatting then
    vim.api.nvim_buf_set_keymap(0, 'n', normal_completion_prefix .. 'f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', {noremap = true})
  elseif client.server_capabilities.document_range_formatting then
    vim.api.nvim_buf_set_keymap(0, 'v', visual_completion_prefix .. 'f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', {noremap = true})
  end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  -- delay update diagnostics.
  update_in_insert = false,
}
)

local servers = { 'pyright', 'tsserver', 'vimls'}
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
