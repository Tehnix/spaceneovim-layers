if spacevim#is_layer_enabled('+checkers/syntax-checking')
  echo 'Inside packages.vim'
  call add(g:spacevim_plugins, 'neomake/neomake')
endif
