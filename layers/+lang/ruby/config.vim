" Remove default mappings {{{
  " Set to non existing key because vim-blockle does not support disabling
  let g:blockle_mapping = '<F37>'
" }}}

" Create groupings under SPC m {{{
  " Start by resetting the major-mode and then add the new groups
  au FileType ruby let g:lmap.m = { "name": "+major-mode-cmd" }
" }}}

" Set the key mappings for the various commands {{{
  SpFileTypeNMap 'ruby', 'mb', 'blockie', ''
  SpFileTypeNMap 'ruby', 'm:', 'not-rocket', 'NotRocket'
  SpFileTypeNMap 'ruby', 'ml', 'extract-let', '<Plug>ExtractRspecLet'
  SpFileTypeNMap 'ruby', 'ms', 'convert-struct', '<Plug>ConvertStructToClass'
" }}}

" Layer specific configurations {{{
  " Set the default indentation for the language
  SpSpaceIndent 'ruby', 2

  " Add ruby syntax highlighting for Thorfile, Rakefile, Vagrantfile and Gemfile
  au BufRead,BufNewFile {Gemfile,Guardfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

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
