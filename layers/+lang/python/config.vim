" Remove any default mappings {{{
" }}}

" Create groupings under SPC m {{{
  " Start by resetting the major-mode and then add the new groups
  au FileType python let g:lmap.m = { "name": "+major-mode-cmd" }
" }}}

" Set the key mappings for the various commands {{{
" }}}

" Layer specific configurations {{{
  " Set the default indentation for the language
  SpSpaceIndent 'python', 4

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
