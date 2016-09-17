if spacevim#is_layer_enabled('+nav/quit')
  let g:lmap.q = { 'name': '+quit' }
  call spacevim#bind('map', 'qq', 'quit', 'q', 1)
  call spacevim#bind('map', 'qz', 'save-and-quit', 'ZZ', 1)
  call spacevim#bind('map', 'q!', 'save-and-quit', 'q!', 1)
endif
