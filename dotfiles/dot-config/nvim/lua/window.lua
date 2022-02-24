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


window.get_opts = function (opts)
  opts = get_defaults(opts, window.defs)

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


local window = {
  buf = nil,
  win = nil,
  pid = nil,
  defs = {
    winblend = 15,
    percentage = 0.9,
  },
}


window.open = function ()
  local buf = nil

  if window.buf and vim.api.nvim_buf_is_loaded(window.buf) then
    buf = window.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local opts = window.get_opts()

  window.win = vim.api.nvim_open_win(buf, true, opts)
  return buf
end


window.close = function(force)
  if not window.win then
    return
  end

  if vim.api.nvim_win_is_valid(window.win) then
    vim.api.nvim_win_close(window.win, false)
    window.win = nil
  end

  if force then
    if vim.api.nvim_buf_is_loaded(window.buf) then
      vim.api.nvim_buf_delete(window.buf, { force = true })
    end

    vim.fn.jobstop(window.pid)

    window.buf = nil
    window.pid = nil
  end
end


return window
