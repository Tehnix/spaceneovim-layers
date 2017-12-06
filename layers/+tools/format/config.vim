let g:sp_format_on_save = get(g:, 'spFormatOnSave', 1)

let g:lmap.x = get(g:lmap, 'x', { 'name': '+text' })
SpNMap 'xf', 'format-buffer-or-selection', 'Neoformat'

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
" Only msg when there is an error.
let g:neoformat_only_msg_on_error = 1

if g:sp_format_on_save
  augroup fmt
    au!
    au BufWritePre * undojoin | Neoformat
  augroup END
endif
