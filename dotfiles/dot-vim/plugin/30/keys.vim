" <space> is leader.
let mapleader=' '
let maplocalleader=' '

" Disable ex mode.
nnoremap Q <nop>

" Normalise search direction behaviour.
nnoremap <expr> n (v:searchforward ? 'n' : 'N')
nnoremap <expr> N (v:searchforward ? 'N' : 'n')
onoremap <expr> n (v:searchforward ? 'n' : 'N')
onoremap <expr> N (v:searchforward ? 'N' : 'n')
xnoremap <expr> n (v:searchforward ? 'n' : 'N')
xnoremap <expr> N (v:searchforward ? 'N' : 'n')

cabbr <expr> %%  getcmdtype() == ':' ? fnameescape(expand('%:h')) : '%%'
" ;t can be used to easily write TODO comments.
iabbr <expr> ;t "TODO(" . $USER . "):"
" ;n can be used to easily write NOTE comments.
iabbr <expr> ;n "NOTE(" . $USER . "):"
" ;f can be used to easily write FIXME comments.
iabbr <expr> ;f "FIXME(" . $USER . "):"

nnoremap <leader>q @q

nnoremap <leader>w :TrimWhitespace<CR>
vnoremap <leader>w :TrimWhitespace<CR>

vnoremap <leader>c :%!column -t<CR>

vnoremap <leader>s :sort<CR>
vnoremap <leader>S :sort!<CR>
nnoremap <expr> <leader>s SortOp()
nnoremap <expr> <leader>S ReverseSortOp()

vnoremap <leader>q :norm! @q<CR>

nmap <leader>o "+y
vnoremap <leader>o "+y

if has("nvim")
    " Telescope mappings.
    " nnoremap <silent> <leader>ff <cmd>Telescope find_files<CR>
    " nnoremap <silent> <leader>fg <cmd>Telescope live_grep<CR>
    " nnoremap <silent> <leader>fb <cmd>Telescope buffers<CR>
    nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
    nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<CR>
    nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<CR>
    nnoremap <leader>fn <cmd>lua require('telescope.builtin').find_files({prompt_title='Find Notes', cwd='~/notes/'})<CR>

    " Floating terminal mappings.
    tnoremap <silent> <C-z> <C-\><C-n>:lua require('terminal'):toggle()<CR>
    nnoremap <silent> <C-z> :lua require('terminal'):toggle()<CR>

    " Floating note mappings.
    nnoremap <silent> <leader>n :lua require('note'):toggle(true)<CR>

endif

" Ragtag mappings.
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1
