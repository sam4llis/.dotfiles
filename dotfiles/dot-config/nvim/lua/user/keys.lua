--   _                    _
--  | | _____ _   _ ___  | |_   _  __ _
--  | |/ / _ \ | | / __| | | | | |/ _` |
--  |   <  __/ |_| \__ \_| | |_| | (_| |
--  |_|\_\___|\__, |___(_)_|\__,_|\__,_|
--            |___/

-- <space> is leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Normalise search direction behaviour.
vim.api.nvim_set_keymap('n', 'n', "(v:searchforward ? 'n' : 'N')", { noremap = true, expr = true })
vim.api.nvim_set_keymap('n', 'N', "(v:searchforward ? 'N' : 'n')", { noremap = true, expr = true })
vim.api.nvim_set_keymap('o', 'n', "(v:searchforward ? 'n' : 'N')", { noremap = true, expr = true })
vim.api.nvim_set_keymap('o', 'N', "(v:searchforward ? 'N' : 'n')", { noremap = true, expr = true })
vim.api.nvim_set_keymap('x', 'n', "(v:searchforward ? 'n' : 'N')", { noremap = true, expr = true })
vim.api.nvim_set_keymap('x', 'N', "(v:searchforward ? 'N' : 'n')", { noremap = true, expr = true })

-- Trim whitespace.
vim.api.nvim_create_user_command("TrimWhitespace", ":lua require('user.utils.whitespace').trim()<CR>", {})

-- Sort lines.
vim.api.nvim_set_keymap('v', '<leader>s', ':sort<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>S', ':sort!<CR>', { noremap = true, silent = true })

-- Align and prettify table entries and columns.
vim.api.nvim_set_keymap('v', '<leader>c', ':%!column -t<CR>', { noremap = true, silent = true })

-- Telescope mappings.
vim.api.nvim_set_keymap('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':lua require("telescope.builtin").buffers()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fn', ':lua require("telescope.builtin").find_files({ prompt_title = "Find Notes", cwd = "~/notes/" })<CR>', { noremap = true, silent = true })

-- nvim-buoy: Floating terminal mappings.
-- FIXME: Change to nvim-buoy.
vim.api.nvim_create_user_command('ToggleFloatingTerminal', ':lua require("terminal"):toggle()<CR>', {})

-- nvim-buoy: Floating note mappings.
vim.api.nvim_set_keymap('n', '<leader>n', ':lua require("note"):toggle(true)<CR>', { noremap = true, silent = true })

-- Gitsigns mappings.
vim.api.nvim_create_user_command("Stage", "'<,'>Gitsigns stage_hunk", { range = true })
vim.api.nvim_create_user_command("ToggleDeleted", ":Gitsigns toggle_deleted", {})
