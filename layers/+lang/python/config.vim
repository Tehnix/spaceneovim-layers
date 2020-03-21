" Remove any default mappings {{{
" }}}

" Set the key mappings for the various commands {{{
  SpFileTypeNMap 'python', 'm-', 'no-commands-exist!', 'noh'
  au FileType python let g:lmap.m = { "name": "major-mode-cmd" }
" }}}

" Layer specific configurations {{{
  " Set the default indentation for the language
  SpSpaceIndent 'python', 4

  if SpaceNeovimIsLayerEnabled('+completion/coc')
    if g:spCocHoverInfo
      augroup PythonCocHoverBehaviour
        au!
        " Show documentation on hover.
        au CursorHold *.py silent SpCocHover
      augroup end
    endif
    if g:sp_format_on_save
      augroup PythonCocFormatBehaviour
        au!
        " Setup formatexpr specified filetype(s).
        au FileType python setl formatexpr=CocAction('formatSelected')
      augroup end
    endif
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
