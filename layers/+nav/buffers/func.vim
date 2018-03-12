command! -nargs=1 -bar SwitchBuffer call s:switch_buffer(<args>)
command! -nargs=1 -bar CloseBuffer call s:close_buffer(<args>)

" Activate a buffer by passing it the position in the buffers list,
" ignoring non-modifiable buffers.
fun! s:switch_buffer(n)
  let l:buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && getbufvar(v:val, "&modifiable") && bufloaded(v:val) && bufwinnr(v:val) != -1')
  let l:n = a:n - 1
  if l:n < len(l:buffers)
    exec "buffer " . l:buffers[l:n]
  else
    echo "#" . l:n . " is not a buffer!"
  endif
endfun

" Close a buffer, but only if it's modifiable.
fun! s:close_buffer()
  if &modifiable
    bd
  else
    echo "Won't close buffer, because it is not modifiable."
  endif
endfun
