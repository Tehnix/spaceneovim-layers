if spacevim#is_layer_enabled('+lang/haskell')
  let g:hlintRefactor#disableDefaultKeybindings = 1
  let g:lmap.m.r = { 'name': 'haskell/refactor' }
  call spacevim#bind('map', 'mra', 'hlint-apply-one-suggestion', 'ApplyOneSuggestion', 1)
  call spacevim#bind('map', 'mrA', 'hlint-apply-all-suggestion', 'ApplyAllSuggestions', 1)

  let g:lmap.m.d = { 'name': 'haskell/documentation' }
  call spacevim#bind('map', 'mdh', 'hoogle-lookup', 'Hoogle', 1)
  call spacevim#bind('map', 'mdi', 'hoogle-info', 'Hoogle', 1)
  call spacevim#bind('map', 'mdC', 'hoogle-close-search', 'HoogleClose', 1)
  call spacevim#bind('map', 'mdl', 'hoogle-search-line', 'HoogleLine', 1)
endif
