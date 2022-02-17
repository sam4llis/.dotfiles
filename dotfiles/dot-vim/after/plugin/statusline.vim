let g:assets = {
  \ 'bar' : '█',
  \ 'slant_l' : '',
  \ 'slant_r' : '',
  \ 'slant_l2' : '',
  \ 'slant_r2' : '',
  \ }

let g:cp = {
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

let g:currentmode = {
  \  'n' : 'NORMAL',
  \  'no' : 'N·OPERATOR PENDING',
  \  'v' : 'VISUAL',
  \  'V' : 'V·LINE',
  \  '^V' : 'V·BLOCK',
  \  's' : 'SELECT',
  \  'S': 'S·LINE',
  \  '^S' : 'S·BLOCK',
  \  'i' : 'INSERT',
  \  'R' : 'REPLACE',
  \  'Rv' : 'V·REPLACE',
  \  'c' : 'COMMAND',
  \  'cv' : 'VIM EX',
  \  'ce' : 'EX',
  \  'r' : 'PROMPT',
  \  'rm' : 'MORE',
  \  'r?' : 'CONFIRM',
  \  '!' : 'SHELL',
  \  't' : 'TERMINAL'
  \  }

let g:icons = {
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

execute 'hi Base guifg=' . g:cp.black1 ' guibg=' . g:cp.black1
execute 'hi ModeText guifg=' . g:cp.black1 ' guibg=' . g:cp.rosewater . ' gui=bold'
execute 'hi ModeSpace guifg=' . g:cp.rosewater ' guibg=' . g:cp.black1
execute 'hi ModeSep guifg=' . g:cp.rosewater ' guibg=' . g:cp.lavender

execute 'hi GitText guifg=' . g:cp.black1 ' guibg=' . g:cp.lavender . ' gui=bold'
execute 'hi GitSpace guifg=' . g:cp.lavender ' guibg=' . g:cp.black1
execute 'hi GitSep guifg=' . g:cp.lavender ' guibg=' . g:cp.black3

execute 'hi FileNameText guifg=' . g:cp.white ' guibg=' . g:cp.black3
execute 'hi FileNameTextInactive guifg=' . g:cp.white ' guibg=' . g:cp.black1
execute 'hi FileNameSpace guifg=' . g:cp.black3 ' guibg=' . g:cp.black3
execute 'hi FileNameSep guifg=' . g:cp.black3 ' guibg=' . g:cp.black1

execute 'hi FileTypeText guifg=' . g:cp.white ' guibg=' . g:cp.black3
execute 'hi FileTypeSpace guifg=' . g:cp.black3 ' guibg=' . g:cp.black3
execute 'hi FileTypeSep guifg=' . g:cp.black3 ' guibg=' . g:cp.black1

execute 'hi ParentText guifg=' . g:cp.black1 ' guibg=' . g:cp.lavender
execute 'hi ParentSpace guifg=' . g:cp.lavender ' guibg=' . g:cp.red
execute 'hi ParentSep guifg=' . g:cp.lavender ' guibg=' . g:cp.black3

execute 'hi LineText guifg=' . g:cp.black1 ' guibg=' . g:cp.rosewater . ' gui=bold'
execute 'hi LineSpace guifg=' . g:cp.rosewater ' guibg=' . g:cp.rosewater
execute 'hi LineSep guifg=' . g:cp.rosewater ' guibg=' . g:cp.lavender


function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = get(g:currentmode, l:modecurrent, '')
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction


function! GitBranch()
  if exists('*fugitive#head()')
    return ' ' . fugitive#head()
  else
    return ' ' . '[-] '
  endif
endfunction


function! FileIcon() abort
    return get(g:icons, &filetype, ' ')
endfunction


function! ActiveLine()
    let statusline = ''

    let statusline .= '%#Base#'                                     " Background colour.

    " Current Mode.
    let statusline .= "%#ModeSpace#%{g:assets.bar}"                 " Spacer.
    let statusline .= '%#ModeText#%{ModeCurrent()}'                 " Content.
    let statusline .= "%#ModeSpace#%{g:assets.bar}"                 " Spacer.
    let statusline .= '%#ModeSep#%{g:assets.slant_r2}'              " Right separation.

  " Current Git Branch.
    let statusline .= "%#GitSpace#%{g:assets.bar}"                  " Spacer.
    let statusline .= '%#GitText#%{GitBranch()}'                    " Content.
    let statusline .= "%#GitSpace#%{g:assets.bar}"                  " Spacer.
    let statusline .= '%#GitSep#%{g:assets.slant_r2}'               " Right separation.

    " Filename.
    let statusline .= "%#FileNameSpace#%{g:assets.bar}"             " Spacer.
    let statusline .= '%#FileNameText#%t'                           " Content.
    let statusline .= "%#FileNameSpace#%{g:assets.bar}"             " Spacer.
    let statusline .= '%#FileNameText#%{&modified?"[+] ":""}'       " Content.
    let statusline .= '%#FileNameSep#%{g:assets.slant_r2}'          " Right separation.

    let statusline .= '%='

    " Filetype and File Icon.
    let statusline .= '%#FileTypeSep#%{g:assets.slant_l}'           " Left separation.
    let statusline .= "%#FileTypeSpace#%{g:assets.bar}"             " Spacer.
    let statusline .= "%#FileTypeText#%{FileIcon()}%{&filetype}"    " Content.
    let statusline .= "%#FileTypeSpace#%{g:assets.bar}"             " Spacer.

    " Parent Folder.
    let statusline .= '%#ParentSep#%{g:assets.slant_l}'             " Left separation.
    let statusline .= "%#ParentSpace#%{g:assets.bar}"               " Spacer.
    let statusline .= "%#ParentText# %{expand('%:p:h:t')}"         " Content.
    let statusline .= "%#ParentSpace#%{g:assets.bar}"               " Spacer.

    " Line and Column Number.
    let statusline .= '%#LineSep#%{g:assets.slant_l}'               " Left separation
    let statusline .= "%#LineSpace#%{g:assets.bar}"                 " Spacer.
    let statusline .= "%#LineText#%l:%c"                            " Content
    let statusline .= "%#LineSpace#%{g:assets.bar}"                 " Spacer.

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
