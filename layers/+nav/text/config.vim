if g:spacevim_is_layer_enabled('+nav/text')
  let g:lmap.x = { 'name': '+text' }
  call g:spacevim_bind('map', 'xJ', 'move-text-down', 'm+', 1)
  call g:spacevim_bind('map', 'xK', 'move-text-up', 'm .-2', 1)
  call g:spacevim_bind('map', 'xU', 'uppercase-word', 'gUiw', 1)
  call g:spacevim_bind('map', 'xu', 'downcase-word', 'guiw', 1)
endif
