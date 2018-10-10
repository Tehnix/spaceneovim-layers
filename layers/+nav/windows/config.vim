let g:lmap.w = get(g:lmap, 'w', { 'name': '+windows' })
SpNMap 'ws', 'split-window-below', 'rightbelow split'
SpNMap 'wv', 'split-window-right', 'rightbelow vsplit'
SpNMap 'wo', 'make-current-window-only-one', 'wincmd o'
SpNMap 'wj', 'window-down', 'wincmd j'
SpNMap 'wk', 'window-up', 'wincmd k'
SpNMap 'wh', 'window-left', 'wincmd h'
SpNMap 'wl', 'window-right', 'wincmd l'
SpNMap 'ww', 'window-other', 'wincmd w'
SpNMap 'wd', 'window-close', 'wincmd c'


nnoremap <leader>1 :1wincmd w<CR>
nnoremap <leader>w1 :1wincmd w<CR>
let g:lmap.1 = 'leader_ignore'
let g:lmap.w.1 = 'leader_ignore'
nnoremap <leader>2 :2wincmd w<CR>
nnoremap <leader>w2 :2wincmd w<CR>
let g:lmap.2 = 'leader_ignore'
let g:lmap.w.2 = 'leader_ignore'
nnoremap <leader>3 :3wincmd w<CR>
nnoremap <leader>w3 :3wincmd w<CR>
let g:lmap.3 = 'leader_ignore'
let g:lmap.w.3 = 'leader_ignore'
nnoremap <leader>4 :4wincmd w<CR>
nnoremap <leader>w4 :4wincmd w<CR>
let g:lmap.4 = 'leader_ignore'
let g:lmap.w.4 = 'leader_ignore'
nnoremap <leader>5 :5wincmd w<CR>
nnoremap <leader>w5 :5wincmd w<CR>
let g:lmap.5 = 'leader_ignore'
let g:lmap.w.5 = 'leader_ignore'
nnoremap <leader>6 :6wincmd w<CR>
nnoremap <leader>w6 :6wincmd w<CR>
let g:lmap.6 = 'leader_ignore'
let g:lmap.w.6 = 'leader_ignore'
nnoremap <leader>7 :7wincmd w<CR>
nnoremap <leader>w7 :7wincmd w<CR>
let g:lmap.7 = 'leader_ignore'
let g:lmap.w.7 = 'leader_ignore'
nnoremap <leader>8 :8wincmd w<CR>
nnoremap <leader>w8 :8wincmd w<CR>
let g:lmap.8 = 'leader_ignore'
let g:lmap.w.8 = 'leader_ignore'
nnoremap <leader>9 :9wincmd w<CR>
nnoremap <leader>w9 :9wincmd w<CR>
let g:lmap.9 = 'leader_ignore'
let g:lmap.w.9 = 'leader_ignore'

let g:lmap.w['[1-9]'] = ['echo Switching', 'switch-window']
let g:lmap['[1-9]'] = ['echo Switching', 'switch-window']

if has('nvim')
  " Terminal specific mappings
  SpBind 'tmap', 'wj', 'window-down', 'wincmd j', 1
  SpBind 'tmap', 'wk', 'window-up', 'wincmd k', 1
  SpBind 'tmap', 'wh', 'window-left', 'wincmd h', 1
  SpBind 'tmap', 'wl', 'window-right', 'wincmd l', 1
  SpBind 'tmap', 'ww', 'window-other', 'wincmd w', 1
  SpBind 'tmap', 'wd', 'window-close', 'wincmd c', 1
endif
