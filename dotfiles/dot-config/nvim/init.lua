--   _       _ _     _
--  (_)_ __ (_) |_  | |_   _  __ _
--  | | '_ \| | __| | | | | |/ _` |
--  | | | | | | |_ _| | |_| | (_| |
--  |_|_| |_|_|\__(_)_|\__,_|\__,_|

-- Load plugin dependencies, user settings, and user keymappings.
require('user.plugins')
require('user.settings')
require('user.keys')

-- Load utility functions.
require('user.utils.auto_directory')
require('user.utils.finder')
require('user.utils.vimrc')
require('user.utils.whitespace')

-- Setup plugins.
require('user.setup.treesitter')
require('user.setup.lsp')
require('user.setup.diagnostics')
require('user.setup.telescope')
require('user.setup.gitsigns')
require('user.setup.projectionist')

-- Load user interface.
require('user.ui.colorscheme')
require('user.ui.statusline')

-- TODO: Add `if` statements in lsp.lua.
-- TODO: Sort out ftplugin/lua
