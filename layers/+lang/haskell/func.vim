command! -nargs=0 -bar SpaceNeovimHaskellHoogle call feedkeys(":Hoogle ")
command! -nargs=0 -bar SpaceNeovimHaskellHoogleInfo call feedkeys(":HoogleInfo ")
command! -nargs=0 -bar SpaceNeovimHaskellGhciExpression call feedkeys(":GhciEvaluate ")
command! -nargs=0 -bar SpaceNeovimHaskellInteroTarget call feedkeys(":InteroSetTargets ")
command! -nargs=0 -bar SpaceNeovimHaskellInteroRepl call s:open_intero_repl()
command! -nargs=0 -bar SpaceNeovimHaskellTypeOnHold call s:display_info_on_cursor_hold()


function! s:open_intero_repl()
  :InteroOpen
  :InteroLoadCurrentFile
endfunction

" FIXME: Whenever this is merged https://github.com/neovim/neovim/pull/6619, we could
" use that to display the type information instead.
let s:lsp_info_word_under_cursor = ""
function! s:display_info_on_cursor_hold()
  let l:wordUnderCursor = expand("<cword>")
  if s:lsp_info_word_under_cursor  !=# l:wordUnderCursor
    if g:sp_haskell_backend == 'intero'
      :InteroType
    elseif g:sp_haskell_backend == 'both' || g:sp_haskell_backend == 'ghcmod' || g:sp_haskell_backend == 'ghc-mod'
      :GhcModType
      :GhcModTypeClear
    endif
    " LSP Supports this via `call LanguageClient_textDocument_hover()`, but
    " that needs a way to cut off the output after the first line.
    let s:lsp_info_word_under_cursor = l:wordUnderCursor
  endif
endfunction

fun! CompleteMonths(findstart, base)
  if a:findstart
    " locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    " find months matching with "a:base"
    let res = []
    for m in split("January February Mar Apr May Jun Jul Aug Sep Oct Nov Dec")
      if m =~ '^' . a:base
        call add(res, m)
      endif
    endfor
    return res
  endif
endfun
set completefunc=CompleteMonths
