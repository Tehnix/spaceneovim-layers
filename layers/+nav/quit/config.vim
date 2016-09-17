if g:spacevim_is_layer_enabled('+nav/quit')
  let g:lmap.q = { 'name': '+quit' }
  call g:spacevim_bind('map', 'qq', 'quit', 'q', 1)
  call g:spacevim_bind('map', 'qz', 'save-and-quit', 'ZZ', 1)
  call g:spacevim_bind('map', 'q!', 'save-and-quit', 'q!', 1)
endif
