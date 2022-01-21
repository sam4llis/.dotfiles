set path+=**

set hidden                                      " Hide buffers when abandoned.
set backspace=indent,eol,start                  " Sane backspacing behaviour.

set history=5000                                " Remember more cmdline history.
set showcmd                                     " Show (partial) command in last line of screen.

set number relativenumber                       " Line numbering.

set mouse=a                                     " Enable mouse inputs in most contexts.

set nojoinspaces                                " Never add additional spacing when joining lines.
set nowrap                                      " Don't word wrap.

" Recognise numbered lists.
set fo+=n

set autoindent                                  " Copy indent from current line when starting a new line.
set expandtab                                   " Expand tabs to the appropriate number of spaces.

set list                                        " Enable list mode.
set listchars=tab:>-,trail:x,extends:>,precedes:<,nbsp:+

set shiftround
set shiftwidth=4 tabstop=4

set incsearch                                   " Search incrementally.
set ignorecase                                  " Case-insensitive search by default.
set smartcase                                   " Smart case sensitivity.
set spelllang=en_gb                             " British English for spell checking.

set lazyredraw                                  " Do not redraw screen while executing macros, etc.
set updatetime=100

set splitbelow splitright                       " Sane split behaviour.

set wildmenu                                    " Command-mode completion.
set wildmode=full

" Tell Vim to look for tags in the directory of the current file, the working
" directory, and in every parent directory, recursively.
set tags=./tags;,tags;

syntax on

set ruler                                       " Enable ruler.
set foldcolumn=2                                " Set the width of the fold column.
set scrolloff=5                                 " Set the minimum number of screen lines above/below cursor.
set sidescrolloff=10                            " Set the minimum number of screen lines left/right of the cursor.
set cursorcolumn cursorline                     " Cursor crosshair.
set showcmd                                     " Show command in the last line of the screen.
set signcolumn=yes                              " Always show sign column.

set foldopen=hor,mark,percent,quickfix,search,tag,undo

" netrw settings.
let g:netrw_banner=0                            " Disable netrw's header.
let g:netrw_keepdir = 0                         " Keep the current directory the same as the browsing directory.
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'  " Hide dotfiles on load.
hi! link netrwMarkFile Search                   " Highlight marked files.

set encoding=utf-8

" The Silver Searcher
" Use ag over grep if available.
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
  set grepformat^=%f:%l:%c:%m " file:line:column:message
endif
