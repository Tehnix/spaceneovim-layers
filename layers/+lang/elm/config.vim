" Remove any default mappings {{{
let g:elm_setup_keybindings = 0
" }}}

" Set the key mappings for the various commands {{{
  SpFileTypeNMap 'elm', 'mm', 'elm-make', 'SpaceNeovimElmMake'
  SpFileTypeNMap 'elm', 'mM', 'elm-make-main', 'ElmMakeMain'
  SpFileTypeNMap 'elm', 'mt', 'elm-test', 'SpaceNeovimElmTest'
  SpFileTypeNMap 'elm', 'mr', 'elm-repl', 'ElmRepl'
  SpFileTypeNMap 'elm', 'mf', 'elm-format', 'ElmFormat'
  SpFileTypeNMap 'elm', 'me', 'error-detail', 'ElmErrorDetail'
  " elm/documentation.
  SpFileTypeNMap 'elm', 'mm', 'show-docs', 'ElmShowDocs'
  SpFileTypeNMap 'elm', 'mm', 'browse-docs', 'ElmBrowseDocs'

  au FileType elm let g:lmap.m = { "name": "major-mode-cmd",
    \"d": { "name": "elm/documentation" },
    \}
" }}}

" Layer specific configurations {{{
" Set the default indentation for the language
  SpSpaceIndent 'elm', 4

  if SpaceNeovimIsLayerEnabled('+completion/coc')
    if g:spCocHoverInfo
      augroup ElmCocHoverBehaviour
        au!
        " Show documentation on hover.
        au CursorHold *.elm silent SpCocHover
      augroup end
    endif
    if g:sp_format_on_save
      augroup ElmCocFormatBehaviour
        au!
        " Setup formatexpr specified filetype(s).
        au FileType elm setl formatexpr=CocAction('formatSelected')
      augroup end
    endif
  endif

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
