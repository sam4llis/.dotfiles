local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

local sources = { null_ls.builtins.formatting.black }

null_ls.setup({ sources = sources })
