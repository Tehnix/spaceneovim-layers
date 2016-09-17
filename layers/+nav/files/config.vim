if spacevim#is_layer_enabled('+nav/files')
  let g:lmap.f = { 'name': '+files' }
  call spacevim#bind('map', 'fs', 'save-buffer', 'w', 1)
  call spacevim#bind('map', 'ft', 'nerdtree-toggle', 'NERDTreeToggle', 1)
endif
