if spacevim#is_layer_enabled('+nav/windows')
  let g:lmap.w = { 'name': '+windows' }
  call spacevim#bind('map', 'ws', 'split-window-below', 'split', 1)
  call spacevim#bind('map', 'wv', 'split-window-right', 'vsplit', 1)
endif
