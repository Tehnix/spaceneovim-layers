" Remove any default mappings {{{
" }}}

" Set the key mappings for the various commands {{{
  SpFileTypeNMap 'python', 'm-', 'no-commands-exist!', 'noh'
  au FileType python let g:lmap.m = { "name": "major-mode-cmd" }
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
