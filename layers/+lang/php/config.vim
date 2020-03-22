" Remove any default mappings {{{

" }}}

" Set the key mappings for the various commands {{{
  au FileType php let g:lmap.m = { "name": "major-mode-cmd",
    \}
" }}}

" Layer specific configurations {{{
  " Set the default indentation for the language
  SpSpaceIndent 'php', 4

  if SpaceNeovimIsLayerEnabled('+completion/coc')
    " Configure coc.nvim
    if g:spCocHoverInfo
      augroup PHPtCocHoverBehaviour
        au!
        " Show documentation on hover.
        au CursorHold *.php silent SpCocHover
      augroup end
    endif
    if g:sp_format_on_save
      augroup PHPCocFormatBehaviour
        au!
        " Setup formatexpr specified filetype(s).
        au FileType php setl formatexpr=CocAction('formatSelected')
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
