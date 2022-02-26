if not vim.fn.has("nvim-0.5.0") then
    return
end

Window = {}
Window.__index = Window


function Window.new(opts)
  local instance = setmetatable({}, Window)

  -- Initialise variables.
  instance.buf  = -1
  instance.win  = nil
  instance.pid  = nil
  instance.opts = opts

  return instance
end


function Window:open()
  local buf

  if self.buf and vim.api.nvim_buf_is_loaded(self.buf) then
    buf = self.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local opts = get_opts()
  self.win = vim.api.nvim_open_win(buf, true, opts)
  self.buf = buf

end


function Window:close(force)
  if not self.win then
    return
  end

  if vim.api.nvim_win_is_valid(self.win) then
    vim.api.nvim_win_close(self.win, false)
    self.win = nil
  end

  if force then
    vim.fn.jobstop(self.pid)

    if vim.api.nvim_buf_is_loaded(self.buf) then
      vim.api.nvim_buf_delete(self.buf, { force = true })
    end

    self.buf = -1
    self.win = nil
    self.pid = nil
  end
end


function Window:toggle(cmd)
  if not self.win then
    self:open(cmd)
  else
    self:close()
  end
end


-- -- Create a new window instance.
-- function Window:new (defs)
--   local o = {
--     buf = nil,
--     win = nil,
--     pid = nil,
--     defs = defs,
--   }

--   return setmetatable(o, { __index = self })
-- end


-- function Window:open ()
--   local buf = nil

--   print('foo')
--   print(w.defs)

--   if self.buf and vim.api.nvim_buf_is_loaded(self.buf) then
--     buf = self.buf
--   else
--     buf = vim.api.nvim_create_buf(false, true)
--   end

--   local opts = self.get_opts()

--   self.win = vim.api.nvim_open_win(buf, true, opts)
--   return buf
-- end


-- function Window:close (force)
--   if not self.win then
--     return
--   end

--   if vim.api.nvim_win_is_valid(self.win) then
--     vim.api.nvim_win_close(self.win, false)
--     self.win = nil
--   end

--   if force then
--     if vim.api.nvim_buf_is_loaded(self.buf) then
--       vim.api.nvim_buf_delete(self.buf, { force = true })
--     end

--     vim.fn.jobstop(self.pid)

--     self.buf = nil
--     self.pid = nil
--   end
-- end

-- w = Window:new ({winblend=15, percentage=0.8})
-- w:open()






-- window = {
--   buf = nil,
--   win = nil,
--   pid = nil,
--   defs = {
--     winblend = 15,
--     percentage = 0.8,
--   },
-- }


local function get_defaults(opts, defs)
  if opts == nil then
    opts = {}
  end

  opts = vim.deepcopy(opts)

  for k, v in pairs(defs) do
    if opts[k] == nil then
      opts[k] = v
    end
  end

  return opts
end


-- window.get_opts = function (opts)
function get_opts(opts)
  -- local opts = get_defaults(opts, defs)
  local opts = get_defaults(opts, {percentage=0.8, winblend=15})

  local width = math.floor(vim.o.columns * opts.percentage)
  local height = math.floor(vim.o.lines * opts.percentage)

  local top = math.floor(((vim.o.lines - height) / 2) - 1)
  local left = math.floor((vim.o.columns - width) / 2)

  local opts = {
    relative = 'editor',
    row = top,
    col = left,
    width = width,
    height = height,
    style = 'minimal',
    border = {
      { ' ', 'NormalFloat' },
      { ' ', 'NormalFloat' },
      { ' ', 'NormalFloat' },
      { ' ', 'NormalFloat' },
      { ' ', 'NormalFloat' },
      { ' ', 'NormalFloat' },
      { ' ', 'NormalFloat' },
      { ' ', 'NormalFloat' },
    },
  }

  return opts
end


return Window
