" Set layer specific configurations {{{
" Use powerline fonts for airline
if !exists('g:sp_airline_disable_powerline_fonts') || g:sp_airline_disable_powerline_fonts == 0
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_powerline_fonts = 1
  let g:airline_symbols.space = "\ua0"
endif
" }}}
