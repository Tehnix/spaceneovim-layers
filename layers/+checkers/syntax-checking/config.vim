if spacevim#is_layer_enabled('+checkers/syntax-checking')
  let g:lmap.e = { 'name': '+syntax-checking' }
  call spacevim#bind('map', 'el', 'lint-file', 'Neomake!', 1)
endif
