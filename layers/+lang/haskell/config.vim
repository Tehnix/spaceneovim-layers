" Remove default mappings {{{
  let g:hlintRefactor#disableDefaultKeybindings = 1
" }}}

" Create groupings under SPC m {{{
" Start by resetting the major-mode and then add the new groups
  au FileType haskell let g:lmap.m = { "name": "+major-mode-cmd" }
" }}}

" Set the key mappings for the various commands {{{
  SpFileTypeGroup 'haskell', 'g', '+haskell/ghc-mod'
  SpFileTypeNMap 'haskell', 'mgc', 'ghc-mod-check', 'GhcModCheckAndLintAsync'
  SpFileTypeNMap 'haskell', 'mgs', 'ghc-mod-split-fun', 'GhcModSplitFunCase'
  SpFileTypeNMap 'haskell', 'mgs', 'ghc-mod-sig-gen-code', 'GhcModSigCodegen'
  SpFileTypeNMap 'haskell', 'mge', 'ghc-mod-expand', 'GhcModExpand'
  SpFileTypeNMap 'haskell', 'mgt', 'show-type-at', 'GhcModType'
  SpFileTypeNMap 'haskell', 'mgc', 'clear-type', 'GhcModTypeClear'

  SpFileTypeGroup 'haskell', 'r', '+haskell/refactor'
  SpFileTypeNMap 'haskell', 'mrb', 'hlint-refactor-buffer', 'call ApplyAllSuggestion()'
  SpFileTypeNMap 'haskell', 'mrr', 'hlint-refactor-at-point', 'call ApplyOneSuggestion()'

  SpFileTypeGroup 'haskell', 'd', '+haskell/documentation'
  SpFileTypeNMap 'haskell', 'mdh', 'search-hoogle', 'SpaceNeovimHaskellHoogle'
  SpFileTypeNMap 'haskell', 'mdH', 'search-hoogle-info', 'SpaceNeovimHaskellHoogleInfo'
  SpFileTypeNMap 'haskell', 'mdc', 'close-hoogle', 'HoogleClose'
  SpFileTypeNMap 'haskell', 'mdt', 'hdevtools-type-at', 'HdevtoolsType'
" }}}

" Set layer specific configurations {{{
  " Set the default indentation for haskell
  SpSpaceIndent 'haskell', 2

  if SpaceNeovimIsLayerEnabled('+completion/deoplete')
    " Disable haskell-vim omnifunc
    let g:haskellmode_completion_ghc = 0
    if exists('g:sp_necoghc_enable_detailed_browse')
      let g:necoghc_enable_detailed_browse = g:sp_necoghc_enable_detailed_browse
    else
      let g:necoghc_enable_detailed_browse = 1
    endif
    augroup haskellDeopleteConfig
      au!
      au FileType haskell setlocal omnifunc=necoghc#omnifunc
    augroup END
  endif

  if SpaceNeovimIsLayerEnabled('+checkers/neomake')
    let g:neomake_haskell_enabled_makers = get(g:, 'sp_neomake_haskell_enabled_makers', ['ghcmod', 'hlint'])
  endif
" }}}
