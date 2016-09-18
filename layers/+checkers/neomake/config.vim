let g:lmap.e = { 'name': '+errors' }
call SpaceNeovimNMap('er', 'neomake-check-file', 'Neomake')
call SpaceNeovimNMap('ev', 'neomake-version', 'NeomakeInfo')
call SpaceNeovimNMap('el', 'neomake-error-list', 'lopen')
call SpaceNeovimNMap('ec', 'neomake-close-error-list', 'lclose')
call SpaceNeovimNMap('en', 'neomake-next-error', 'lnext')
call SpaceNeovimNMap('ep', 'neomake-previous-error', 'lprevious')

call SpaceNeovimNMap('eC', 'quickfix-close-error-list', 'ccopen')
call SpaceNeovimNMap('eL', 'quickfix-error-list', 'copen')
call SpaceNeovimNMap('eN', 'quickfix-next-error', 'cn')
call SpaceNeovimNMap('eP', 'quickfix-previous-error', 'cp')

augroup neomakeConfig
  au!
  " Run Neomake automatically on buffer save
  au BufEnter * Neomake
  au BufWritePost * Neomake
augroup END
