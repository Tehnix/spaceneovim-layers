" Remove any default mappings {{{
let g:hlintRefactor#disableDefaultKeybindings = 1
" }}}

" Create groupings under SPC m {{{
" Start by resetting the major-mode and then add the new groups
au FileType haskell let g:lmap.m = { "name": "+major-mode-cmd" }
                 \| let g:lmap.m.g = { "name": "haskell/ghc-mod" }
                 \| let g:lmap.m.r = { "name": "haskell/refactor" }
                 \| let g:lmap.m.d = { "name": "haskell/documentation" }
" }}}

" Set the key mappings for the various commands {{{
" Call the command `GhcModCheckAndLintAsync` on the keybinding SPC m g c and
" give it the name 'ghc-mod-check'
SpFileTypeNMap 'haskell', 'mgc', 'ghc-mod-check', 'GhcModCheckAndLintAsync'
" Call the command `Hoogle` on the keybinding SPC m d h, give it the name
" 'search-hoogle' and wait for user input
SpFileTypeNMap 'haskell', 'mdh', 'search-hoogle', 'SpaceNeovimExampleHoogle'
" }}}

" Layer specific configurations {{{
" Set the default indentation for the language
SpSpaceIndent 'example-language', 2

if SpaceNeovimIsLayerEnabled('+completion/deoplete')
  " Configure deoplete
endif

if SpaceNeovimIsLayerEnabled('+checkers/neomake')
  " Configure neomake
endif

if SpaceNeovimIsLayerEnabled('+checkers/syntastic')
  " Configure syntastic
endif
" }}}
