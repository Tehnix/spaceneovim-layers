function! SpaceNeovimToggleSyntax()
  " Toogle syntax on/off
  if exists('g:syntax_on')
    syntax off
  else
    syntax enable
  endif
endfunction
