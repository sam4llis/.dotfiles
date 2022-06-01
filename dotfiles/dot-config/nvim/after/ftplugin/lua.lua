-- @desc
--   Helper function to `pretty print` tables in Lua for debugging.
-- @param t: table
--   The table to be inspected.
-- @return: table
--   The input table.
pprint = function(t)
  print(vim.inspect(t))
  return t
end

-- Open files in `require()` via `gf`.
require('nvim-lua-gf').setup()
