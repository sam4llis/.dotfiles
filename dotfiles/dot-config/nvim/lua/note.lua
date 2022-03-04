-- TODO: add checkbox functionality in the window.
if not vim.fn.has("nvim") then
  return
end

Note = {}
Note.__index = Note
setmetatable(Note, require('window'))


function Note:open()
  local fdir  = '~/notes/' -- todo: if not exist, create this!
  local fdate = vim.fn.strftime('%d-%m-%y')
  local fname = fdir .. 'note-' .. fdate .. '.md'

  Window.open(self)
  vim.b.fname = fname
  vim.cmd("execute 'edit' b:fname")

  if vim.fn.filereadable(vim.fn.expand(fname)) == 0 then
    vim.b.title = '# Notes for (' .. fdate .. '):'
    vim.cmd("execute 'normal i' b:title")
    vim.cmd("execute 'normal o'")
    vim.cmd("execute 'normal o- [ ] '")
  end
  vim.cmd("autocmd BufHidden <buffer> lua require('note'):close()")
end


function Note:toggle(save)
  if self.win and save then
    vim.cmd('write')
  end

  Window.toggle(self)
end


return Note
