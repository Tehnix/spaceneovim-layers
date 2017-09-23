function! UppercaseWord()
  exe ':normal gUiw'
endfunction

function! DowncaseWord()
  exe ':normal guiw'
endfunction

command! -nargs=0 -bar UppercaseWord call UppercaseWord()
command! -nargs=0 -bar DowncaseWord call DowncaseWord()
