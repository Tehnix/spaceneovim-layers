let g:lmap.w = get(g:lmap, 'w', { 'name': '+windows' })
SpNMap 'ws', 'split-window-below', 'rightbelow split'
SpNMap 'wv', 'split-window-right', 'rightbelow vsplit'
SpNMap 'wo', 'make-current-window-only-one', 'wincmd o'
SpNMap 'wj', 'window-down', 'wincmd j'
SpNMap 'wk', 'window-up', 'wincmd k'
SpNMap 'wh', 'window-left', 'wincmd h'
SpNMap 'wl', 'window-right', 'wincmd l'
SpNMap 'ww', 'window-other', 'wincmd w'
SpNMap 'wd', 'window-close', 'wincmd c'
" FIXME: This adds too much noise. Preferably it would only display '0-9' as
" entry in the leader-guide window.
let g:lmap.w.1 = ['1 wincmd w', '1']
let g:lmap.w.2 = ['2 wincmd w', '2']
let g:lmap.w.3 = ['3 wincmd w', '3']
let g:lmap.w.4 = ['4 wincmd w', '4']
let g:lmap.w.5 = ['5 wincmd w', '5']
let g:lmap.w.6 = ['6 wincmd w', '6']
let g:lmap.w.7 = ['7 wincmd w', '7']
let g:lmap.w.8 = ['8 wincmd w', '8']
let g:lmap.w.9 = ['9 wincmd w', '9']
"let g:lmap.w.0 = ['0 wincmd w', '0']

if has('nvim')
  " Terminal specific mappings
  SpBind 'tmap', 'wj', 'window-down', 'wincmd j', 1
  SpBind 'tmap', 'wk', 'window-up', 'wincmd k', 1
  SpBind 'tmap', 'wh', 'window-left', 'wincmd h', 1
  SpBind 'tmap', 'wl', 'window-right', 'wincmd l', 1
  SpBind 'tmap', 'ww', 'window-other', 'wincmd w', 1
  SpBind 'tmap', 'wd', 'window-close', 'wincmd c', 1
endif
