let g:lmap.e = get(g:lmap, 'e', { 'name': '+errors' })
SpNMap 'er', 'neomake/check-file', 'Neomake'
SpNMap 'ev', 'neomake/version', 'NeomakeInfo'
SpNMap 'eL', 'neomake/error-list', 'lopen'
SpNMap 'eC', 'neomake/close-error-list', 'lclose'
SpNMap 'eN', 'neomake/next-error', 'lnext'
SpNMap 'eP', 'neomake/previous-error', 'lprevious'

SpNMap 'ec', 'quickfix/close-error-list', 'ccopen'
SpNMap 'el', 'quickfix/error-list', 'copen'
SpNMap 'en', 'quickfix/next-error', 'cn'
SpNMap 'ep', 'quickfix/previous-error', 'cp'

augroup neomakeConfig
  au!
  " Run Neomake automatically on buffer save
  au BufEnter * Neomake
  au BufWritePost * Neomake
augroup END
