let g:lmap.e = get(g:lmap, 'e', { 'name': '+errors' })
SpNMap 'eC', 'quickfix/close-error-list', 'cclose'
SpNMap 'eL', 'quickfix/error-list', 'copen'
SpNMap 'eN', 'quickfix/next-error', 'cnext'
SpNMap 'eP', 'quickfix/previous-error', 'cprevious'
SpNMap 'eF', 'ale/first-error', 'cfirst'
SpNMap 'eE', 'ale/last-error', 'clast'
