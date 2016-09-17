if SpaceNeovimIsLayerEnabled('+checkers/syntax-checking')
  let g:lmap.e = { 'name': '+syntax-checking' }
  call SpaceNeovimNMap('el', 'lint-file', 'Neomake!')
endif
