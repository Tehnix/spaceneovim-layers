if g:spacevim_is_layer_enabled('+checkers/syntax-checking')
  let g:lmap.e = { 'name': '+syntax-checking' }
  call g:spacevim_bind('map', 'el', 'lint-file', 'Neomake!', 1)
endif
