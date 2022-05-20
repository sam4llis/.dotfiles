vim.api.nvim_create_user_command('Finder', 'silent !open ' .. '%:p:h', {})
