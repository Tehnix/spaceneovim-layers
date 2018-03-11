command! -nargs=1 -bar SwitchBuffer call s:switch_buffer(<args>)

" Switch to a non hidden, modifiable buffer by its index.
fun! s:switch_buffer(num)
endfun
