-- NOTE(sam3llis):
-- Add option to move back to original window after a terminal execution.
-- Create a function to have different position options (TL, TR, ML, MR, BL, BR, MIDDLE, etc.)
-- print messages = false | true
-- use similar to <C-w>hjkl to move between specifically floating windows?

if not vim.fn.has("nvim-0.5.0") then
    return
end

local window = require('window')

-- local terminal = {
--   buf = nil,
--   win = nil,
--   pid = nil,
-- }

local terminal = {}

terminal.open = function (cmd)
  local buf = window.open()

  if not window.buf then
    local cmd = cmd or string.format('%s --login', os.getenv('SHELL'))
    window.pid = vim.fn.termopen(cmd)
  end

  if vim.fn.has_key(vim.g.plugs, 'nvim-vim-termbinds') == 0 then -- NOTE: vim-plug only.
    vim.cmd('startinsert')
  end

  vim.cmd("autocmd! TermClose * lua require('terminal').exit()")

  window.buf = buf
end

terminal.close = function (force)
  local force = force or nil
  window.close(force)
end

terminal.exit = function (force)
  -- NOTE: enable terminal.exit force (not working)
  if force then
    if vim.api.nvim_buf_is_loaded(window.buf) then
      vim.api.nvim_buf_delete(window.buf, { force = true })
    end
    vim.fn.jobstop(window.pid)
  end

  window.buf = nil
  window.win = nil
  window.pid = nil
end

terminal.toggle = function (cmd)
  if not window.win then
    terminal.open(cmd)
  else
    terminal.close()
  end
end

-- NOTE: only works with python for now - figure this out (maybe just a giant hashmap).
terminal.run_active_buffer = function ()
  -- local filetype = vim.bo.filetype
  terminal.open('python3' .. ' ' .. vim.fn.expand('%'))
end


return terminal
