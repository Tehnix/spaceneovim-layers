if SpaceNeovimIsLayerEnabled('+nav/quit')
  let g:lmap.q = { 'name': '+quit' }
  call SpaceNeovimNMap('qq', 'quit', 'q')
  call SpaceNeovimNMap('qz', 'save-and-quit', 'ZZ')
  call SpaceNeovimNMap('q!', 'save-and-quit', 'q!')
endif
