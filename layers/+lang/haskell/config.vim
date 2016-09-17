if SpaceNeovimIsLayerEnabled('+lang/haskell')
  " Remove default mappings {{{
  let g:hlintRefactor#disableDefaultKeybindings = 1
  " }}}

  call SpaceNeovimFileTypeGroup('haskell', 'd', 'haskell/documentation')
  call SpaceNeovimFTNMap('haskell', 'mdh', 'search-hoogle', 'call feedkeys(":Hoogle ")')

  call SpaceNeovimCleanupFileTypeGroups('haskell')
endif
