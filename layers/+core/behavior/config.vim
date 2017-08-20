" Shorten the time before the vim-leader-guide buffer appears
set timeoutlen=300
set ttimeoutlen=0

" Read modelines from files
set modeline

" Use the silver searcher if available
if executable('ag')
  " Define Ag command to search for the provided text and open a quickfix
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  " Use ag as grep method
  set grepprg=ag\ --nogroup\ --nocolor
endif
