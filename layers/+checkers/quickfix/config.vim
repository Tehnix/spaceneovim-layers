let g:lmap.e = get(g:lmap, 'e', { 'name': '+errors' })
SpNMap 'eC', 'quickfix/close-error-list', 'cclose'
SpNMap 'eL', 'quickfix/error-list', 'copen'
SpNMap 'eN', 'quickfix/next-error', 'cnext'
SpNMap 'eP', 'quickfix/previous-error', 'cprevious'
SpNMap 'eF', 'quickfix/first-error', 'cfirst'
SpNMap 'eE', 'quickfix/last-error', 'clast'

let g:lmap.e.l = get(g:lmap.e, 'l', { 'name': '+loc' })
SpNMap 'elc', 'loc/close-error-list', 'lclose'
SpNMap 'ell', 'loc/error-list', 'lopen'
SpNMap 'eln', 'loc/next-error', 'lnext'
SpNMap 'elp', 'loc/previous-error', 'lprevious'
SpNMap 'elf', 'loc/first-error', 'lfirst'
SpNMap 'ele', 'loc/last-error', 'llast'
