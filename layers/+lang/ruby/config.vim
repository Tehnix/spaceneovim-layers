" Layer specific configurations {{{
" Set the default indentation for the language
call SpaceNeovimSetFTIndentation('ruby', 2)

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
