let g:startify_custom_header = get(g:, 'startify_custom_header', [
\'',
\'                         [S P A C E N E O V I M]',
\'',
\ ])

" When opening a file or bookmark, seek and change to the root directory of the
" VCS (if there is one).
let g:startify_change_to_vcs_root = get(g:, 'sp_startify_change_to_vcs_root', 1)

" Fix starify navigation when having mapped j/k to gj/gk.
augroup fixStartify
  au!
  au User Startified nmap <buffer> k k
  au User Startified nmap <buffer> j j
  au User Startified nmap <buffer> q :q<CR>
augroup END
