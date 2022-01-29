" let g:lightline = {}
" let g:lightline.colorscheme = 'catppuccin'

" let g:lightline.active = {
"       \ 'left': [ [ 'mode', 'paste' ],
"       \           [ 'gitbranch'],
"       \           [ 'filename_active', 'modified' ] ],
"       \ 'right': [ [ 'lineinfo', 'percent' ],
"       \            [ '' ],
"       \            [ 'wordcount' ] ]
"       \ }

" let g:lightline.inactive = {
"       \ 'left': [ [''],
"       \           [''],
"       \           [ 'filename_inactive' ] ],
"       \ 'right': [ [ '' ],
"       \            [ '' ] ]
"       \ }

" let g:lightline.component_function = {
"       \ 'filename_active': 'LightlineFileNameActive',
"       \ 'filename_inactive': 'LightlineFileNameInactive',
"       \ 'gitbranch': 'LightlineGitBranch',
"       \ 'lineinfo': 'LightlineLineInfo',
"       \ 'percent': 'LightlinePercent',
"       \ 'wordcount': 'LightlineWordCount',
"       \ }

" let g:lightline.separator = { 'left': '', 'right': '' }
" let g:lightline.subseparator = { 'left': '', 'right': ' ' }

" function! LightlineGitBranch()
"   try
"     if exists('*FugitiveHead')
"       let mark = ' '
"       let branch = FugitiveHead()
"       return branch !=# '' ? mark.branch : ''
"     endif
"   catch
"   endtry
"   return ''
" endfunction

" function! LightlineFileNameActive()
"   return LightlineFileName(1)
" endfunction

" function! LightlineFileNameInactive()
"   return LightlineFileName(0)
" endfunction

" function! LightlineFileName(active)
"   return (expand('%:t') != '' ? expand('%:t') : '[NO NAME]')
" endfunction

" function! LightlineLineInfo()
"   return printf('%3d:%-2d', line('.'), col('.'))
" endfunction

" function! LightlinePercent()
"   return ((100 * line('.') / line('$')) . '%')
" endfunction

" function! LightlineWordCount()
"   if (&ft == 'markdown' || &ft == 'text')
"     return wordcount().words
"   endif
"   return ''
" endfunction

