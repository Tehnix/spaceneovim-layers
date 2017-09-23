function! CtrlPFunkyUnderCursor()
  execute 'CtrlPFunky ' . expand('<cword>')
endfunction

command! -nargs=0 -bar CtrlPFunkyUnderCursor call CtrlPFunkyUnderCursor()
