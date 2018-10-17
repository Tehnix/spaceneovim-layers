let g:sp_haskell_backend = get(g:, 'spHaskellBackend', 'intero')

SpAddPlugin 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
SpAddPlugin 'vmchale/cabal-project-vim'
SpAddPlugin 'vmchale/ghci-syntax'
SpAddPlugin 'Twinside/vim-hoogle', { 'for': 'haskell' }
SpAddPlugin 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }
SpAddPlugin 'eagletmt/neco-ghc', { 'for': 'haskell' }
SpAddPlugin 'Shougo/vimproc.vim', { 'for': 'haskell', 'do' : 'make' }
SpAddPlugin 'parsonsmatt/intero-neovim', { 'for': 'haskell' }
SpAddPlugin 'owickstrom/neovim-ghci', { 'for': 'haskell' }
SpAddPlugin 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim', 'for': 'haskell' }
" Use the ghc-modi branch from liskin/ghcmod-vim until it is merged.
if g:sp_haskell_backend == 'ghc-mod'
  SpAddPlugin 'liskin/ghcmod-vim', { 'branch': 'ghc-modi', 'for': 'haskell' }
endif
"SpAddPlugin 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
