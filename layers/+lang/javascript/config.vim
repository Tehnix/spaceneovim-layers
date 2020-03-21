" Remove any default mappings {{{
" }}}

" Set the key mappings for the various commands {{{
  SpFileTypeNMap 'javascript', 'm-', 'no-commands-exist!', 'noh'
  au FileType javascript let g:lmap.m = { "name": "major-mode-cmd" }
" }}}

" Layer specific configurations {{{
" Set the default indentation for the language
  SpSpaceIndent 'javascript', 2

  let g:vim_json_syntax_conceal = 0

  augroup JavaScriptFileTypes
    au!
    au BufNewFile,BufRead *.eslintrc set syntax=json
    au BufNewFile,BufRead *.tsconfig set syntax=json
    au BufNewFile,BufRead *.prettierrc set syntax=yaml
    au BufNewFile,BufRead *.flowconfig set syntax=dosini
    au BufNewFile,BufRead *.mdlrc set syntax=dosini
  augroup END

  if SpaceNeovimIsLayerEnabled('+completion/coc')
    if g:spCocHoverInfo
      augroup JavaScriptCocHoverBehaviour
        au!
        " Show documentation on hover.
        au CursorHold *.js,*.jsx,*.ts,*.tsx silent SpCocHover
      augroup end
    endif
    if g:sp_format_on_save
      augroup JavaScriptCocFormatBehaviour
        au!
        " Setup formatexpr specified filetype(s).
        au FileType javascript,typescript,json,yaml setl formatexpr=CocAction('formatSelected')
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
