-- Add option to move back to original window after a terminal execution.
-- Create a function to have different position options (TL, TR, ML, MR, BL, BR, MIDDLE, etc.)
-- print messages = false | true
-- use similar to <C-w>hjkl to move between specifically floating windows?
--
-- TODO:
--
-- Create a 'launch new terminal' command, that creates a fresh floating window in toggle terminal
-- view, then splits the screen to show both terminals at the same time :)
--
-- Customise location of windows on screen, e.g. for an iPython REPL, I think I'd prefer it being static
-- on the RHS of the editor approx (90 characters) across.
--
-- Add vim-slime jobid set automatically to self.pid for REPL windows.
--
-- Fix force closing a REPL window - can't open another REPL in same folder after it has been closed!
--
-- Move QuickNote() into Lua, and make it use the require('window') Window API.

if vim.fn.has('nvim') == 0 then
  return
end

Terminal = {}
Terminal.__index = Terminal
setmetatable(Terminal, require('window'))


function Terminal:open(cmd)
  Window.open(self)

  if not self.pid then
    local cmd = cmd or string.format('%s --login', os.getenv('SHELL'))
    self.pid = vim.fn.termopen(cmd)
  end

  if not vim.fn.has_key(vim.g.plugs, 'nvim-vim-termbinds') then
    vim.cmd('startinsert')
  end

  vim.cmd("autocmd TermClose <buffer> lua require('terminal'):close(true)")
end


function Terminal.run_active_buffer(cmd, save)
  local filename = vim.fn.expand('%')

  if save then
    vim.cmd('write')
  end

  Window.new():open()
  vim.fn.termopen(cmd .. ' ' .. filename)
end


function Terminal.run_repl(cmd)
  t = t or {buf = -1}
  if t.buf == -1 then
    t = Terminal.new({percentage=0.5})
  end
  if not t.win then
    t:open(self, cmd)
    if not t.pid then
      t.pid = vim.fn.termopen(cmd)
    end
  else
    t:close()
  end
end


return Terminal
