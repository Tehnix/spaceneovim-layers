let g:lmap.e = get(g:lmap, 'e', { 'name': '+errors' })
SpNMap 'er', 'neomake-check-file', 'Neomake'
SpNMap 'ev', 'neomake-version', 'NeomakeInfo'
SpNMap 'el', 'neomake-error-list', 'lopen'
SpNMap 'ec', 'neomake-close-error-list', 'lclose'
SpNMap 'en', 'neomake-next-error', 'lnext'
SpNMap 'ep', 'neomake-previous-error', 'lprevious'

SpNMap 'eC', 'quickfix-close-error-list', 'ccopen'
SpNMap 'eL', 'quickfix-error-list', 'copen'
SpNMap 'eN', 'quickfix-next-error', 'cn'
SpNMap 'eP', 'quickfix-previous-error', 'cp'

augroup neomakeConfig
  au!
  " Run Neomake automatically on buffer save
  au BufEnter * Neomake
  au BufWritePost * Neomake
augroup END
