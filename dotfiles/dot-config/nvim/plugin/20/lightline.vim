let g:lightline = {}
let g:lightline.colorscheme = 'catppuccin'
let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'gitbranch', 'readonly', 'filename_active', 'modified'] ],
      \ 'right': [[ 'lineinfo' ],
      \           [ 'percent' ],
      \           [ 'fileformat', 'fileencoding', 'filetype' ]]
      \ }
let g:lightline.inactive = {
      \ 'left': [ [ 'filename_inactive' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ] ]
      \ }
let g:lightline.component_function = {
      \ 'fileencoding': 'LightlineFileEncoding',
      \ 'fileformat': 'LightlineFileFormat',
      \ 'filename_active': 'LightlineFileNameActive',
      \ 'filename_inactive': 'LightlineFileNameInactive',
      \ 'filetype': 'LightlineFileType',
      \ 'gitbranch': 'LightlineGitBranch',
      \ 'lineinfo': 'LightlineLineInfo',
      \ 'mode': 'LightlineMode',
    \ 'percent': 'LightlinePercent',
      \ 'readonly': 'LightlineReadonly',
      \ }

let lightline_ft_visible_condition = '&ft !~ "defx\\|help\\|tagbar"'

let g:lightline.component_function_visible_condition = {
      \ 'fileencoding': lightline_ft_visible_condition,
      \ 'fileformat': lightline_ft_visible_condition,
      \ 'filetype': lightline_ft_visible_condition,
      \ 'lineinfo': lightline_ft_visible_condition,
      \ 'percent': lightline_ft_visible_condition
      \ }

let g:lightline.separator = { 'left': "", 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

function! LightlineIsExcludedFileType()
  return (&ft =~? 'defx\|help\|tagbar\|Mundo\|MundoDiff')
endfunction

function! LightlineMode()
  return (&ft == 'tagbar' ? 'Tagbar' :
        \ &ft == 'defx' ? 'Defx' :
        \ &ft == 'help' ? 'Help' :
        \ &ft == 'Mundo' ? 'Mundo' :
        \ &ft == 'MundoDiff' ? 'MundoDiff' :
        \ winwidth(0) > 60 ? lightline#mode() : '')
endfunction

function! LightlineGitBranch()
  try
    if !LightlineIsExcludedFileType() && exists('*FugitiveHead')
      let mark = ' '
      let branch = FugitiveHead()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineReadonly()
  return !LightlineIsExcludedFileType() && &readonly ? 'RO' : ''
endfunction

function! LightlineFileNameActive()
  return LightlineFileName(1)
endfunction

function! LightlineFileNameInactive()
  return LightlineFileName(0)
endfunction

function! LightlineFileName(active)
  return (&ft == 'defx' && a:active ? '' :
        \ &ft == 'defx' && !a:active ? 'defx' :
        \ &ft == 'tagbar' && a:active ? '' :
        \ &ft == 'tagbar' && !a:active ? 'tagbar' :
        \ &ft == 'Mundo' && a:active ? '' :
        \ &ft == 'Mundo' &&  !a:active ? 'Mundo' :
        \ &ft == 'MundoDiff' && a:active ? '' :
        \ &ft == 'MundoDiff' && !a:active ? 'MundoDiff' :
        \ expand('%:t') != '' ? expand('%:t') : '[No Name]')
endfunction

function! LightlineLineInfo()
  return (LightlineIsExcludedFileType() ? '' :
        \ printf('%3d:%-2d', line('.'), col('.')))
endfunction

function! LightlinePercent()
  return (LightlineIsExcludedFileType() ? '' :
        \ (100 * line('.') / line('$')) . '%')
endfunction

function! LightlineFileEncoding()
  return (LightlineIsExcludedFileType() ? '' :
        \ winwidth(0) > 70 ? &fileencoding : '')
endfunction

function! LightlineFileFormat()
  return (LightlineIsExcludedFileType() ? '' :
        \ winwidth(0) > 70 ? &fileformat : '')
endfunction

function! LightlineFileType()
  return (LightlineIsExcludedFileType() ? '' :
        \ winwidth(0) > 70 ? (&filetype !=# '' ? &filetype: '[No Filetype]') : '')
endfunction
