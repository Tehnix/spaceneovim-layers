" Remove any default mappings {{{
" }}}


" Set the key mappings for the various commands {{{
  au FileType vim let g:lmap.m = { "name": "+major-mode-cmd",
    \"-": ["echo 'No commands exist yet!'", "no-commands-exist!"]
    \}
" }}}

" Layer specific configurations {{{
  " Set the default indentation for the language
  SpSpaceIndent 'vim', 2

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
