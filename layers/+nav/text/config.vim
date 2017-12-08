let g:lmap.x = get(g:lmap, 'x', { 'name': '+text' })
SpNMap 'xJ', 'move-text-down', 'm+'
SpNMap 'xK', 'move-text-up', 'm .-2'
SpNMap 'xU', 'uppercase-word', 'UppercaseWord'
SpNMap 'xu', 'downcase-word', 'DowncaseWord'

" Map Alt/Option-[jk] to move lines up and down.
if has('macunix')
  nnoremap ‹ :m .+1<CR>==
  nnoremap ∆ :m .-2<CR>==
  inoremap ‹ <Esc>:m .+1<CR>==gi
  inoremap ∆ <Esc>:m .-2<CR>==gi
  vnoremap ‹ :m '>+1<CR>gv=gv
  vnoremap ∆ :m '<-2<CR>gv=gv
else
  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv
endif
