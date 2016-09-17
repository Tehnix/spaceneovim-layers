if spacevim#is_layer_enabled('+nav/text')
  let g:lmap.x = { 'name': '+text' }
  call spacevim#bind('map', 'xJ', 'move-text-down', 'm+', 1)
  call spacevim#bind('map', 'xK', 'move-text-up', 'm .-2', 1)
  call spacevim#bind('map', 'xU', 'uppercase-word', 'gUiw', 1)
  call spacevim#bind('map', 'xu', 'downcase-word', 'guiw', 1)
endif
