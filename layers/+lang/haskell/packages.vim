if spacevim#is_layer_enabled('+lang/haskell')
  call spacevim#add_plugin('neovimhaskell/haskell-vim', { 'for': 'haskell' })
  call spacevim#add_plugin('eagletmt/neco-ghc', { 'for': 'haskell' })
  call spacevim#add_plugin('mpickering/hlint-refactor-vim', { 'for': 'haskell' })
  call spacevim#add_plugin('Twinside/vim-hoogle', { 'for': 'haskell' })
  call spacevim#add_plugin('parsonsmatt/intero-neovim', { 'for': 'haskell' })
  call spacevim#add_plugin('bitc/vim-hdevtools', { 'for': 'haskell' })
endif
