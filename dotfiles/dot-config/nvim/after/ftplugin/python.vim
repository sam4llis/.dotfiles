function! SetupMarks() abort
  execute '0/def main/mark z'
  execute '0/import/mark i'
endfunction

augroup python_marks
  autocmd!
  autocmd BufEnter *.py silent! call SetupMarks()
augroup END

" Autocomplete Character Mappings:
inoremap <buffer> __ ____<esc>hi

" Run active buffer.
nnoremap <silent> <leader>r :lua require('terminal').run_active_buffer('python3', true)<CR>

" Load IPython REPL.
" tnoremap <silent> <C-\><C-r> <C-\><C-n>:lua require('terminal').run_repl('ipython')<CR>
" nnoremap <silent> <C-\><C-r> :lua require('terminal').run_repl('ipython')<CR>

lua <<EOF

local ts_utils = require("nvim-treesitter.ts_utils")

toggle_fstring = function()
    local winnr = 0
    local cursor = vim.api.nvim_win_get_cursor(winnr)
    local node = ts_utils.get_node_at_cursor()

    while (node ~= nil) and (node:type() ~= "string") do
        node = node:parent()
    end
    if node == nil then
        print("f-string: not in string node :(")
        return
    end

    local srow, scol, ecol, erow = ts_utils.get_vim_range({ node:range() })
    vim.fn.setcursorcharpos(srow, scol)
    local char = vim.api.nvim_get_current_line():sub(scol, scol)
    local is_fstring = (char == "f")

    if is_fstring then
        vim.cmd("normal x")
        -- if cursor is in the same line as text change
        if srow == cursor[1] then
            cursor[2] = cursor[2] - 1 -- negative offset to cursor
        end
    else
        vim.cmd("normal if")
        -- if cursor is in the same line as text change
        if srow == cursor[1] then
            cursor[2] = cursor[2] + 1 -- positive offset to cursor
        end
    end
    vim.api.nvim_win_set_cursor(winnr, cursor)
end

vim.keymap.set('n', '<leader>tf', toggle_fstring, { noremap = true })
vim.api.nvim_create_user_command('Fstring', toggle_fstring, {})

EOF
