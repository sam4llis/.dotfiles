let s:cp = {
  \ 'rosewater': "#F5E0DC",
  \ 'flamingo': "#F2CDCD",
  \ 'mauve': "#DDB6F2",
  \ 'pink': "#F5C2E7",
  \ 'red': "#F28FAD",
  \ 'maroon': "#E8A2AF",
  \ 'peach': "#F8BD96",
  \ 'yellow': "#FAE3B0",
  \ 'green': "#ABE9B3",
  \ 'blue': "#96CDFB",
  \ 'sky': "#89DCEB",
  \ 'teal': "#B5E8E0",
  \ 'lavender': "#C9CBFF",
  \ 'white': "#D9E0EE",
  \ 'gray2': "#C3BAC6",
  \ 'gray1': "#988BA2",
  \ 'gray0': "#6E6C7E",
  \ 'black4': "#575268",
  \ 'black3': "#302D41",
  \ 'black2': "#1E1E2E",
  \ 'black1': "#1A1826",
  \ 'black0': "#161320",
  \ }

let s:currentmode = {
  \  'n' : 'NORMAL',
  \  'no' : 'N·OPERATOR PENDING',
  \  'v' : 'VISUAL',
  \  'V' : 'V-LINE',
  \  '^V' : 'V-BLOCK',
  \  's' : 'SELECT',
  \  'S': 'S-LINE',
  \  '^S' : 'S-BLOCK',
  \  'i' : 'INSERT',
  \  'R' : 'REPLACE',
  \  'Rv' : 'V-REPLACE',
  \  'c' : 'COMMAND',
  \  'cv' : 'VIM EX',
  \  'ce' : 'EX',
  \  'r' : 'PROMPT',
  \  'rm' : 'MORE',
  \  'r?' : 'CONFIRM',
  \  '!' : 'SHELL',
  \  't' : 'TERMINAL'
  \  }

let s:icons = {
  \ 'python': ' ',
  \ 'typescript': ' ',
  \ 'html':  ' ',
  \ 'vim': ' ',
  \ 'scss': ' ',
  \ 'css': ' ',
  \ 'javascript': ' ',
  \ 'javascriptreact': ' ',
  \ 'rust': ' ',
  \ 'ruby': ' ',
  \ 'cpp': ' ',
  \ 'c': ' ',
  \ 'go': ' ',
  \ 'lua': ' ',
  \ }


execute 'hi Base guifg=' . s:cp.black1 ' guibg=' . s:cp.black1
execute 'hi ModeText guifg=' . s:cp.black1 ' guibg=' . s:cp.rosewater . ' gui=bold'
execute 'hi GitText guifg=' . s:cp.black1 ' guibg=' . s:cp.lavender . ' gui=bold'
execute 'hi FileNameText guifg=' . s:cp.white ' guibg=' . s:cp.black3
execute 'hi FileNameTextInactive guifg=' . s:cp.white ' guibg=' . s:cp.black1
execute 'hi FileTypeText guifg=' . s:cp.white ' guibg=' . s:cp.black3
execute 'hi ParentText guifg=' . s:cp.black1 ' guibg=' . s:cp.lavender
execute 'hi LineText guifg=' . s:cp.black1 ' guibg=' . s:cp.rosewater . ' gui=bold'


function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = get(s:currentmode, l:modecurrent, '')
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction


function! GitBranch()
  if exists('*fugitive#head()')
    return ' ' . fugitive#head()
  else
    return ' ' . ' NONE'
  endif
endfunction


function! FileIcon() abort
    return get(s:icons, &filetype, ' ')
endfunction


function! ActiveLine()
    let statusline = ''
    let statusline .= '%#Base#'                                   " Background colour.

    " Current Mode.
    let statusline .= "%#ModeText#%{repeat('\ ', 3)}"             " Spacer.
    let statusline .= '%#ModeText#%{ModeCurrent()}'               " Content.
    let statusline .= "%#ModeText#%{repeat('\ ', 3)}"             " Spacer.

  " Current Git Branch.
    let statusline .= "%#GitText#%{repeat('\ ', 3)}"              " Spacer.
    let statusline .= "%#GitText#%{GitBranch()}"                  " Content.
    let statusline .= "%#GitText#%{repeat('\ ', 3)}"              " Spacer.

    " Filename.
    let statusline .= "%#FileNameText#%{repeat('\ ', 3)}"         " Spacer.
    let statusline .= "%#FileNameText#%t"                         " Content.
    let statusline .= "%#FileNameText#%{repeat('\ ', 1)}"         " Spacer.
    let statusline .= '%#FileNameText#%{&modified?"[+]":""}'      " Content.

    let statusline .= '%='

    " Filetype and File Icon.
    let statusline .= "%#FileTypeText#%{repeat('\ ', 3)}"         " Spacer.
    let statusline .= "%#FileTypeText#%{FileIcon()}%{&filetype}"  " Content.
    let statusline .= "%#FileTypeText#%{repeat('\ ', 3)}"         " Spacer.

    " Parent Folder.
    let statusline .= "%#ParentText#%{repeat('\ ', 3)}"           " Spacer.
    let statusline .= "%#ParentText# %{expand('%:p:h:t')}"       " Content.
    let statusline .= "%#ParentText#%{repeat('\ ', 3)}"           " Spacer.

    " Line and Column Number.
    let statusline .= "%#LineText#%{repeat('\ ', 3)}"             " Spacer.
    let statusline .= "%#LineText#%l:%c"                          " Content
    let statusline .= "%#LineText#%{repeat('\ ', 2)}"             " Spacer.

    return statusline
endfunction


function! InactiveLine()
    let statusline = ''
    let statusline .= "%#FileNameTextInactive# %{expand('%:p:h:t')}/%t"
    return statusline
endfunction

augroup StatusLine
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
  autocmd FileType netrw setlocal statusline=%!ActiveLine()
  autocmd FileType,BufEnter dbui setlocal statusline=%!InactiveLine()
augroup END
