" Remove any default mappings {{{
" }}}

" Set the key mappings for the various commands {{{
  au FileType javascript let g:lmap.m = { "name": "+major-mode-cmd",
    \"-": ["echo 'No commands exist yet!'", "no-commands-exist!"]
    \}
" }}}

" Layer specific configurations {{{
" Set the default indentation for the language
SpSpaceIndent 'javascript', 2

let g:vim_json_syntax_conceal = 0

augroup JavaScriptFileTypes
  au!
  au BufNewFile,BufRead *.eslintrc set syntax=json
  au BufNewFile,BufRead *.prettierrc set syntax=yaml
  au BufNewFile,BufRead *.flowconfig set syntax=dosini
  au BufNewFile,BufRead *.mdlrc set syntax=dosini
augroup END

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
