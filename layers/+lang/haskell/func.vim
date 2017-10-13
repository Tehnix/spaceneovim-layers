command! -nargs=0 -bar SpaceNeovimHaskellHoogle call feedkeys(":Hoogle ")
command! -nargs=0 -bar SpaceNeovimHaskellHoogleInfo call feedkeys(":HoogleInfo ")
command! -nargs=0 -bar SpaceNeovimHaskellGhciExpression call feedkeys(":GhciEvaluate ")
command! -nargs=0 -bar SpaceNeovimHaskellInteroTarget call feedkeys(":InteroSetTargets ")
command! -nargs=0 -bar SpaceNeovimHaskellInteroRepl call s:open_intero_repl()


function! s:open_intero_repl()
  :InteroOpen
  :InteroLoadCurrentFile
endfunction
