" Remove any default mappings {{{
let g:elm_setup_keybindings = 0
" }}}

" Set the key mappings for the various commands {{{
  au FileType elm let g:lmap.m = { "name": "+major-mode-cmd",
    \"m": ["SpaceNeovimElmMake", "elm-make"],
    \"M": ["ElmMakeMain", "elm-make-main"],
    \"t": ["SpaceNeovimElmTest", "elm-test"],
    \"r": ["ElmRepl", "elm-repl"],
    \"f": ["ElmFormat", "elm-format"],
    \"e": ["ElmErrorDetail", "error-detail"],
    \"d": { "name": "+elm/documentation"
         \, "s": ["ElmShowDocs", "show-docs"]
         \, "b": ["ElmBrowseDocs", "browse-docs"]
      \ },
    \}
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
