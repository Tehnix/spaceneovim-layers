command! -nargs=1 -bar SpaceNeovimMoveTabPage call s:move_tab_page(<args>)

" Move a tab page to number n, if it is lower/equal to its current position
" or n+1 if n is higher than its current position. This makes the movement
" behaviour consistent with what you'd expect.
function! s:move_tab_page(n)
  let l:currentNo = tabpagenr()
  if (a:n + 1) <= l:currentNo
    exe 'tabmove ' . a:n
  else
    exe 'tabmove ' . (a:n + 1)
  endif
endfunction
