if SpaceNeovimIsLayerEnabled('+lang/haskell')
  call SpaceNeovimAddPlugin('neovimhaskell/haskell-vim', { 'for': 'haskell' })
  call SpaceNeovimAddPlugin('eagletmt/neco-ghc', { 'for': 'haskell' })
  call SpaceNeovimAddPlugin('mpickering/hlint-refactor-vim', { 'for': 'haskell' })
  call SpaceNeovimAddPlugin('Twinside/vim-hoogle', { 'for': 'haskell' })
  " call SpaceNeovimAddPlugin('parsonsmatt/intero-neovim', { 'for': 'haskell' })
  call SpaceNeovimAddPlugin('bitc/vim-hdevtools', { 'for': 'haskell' })
endif
