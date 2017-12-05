" Use ripgrep or the silver searcher if available
if executable('rg')
  if !SpaceNeovimIsLayerEnabled('+nav/fzf')
    " Define Rg command to search for the provided text and open a quickfix
    command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
  endif
  " Use rg as grep method
  set grepprg=rg\ --vimgrep
  set grepformat^=%f:%l:%c:%m
elseif executable('ag')
  if !SpaceNeovimIsLayerEnabled('+nav/fzf')
    " Define Ag command to search for the provided text and open a quickfix
    command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  endif
  " Use ag as grep method
  set grepprg=ag\ --nogroup\ --nocolor
endif
