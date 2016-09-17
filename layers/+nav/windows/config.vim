if spacevim#is_layer_enabled('+nav/windows')
  let g:lmap.w = { 'name': '+windows' }
  call spacevim#bind('map', 'ws', 'split-window-below', 'rightbelow split', 1)
  call spacevim#bind('map', 'wv', 'split-window-right', 'rightbelow vsplit', 1)
  call spacevim#bind('map', 'wj', 'window-down', 'wincmd j', 1)
  call spacevim#bind('map', 'wk', 'window-up', 'wincmd k', 1)
  call spacevim#bind('map', 'wh', 'window-left', 'wincmd h', 1)
  call spacevim#bind('map', 'wl', 'window-right', 'wincmd l', 1)
  " Terminal specific mappings
  call spacevim#bind('tmap', 'wj', 'window-down', 'wincmd j', 1)
  call spacevim#bind('tmap', 'wk', 'window-up', 'wincmd k', 1)
  call spacevim#bind('tmap', 'wh', 'window-left', 'wincmd h', 1)
  call spacevim#bind('tmap', 'wl', 'window-right', 'wincmd l', 1)
endif
