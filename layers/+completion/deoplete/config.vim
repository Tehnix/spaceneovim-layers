" Enable deoplete upon first entering into insert mode.
let g:deoplete#enable_at_startup = 0
augroup deopleteConfig
  au!
  au InsertEnter * call deoplete#enable()
augroup END

" You must disable deoplete when using vim-multiple-cursors.
function g:Multiple_cursors_before()
 let g:deoplete#disable_auto_complete = 1
endfunction
function g:Multiple_cursors_after()
 let g:deoplete#disable_auto_complete = 0
endfunction

" Enable auto select feature.
"set completeopt+=noinsert

" Insert a newline instead of just closing the popup.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
 return deoplete#close_popup() . "\<CR>"
endfunction
