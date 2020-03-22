" Remove any default mappings {{{

" }}}

" Set the key mappings for the various commands {{{
  au FileType go let g:lmap.m = { "name": "major-mode-cmd",
    \}
" }}}

" Layer specific configurations {{{
  " Set the default indentation for the language
  " SpSpaceIndent 'go', 4

  if SpaceNeovimIsLayerEnabled('+completion/coc')
    " Configure coc.nvim
    if g:spCocHoverInfo
      augroup GoCocHoverBehaviour
        au!
        " Show documentation on hover.
        au CursorHold *.go silent SpCocHover
      augroup end
    endif
    if g:sp_format_on_save
      augroup GoCocFormatBehaviour
        au!
        " Setup formatexpr specified filetype(s).
        au FileType go setl formatexpr=CocAction('formatSelected')
      augroup end
    endif
    let s:go_coc = {
      \ "command": "gopls",
      \ "rootPatterns": ["go.mod"],
      \ "disableWorkspaceFolders": "true",
      \ "filetypes": ["go"]
      \}
    let g:coc_user_config = get(g:, 'coc_user_config', {})
    let g:coc_user_config.languageserver = get(g:coc_user_config, 'languageserver', {})
    let g:coc_user_config.languageserver.golang = get(g:coc_user_config.languageserver, 'golang', s:go_coc)
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
