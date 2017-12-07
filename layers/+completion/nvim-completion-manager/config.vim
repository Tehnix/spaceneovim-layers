" Supress the annoying completion messages.
set shortmess+=c

" When the <Enter> key is pressed hide the menu and also start a new line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Expanding snippet in the popup menu with <Enter> key. Suppose you use the <C-U> key for expanding snippet.
imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"\<CR>")
