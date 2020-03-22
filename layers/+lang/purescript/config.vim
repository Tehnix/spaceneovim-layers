" Remove any default mappings {{{

" }}}

" Set the key mappings for the various commands {{{
  au FileType purescript let g:lmap.m = { "name": "major-mode-cmd",
    \}
" }}}

" Layer specific configurations {{{
  " Set the default indentation for the language
  SpSpaceIndent 'purescript', 2

  if SpaceNeovimIsLayerEnabled('+completion/coc')
    " Configure coc.nvim
    if g:spCocHoverInfo
      augroup PurescriptCocHoverBehaviour
        au!
        " Show documentation on hover.
        au CursorHold *.ps silent SpCocHover
      augroup end
    endif
    if g:sp_format_on_save
      augroup PurescriptCocFormatBehaviour
        au!
        " Setup formatexpr specified filetype(s).
        au FileType purescript setl formatexpr=CocAction('formatSelected')
      augroup end
    endif
    let s:purescript_coc = {
      \ "command": "purescript-language-server",
      \ "args": ["--stdio"],
      \ "rootPatterns": ["bower.json", "psc-package.json", "spago.dhall"],
      \ "filetypes": ["purescript"]
      \}
    let g:coc_user_config = get(g:, 'coc_user_config', {})
    let g:coc_user_config.languageserver = get(g:coc_user_config, 'languageserver', {})
    let g:coc_user_config.languageserver.purescript = get(g:coc_user_config.languageserver, 'purescript', s:purescript_coc)
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
