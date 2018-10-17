let g:lmap.e = get(g:lmap, 'e', { 'name': 'errors' })
SpNMap 'er', 'neomake/check-file', 'Neomake'
SpNMap 'el', 'neomake/error-list', 'lopen'
SpNMap 'ec', 'neomake/close-error-list', 'lclose'
SpNMap 'en', 'neomake/next-error', 'lnext'
SpNMap 'ep', 'neomake/previous-error', 'lprevious'

augroup neomakeConfig
  au!
  " Run Neomake automatically on buffer save
  au BufEnter * Neomake
  au BufWritePost * Neomake
augroup END

let g:neomake_open_list = 0
