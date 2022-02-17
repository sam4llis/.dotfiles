" These are set by default in Neovim.
if !has("nvim")


endif

syntax on
set autoindent                                  " Copy indent from current line when starting a new line.
set backspace=indent,eol,start                  " Sane backspacing behaviour.
set encoding=utf-8
set history=5000                                " Remember more cmdline history.
set hidden                                      " Hide buffers when abandoned.
set incsearch                                   " Search incrementally.
set laststatus=2
set nojoinspaces                                " Never add additional spacing when joining lines.
set listchars=tab:>-,trail:x,extends:>,precedes:<,nbsp:+
set ruler                                       " Enable ruler.
set shortmess+=c
set showcmd                                     " Show command in the last line of the screen.

" Tell Vim to look for tags in the directory of the current file, the working
" directory, and in every parent directory, recursively.
set tags=./tags;,tags;

set showcmd                                     " Show (partial) command in last line of screen.
set wildmenu                                    " Command-mode completion.

set path+=**
set number relativenumber                       " Line numbering.
set mouse=a                                     " Enable mouse inputs in most contexts.
set nowrap                                      " Don't word wrap.
set fo+=n                                       " Recognise numbered lists.
set expandtab                                   " Expand tabs to the appropriate number of spaces.
set list                                        " Enable list mode.
set shiftround
set shiftwidth=4 tabstop=4

set ignorecase                                  " Case-insensitive search by default.
set smartcase                                   " Smart case sensitivity.
set spelllang=en_gb                             " British English for spell checking.

set lazyredraw                                  " Do not redraw screen while executing macros, etc.
set updatetime=100

set splitbelow splitright                       " Sane split behaviour.

set wildmode=full
set noshowmode                                  " Do not show modes in command line.

set foldcolumn=2                                " Set the width of the fold column.
set scrolloff=5                                 " Set the minimum number of screen lines above/below cursor.
set sidescrolloff=10                            " Set the minimum number of screen lines left/right of the cursor.
set cursorcolumn cursorline                     " Cursor crosshair.
set signcolumn=yes                              " Always show sign column.

set foldopen=hor,mark,percent,quickfix,search,tag,undo
