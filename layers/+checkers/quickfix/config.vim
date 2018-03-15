let g:lmap.e = get(g:lmap, 'e', { 'name': '+errors' })
SpNMap 'eC', 'quickfix/close-error-list', 'cclose'
SpNMap 'eL', 'quickfix/error-list', 'copen'
SpNMap 'eN', 'quickfix/next-error', 'cnext'
SpNMap 'eP', 'quickfix/previous-error', 'cprevious'
SpNMap 'eF', 'quickfix/first-error', 'cfirst'
SpNMap 'eE', 'quickfix/last-error', 'clast'

let g:lmap.e.m = get(g:lmap.e, 'm', { 'name': '+loc' })
SpNMap 'emc', 'loc/close-error-list', 'lclose'
SpNMap 'eml', 'loc/error-list', 'lopen'
SpNMap 'emn', 'loc/next-error', 'lnext'
SpNMap 'emp', 'loc/previous-error', 'lprevious'
SpNMap 'emf', 'loc/first-error', 'lfirst'
SpNMap 'eme', 'loc/last-error', 'llast'
