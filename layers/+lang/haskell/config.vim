" Remove default mappings {{{
let g:hlintRefactor#disableDefaultKeybindings = 1
" }}}

call SpaceNeovimFileTypeGroup('haskell', 'r', 'haskell/refactor')
call SpaceNeovimFTNMap('haskell', 'mrb', 'hlint-refactor-buffer', 'call ApplyAllSuggestion()')
call SpaceNeovimFTNMap('haskell', 'mrr', 'hlint-refactor-at-point', 'call ApplyOneSuggestion()')

call SpaceNeovimFileTypeGroup('haskell', 'd', 'haskell/documentation')
call SpaceNeovimFTNMap('haskell', 'mdh', 'search-hoogle', 'call feedkeys(":Hoogle ")')
call SpaceNeovimFTNMap('haskell', 'mdH', 'search-hoogle-info', 'call feedkeys(":HoogleInfo ")')
call SpaceNeovimFTNMap('haskell', 'mdc', 'close-hoogle', 'HoogleClose')
call SpaceNeovimFTNMap('haskell', 'mdt', 'hdevtools-type-at', 'HdevtoolsType')

" Set layer specific configurations {{{
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
  if exists('g:sp_neomake_haskell_enabled_makers')
    let g:neomake_haskell_enabled_makers = g:sp_neomake_haskell_enabled_makers
  endif
endif
" }}}

call SpaceNeovimCleanupFileTypeGroups('haskell')
