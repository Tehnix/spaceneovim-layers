" Remove any default mappings {{{
let g:hlintRefactor#disableDefaultKeybindings = 1
" }}}

" Set the key mappings for the various commands {{{
  au FileType haskell let g:lmap.m = { "name": "+major-mode-cmd",
    \"c": ["GhcModCheckAndLintAsync", "ghcmod/check"],
    \"r": { "name": "+haskell/refactor"
         \, "b": ["call ApplyAllSuggestion()", "hlint/refactor-buffer"]
      \ },
    \"h": { "name": "+haskell/documentation"
         \, "h": ["SpaceNeovimHaskellHoogle", "search-hoogle"]
         \, "t": ["GhcModType", "ghcmod/type-at"]
      \ },
    \}
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
