let g:lmap['!'] = ['SpaceNeovimTerminalShellCmd', 'shell-cmd']

if has('nvim')
  " Use <Esc> to escape terminal insert mode
  tnoremap <Esc> <C-\><C-n>
  " Make terminal split moving behave like normal neovim
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l

  let g:lmap["'"] = ['SpaceNeovimTerminalOpen', 'terminal']

  " Automatically enter insert mode when going into a terminal buffer.
  augroup terminalConfig
    au!
    " Start new terminals in insert mode.
    au TermOpen * :startinsert
    " Automatically switch to insert mode upon entering a terminal buffer.
    au BufEnter * if &buftype == 'terminal' | :startinsert | endif
    " Change the status line to the terminal title while inside the terminal.
    " TODO: Find a way to change the terminal buffer title permanently.
    au TermOpen * setlocal statusline=%{b:term_title}
    au BufEnter * if &buftype == 'terminal' | setlocal statusline=%{b:term_title}
  augroup END
endif


