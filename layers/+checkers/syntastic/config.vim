let g:lmap.e = get(g:lmap, 'e', { 'name': '+errors' })
SpNMap 'er', 'syntastic/check-file', 'SyntasticCheck'
SpNMap 'el', 'syntastic/error-list', 'lopen'
SpNMap 'ec', 'syntastic/close-error-list', 'lclose'
SpNMap 'en', 'syntastic/next-error', 'lnext'
SpNMap 'ep', 'syntastic/previous-error', 'lprevious'

" Configure the Syntastic status line.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" Since syntastic is synchronous, checking on open can be quite slow.
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" Likewise because of synchronous operations, multiple checkers are slow.
let g:syntastic_aggregate_errors = 0
" Make statusline look a bit more condensed and nicer.
let g:syntastic_stl_format = '%E{E:%e (%fe)}%B{, }%W{W:%w (%fw)}'
