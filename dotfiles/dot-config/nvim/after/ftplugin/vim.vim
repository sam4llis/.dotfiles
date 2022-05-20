" Open Lua 'require()' files using 'gf' mapping.
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal suffixesadd^=.lua
setlocal suffixesadd^=init.lua
let &l:path .= ','.stdpath('config').'/lua'

lua <<EOF
-- Helper function to `pretty print` tables in Lua for debugging.
-- @param t table: the table to be inspected.
-- @return table: the input table.
pprint = function(t)
  print(vim.inspect(t))
  return t
end
EOF
