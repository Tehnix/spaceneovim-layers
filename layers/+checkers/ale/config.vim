let g:lmap.e = get(g:lmap, 'e', { 'name': '+errors' })
SpNMap 'er', 'ale/check-file', 'ALELint'
SpNMap 'el', 'ale/error-list', 'lopen'
SpNMap 'ec', 'ale/close-error-list', 'lclose'
SpNMap 'en', 'ale/next-error', 'ALENextWrap'
SpNMap 'ep', 'ale/previous-error', 'ALEPreviousWrap'
SpNMap 'ef', 'ale/first-error', 'ALEFirst'
SpNMap 'ee', 'ale/last-error', 'ALELast'

" Enable Airline.
let g:airline#extensions#ale#enabled = 1

" Always keep the sign gutter open.
let g:ale_sign_column_always = 1

" Automatically open loclist/quickfix upon errors.
"let g:ale_open_list = 1

" Keep the window open even with no errors.
"let g:ale_keep_list_window_open = 1
