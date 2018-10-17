" Remove any default mappings {{{
" }}}


" Set the key mappings for the various commands {{{
  SpFileTypeNMap 'vim', 'm-', 'no-commands-exist!', 'noh'
  au FileType vim let g:lmap.m = { "name": "major-mode-cmd" }
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
