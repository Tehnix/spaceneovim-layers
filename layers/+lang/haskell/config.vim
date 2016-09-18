" Remove default mappings {{{
let g:hlintRefactor#disableDefaultKeybindings = 1
" }}}

" Start by resetting the major-mode and then add the new groups
au FileType haskell let g:lmap.m = { "name": "+major-mode-cmd" }
                 \| let g:lmap.m.g = { "name": "haskell/ghc-mod" }
                 \| let g:lmap.m.r = { "name": "haskell/refactor" }
                 \| let g:lmap.m.d = { "name": "haskell/documentation" }

call SpaceNeovimFTNMap('haskell', 'mgc', 'ghc-mod-check', 'GhcModCheckAndLintAsync')
call SpaceNeovimFTNMap('haskell', 'mgs', 'ghc-mod-split-fun', 'GhcModSplitFunCase')
call SpaceNeovimFTNMap('haskell', 'mgs', 'ghc-mod-sig-gen-code', 'GhcModSigCodegen')
call SpaceNeovimFTNMap('haskell', 'mge', 'ghc-mod-expand', 'GhcModExpand')
call SpaceNeovimFTNMap('haskell', 'mgt', 'show-type-at', 'GhcModType')
call SpaceNeovimFTNMap('haskell', 'mgc', 'clear-type', 'GhcModTypeClear')

call SpaceNeovimFTNMap('haskell', 'mrb', 'hlint-refactor-buffer', 'call ApplyAllSuggestion()')
call SpaceNeovimFTNMap('haskell', 'mrr', 'hlint-refactor-at-point', 'call ApplyOneSuggestion()')

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
  let g:neomake_haskell_enabled_makers = ['ghcmod', 'hlint']
  if exists('g:sp_neomake_haskell_enabled_makers')
    let g:neomake_haskell_enabled_makers = g:sp_neomake_haskell_enabled_makers
  endif
endif
" }}}
