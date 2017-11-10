" Supress the annoying completion messages.
set shortmess+=c

" When the <Enter> key is pressed hide the menu and also start a new line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
