" Remove any default mappings {{{
let g:elm_setup_keybindings = 0
" }}}

" Create groupings under SPC m {{{
" Start by resetting the major-mode and then add the new groups
au FileType elm let g:lmap.m = { "name": "+major-mode-cmd" }
             \| let g:lmap.m.d = { "name": "elm/documentation" }
" }}}

" Set the key mappings for the various commands {{{
SpFileTypeNMap 'elm', 'mm', 'elm-make', 'SpaceNeovimElmMake'
SpFileTypeNMap 'elm', 'mM', 'elm-make-main', 'ElmMakeMain'
SpFileTypeNMap 'elm', 'mt', 'elm-test', 'SpaceNeovimElmTest'
SpFileTypeNMap 'elm', 'mr', 'elm-repl', 'ElmRepl'
SpFileTypeNMap 'elm', 'mf', 'elm-format', 'ElmFormat'
SpFileTypeNMap 'elm', 'me', 'error-detail', 'ElmErrorDetail'
SpFileTypeNMap 'elm', 'mds', 'show-docs', 'ElmShowDocs'
SpFileTypeNMap 'elm', 'mdb', 'browse-docs', 'ElmBrowseDocs'
" }}}

" Layer specific configurations {{{
" Set the default indentation for the language
SpSpaceIndent 'elm', 4

if SpaceNeovimIsLayerEnabled('+checkers/syntastic')
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1

  let g:elm_syntastic_show_warnings = 1
endif

if SpaceNeovimIsLayerEnabled('+completion/youcompleteme')
  let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}
endif

if SpaceNeovimIsLayerEnabled('+completion/neocomplete')
  " call neocomplete#util#set_default_dictionary(
  " \ 'g:neocomplete#sources#omni#input_patterns',
  " \ 'elm',
  " \ '\.')
endif
" }}}
