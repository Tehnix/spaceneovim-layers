if spacevim#is_layer_enabled('+nav/files')
  let g:lmap.f = { 'name': '+files' }
  call spacevim#bind('map', 'fs', 'save-buffer', 'w', 1)
  call spacevim#bind('map', 'ft', 'nerdtree-toggle', 'NERDTreeToggle', 1)

  let g:lmap.f.s = { 'name': 'spaceneovim' }
  call spacevim#bind('map', 'fsd', 'find-config-file', 'e $MYVIMRC', 1)
endif
