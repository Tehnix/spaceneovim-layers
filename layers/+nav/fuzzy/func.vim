function! CtrlPFunkyUnderCursor()
  execute 'CtrlPFunky ' . expand('<cword>')
endfunction

command! CtrlPFunkyUnderCursor call CtrlPFunkyUnderCursor()
