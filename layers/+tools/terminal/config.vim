if SpaceNeovimIsLayerEnabled('+tools/terminal')
  " Use <Esc> to escape terminal insert mode
  tnoremap <Esc> <C-\><C-n>
  " Make terminal split moving behave like normal neovim
  tnoremap <c-h> <C-\><C-n><C-w>h
  tnoremap <c-j> <C-\><C-n><C-w>j
  tnoremap <c-k> <C-\><C-n><C-w>k
  tnoremap <c-l> <C-\><C-n><C-w>l

  call SpaceNeovimNMap('!', 'shell cmd', 'call feedkeys(":! ")')
  nnoremap <Plug>open-terminal :rightbelow split \| terminal<CR>
  nmap <leader>' <Plug>open-terminal
endif
