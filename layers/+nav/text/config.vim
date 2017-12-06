let g:lmap.x = get(g:lmap, 'x', { 'name': '+text' })
SpNMap 'xJ', 'move-text-down', 'm+'
SpNMap 'xK', 'move-text-up', 'm .-2'
SpNMap 'xU', 'uppercase-word', 'UppercaseWord'
SpNMap 'xu', 'downcase-word', 'DowncaseWord'

" Map Alt/Option-[jk] to move lines up and down.
nnoremap <C-J> :m .+1<CR>==
nnoremap <C-K> :m .-2<CR>==
inoremap <C-J> <Esc>:m .+1<CR>==gi
inoremap <C-K> <Esc>:m .-2<CR>==gi
vnoremap <C-J> :m '>+1<CR>gv=gv
vnoremap <C-K> :m '<-2<CR>gv=gv
