" Display git marks on the side
SpAddPlugin 'airblade/vim-gitgutter'

" Browse Git commits nicely
if !SpaceNeovimIsLayerEnabled('+nav/fzf')
  SpAddPlugin 'junegunn/gv.vim'
endif

" Git commands
SpAddPlugin 'tpope/vim-fugitive'
