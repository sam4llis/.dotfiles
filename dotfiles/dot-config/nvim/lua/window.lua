local window = {
  buf = nil,
  win = nil,
  pid = nil,
}

window.open = function ()
  local buf = nil

  if window.buf and vim.api.nvim_buf_is_loaded(window.buf) then
    buf = window.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  -- NOTE: look at lsp for better config here.
  local width = math.floor(vim.o.columns * 0.50)
  local height = math.floor(vim.o.lines * 0.50)
  local row = math.floor(1)
  local col = math.floor((vim.o.columns - width) -4)
  -- local width = math.floor(vim.o.columns * 0.8)
  -- local height = math.floor(vim.o.lines * 0.8)
  -- local row = math.floor(((vim.o.lines - height) / 2) - 1)
  -- local col = math.floor((vim.o.columns - width) / 2)

  local opts = {
    relative = 'editor',
    row = row,
    col = col,
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

  window.win = vim.api.nvim_open_win(buf, true, opts)
  vim.opt.winblend = 0
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
