" Remove any default mappings {{{
let g:elm_setup_keybindings = 0
" }}}

" Create groupings under SPC m {{{
" Start by resetting the major-mode and then add the new groups
au FileType elm let g:lmap.m = { "name": "+major-mode-cmd" }
             \| let g:lmap.m.d = { "name": "elm/documentation" }
" }}}

" Set the key mappings for the various commands {{{
call SpaceNeovimFTNMap('elm', 'mm', 'elm-make', 'call feedkeys(":ElmMake ")')
call SpaceNeovimFTNMap('elm', 'mM', 'elm-make-main', 'ElmMakeMain')
call SpaceNeovimFTNMap('elm', 'mt', 'elm-test', 'call feedkeys(":ElmTest ")')
call SpaceNeovimFTNMap('elm', 'mr', 'elm-repl', 'ElmRepl')
call SpaceNeovimFTNMap('elm', 'mf', 'elm-format', 'ElmFormat')
call SpaceNeovimFTNMap('elm', 'me', 'error-detail', 'ElmErrorDetail')
call SpaceNeovimFTNMap('elm', 'mds', 'show-docs', 'ElmShowDocs')
call SpaceNeovimFTNMap('elm', 'mdb', 'browse-docs', 'ElmBrowseDocs')
" }}}

" Layer specific configurations {{{
" Set the default indentation for the language
call SpaceNeovimSetFTIndentation('elm', 4)

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
  call neocomplete#util#set_default_dictionary(
  \ 'g:neocomplete#sources#omni#input_patterns',
  \ 'elm',
  \ '\.')
endif
" }}}
