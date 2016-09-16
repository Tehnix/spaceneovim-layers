if g:spacevim_is_layer_enabled('+checkers/syntax-checking')
  let g:lmap.a = { 'name': '+syntax-checking' }
  call s:spacevim_bind('map', 'el', 'lint-file', 'Neomake!', 1)
endif
