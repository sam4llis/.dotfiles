" <space> is leader.
let mapleader=' '
let maplocalleader=' '

" Disable ex mode.
nnoremap Q <nop>

" Normalise search direction behaviour.
nnoremap <expr> n (v:searchforward ? 'n' : 'N')
nnoremap <expr> N (v:searchforward ? 'N' : 'n')

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

tnoremap <expr> ;# expand("#")
tnoremap <expr> ;## expand("##")

nmap <leader>o "+y
vnoremap <leader>o "+y

if has("nvim")
    " Telescope mappings.
    nnoremap <silent> <leader>ff <cmd>Telescope find_files<CR>
    nnoremap <silent> <leader>fg <cmd>Telescope live_grep<CR>
    nnoremap <silent> <leader>fb <cmd>Telescope buffers<CR>

    " Lightspeed mappings.
    nmap ; <Plug>Lightspeed_;_ft
    nmap , <Plug>Lightspeed_,_ft

    " Floating terminal mapping.
    nnoremap <silent> <leader>t :call FloatTerminal()<CR>
endif

" Ragtag mappings.
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

nmap <silent> <leader>n :call QuickNote() <CR>
