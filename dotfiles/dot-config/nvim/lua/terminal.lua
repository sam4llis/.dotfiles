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
-- Open REPL command, probably similar to run_active_buffer()
--
-- Customise location of windows on screen, e.g. for an iPython REPL, I think I'd prefer it being static
-- on the RHS of the editor approx (90 characters) across.
--
-- Add :w <bar> into run_active_buffer() as a standard default (e.g. run_active_buffer(save = true)).

if not vim.fn.has("nvim-0.5.0") then
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

  vim.cmd("autocmd TermClose <buffer> lua require('terminal'):close()")
end


function Terminal.run_active_buffer()
  local filename = vim.fn.expand('%')
  local filetype = vim.bo.filetype

  t = Window.new():open()
  vim.fn.termopen('python3' .. ' ' .. filename)
end


return Terminal
