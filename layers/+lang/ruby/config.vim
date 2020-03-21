" Remove default mappings {{{
  " Set to non existing key because vim-blockle does not support disabling
  let g:blockle_mapping = '<F37>'
" }}}

" Set the key mappings for the various commands {{{
  SpFileTypeNMap 'ruby', 'mb', 'blockie', 'noh'
  SpFileTypeNMap 'ruby', 'm:', 'not-rocket', 'NotRocket'
  SpFileTypeNMap 'ruby', 'ml', 'extract-let', '<Plug>ExtractRspecLet'
  SpFileTypeNMap 'ruby', 'ms', 'convert-struct', '<Plug>ConvertStructToClass'
  au FileType ruby let g:lmap.m = { "name": "major-mode-cmd" }
" }}}

" Layer specific configurations {{{
  " Set the default indentation for the language
  SpSpaceIndent 'ruby', 2

  " Add ruby syntax highlighting for Thorfile, Rakefile, Vagrantfile and Gemfile
  au BufRead,BufNewFile {Gemfile,Guardfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

  if SpaceNeovimIsLayerEnabled('+completion/coc')
    if g:spCocHoverInfo
      augroup RubyCocHoverBehaviour
        au!
        " Show documentation on hover.
        au CursorHold *.rb silent SpCocHover
      augroup end
    endif
    if g:sp_format_on_save
      augroup RubyCocFormatBehaviour
        au!
        " Setup formatexpr specified filetype(s).
        au FileType ruby setl formatexpr=CocAction('formatSelected')
      augroup end
    endif
  endif

  if SpaceNeovimIsLayerEnabled('+completion/deoplete')
    " Configure deoplete
    if !exists('g:deoplete#sources')
      let g:deoplete#sources = {}
    endif
    let g:deoplete#sources.ruby = ['buffer', 'tag', 'ruby']
  endif

  if SpaceNeovimIsLayerEnabled('+checkers/neomake')
    " Configure neomake
  endif

  if SpaceNeovimIsLayerEnabled('+checkers/syntastic')
    " Configure syntastic
  endif
" }}}
