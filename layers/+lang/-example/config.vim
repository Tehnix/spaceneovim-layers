" Remove any default mappings {{{
let g:hlintRefactor#disableDefaultKeybindings = 1
" }}}

" Set the key mappings for the various commands {{{
  SpFileTypeNMap 'example-language', 'mm', 'elm-make', 'SpaceNeovimElmMake'
  SpFileTypeNMap 'example-language', 'mM', 'elm-make-main', 'ElmMakeMain'
  SpFileTypeNMap 'example-language', 'mt', 'elm-test', 'SpaceNeovimElmTest'
  SpFileTypeNMap 'example-language', 'mr', 'elm-repl', 'ElmRepl'
  SpFileTypeNMap 'example-language', 'mf', 'elm-format', 'ElmFormat'
  SpFileTypeNMap 'example-language', 'me', 'error-detail', 'ElmErrorDetail'
  " elm/documentation.
  SpFileTypeNMap 'example-language', 'mm', 'show-docs', 'ElmShowDocs'
  SpFileTypeNMap 'example-language', 'mm', 'browse-docs', 'ElmBrowseDocs'

  au FileType example-language let g:lmap.m = { "name": "major-mode-cmd",
    \"d": { "name": "example-language/documentation" },
    \}
" }}}

" Layer specific configurations {{{
  " Set the default indentation for the language
  SpSpaceIndent 'example-language', 2

  if SpaceNeovimIsLayerEnabled('+completion/coc')
    " Configure coc.nvim
  endif

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
