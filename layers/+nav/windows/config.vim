if g:spacevim_is_layer_enabled('+nav/windows')
  let g:lmap.w = { 'name': '+windows' }
  call g:spacevim_bind('map', 'ws', 'split-window-below', 'split', 1)
  call g:spacevim_bind('map', 'wv', 'split-window-right', 'vsplit', 1)
endif
