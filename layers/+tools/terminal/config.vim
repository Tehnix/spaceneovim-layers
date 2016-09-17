if spacevim#is_layer_enabled('+tools/terminal')
  " Use <Esc> to escape terminal insert mode
  tnoremap <Esc> <C-\><C-n>
  " Make terminal split moving behave like normal neovim
  tnoremap <c-h> <C-\><C-n><C-w>h
  tnoremap <c-j> <C-\><C-n><C-w>j
  tnoremap <c-k> <C-\><C-n><C-w>k
  tnoremap <c-l> <C-\><C-n><C-w>l

  call spacevim#bind('map', "!", 'shell cmd', ':!', 0)
  call spacevim#bind('map', "'", 'open terminal', 'rightbelow split | terminal', 1)
  call spacevim#bind('tmap', 'wl', 'window-right', 'wincmd l', 1)
  call spacevim#bind('tmap', 'wj', 'window-down', 'wincmd j', 1)
  call spacevim#bind('tmap', 'wk', 'window-up', 'wincmd k', 1)
  call spacevim#bind('tmap', 'wh', 'window-left', 'wincmd h', 1)
  call spacevim#bind('tmap', 'wl', 'window-right', 'wincmd l', 1)
endif
