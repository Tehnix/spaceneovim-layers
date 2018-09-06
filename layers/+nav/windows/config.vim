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

let g:lmap.w['[1-9]'] = ['echo Switching', 'switch-window']
let g:lmap.w.1 = ['1 wincmd w', 'leader_ignore']
let g:lmap.w.2 = ['2 wincmd w', 'leader_ignore']
let g:lmap.w.3 = ['3 wincmd w', 'leader_ignore']
let g:lmap.w.4 = ['4 wincmd w', 'leader_ignore']
let g:lmap.w.5 = ['5 wincmd w', 'leader_ignore']
let g:lmap.w.6 = ['6 wincmd w', 'leader_ignore']
let g:lmap.w.7 = ['7 wincmd w', 'leader_ignore']
let g:lmap.w.8 = ['8 wincmd w', 'leader_ignore']
let g:lmap.w.9 = ['9 wincmd w', 'leader_ignore']
"let g:lmap.w.0 = ['0 wincmd w', '0']

let g:lmap['[1-9]'] = ['echo Switching', 'switch-window']
let g:lmap.1 = [ 1.'wincmd w', 'leader_ignore']
nnoremap <leader>1 :1wincmd w<CR>
let g:lmap.2 = [ 2.'wincmd w', 'leader_ignore']
nnoremap <leader>2 :2wincmd w<CR>
let g:lmap.3 = [ 3.'wincmd w', 'leader_ignore']
nnoremap <leader>3 :3wincmd w<CR>
let g:lmap.4 = [ 4.'wincmd w', 'leader_ignore']
nnoremap <leader>4 :4wincmd w<CR>
let g:lmap.5 = [ 5.'wincmd w', 'leader_ignore']
nnoremap <leader>5 :5wincmd w<CR>
let g:lmap.6 = [ 6.'wincmd w', 'leader_ignore']
nnoremap <leader>6 :6wincmd w<CR>
let g:lmap.7 = [ 7.'wincmd w', 'leader_ignore']
nnoremap <leader>7 :7wincmd w<CR>
let g:lmap.8 = [ 8.'wincmd w', 'leader_ignore']
nnoremap <leader>8 :8wincmd w<CR>
let g:lmap.9 = [ 9.'wincmd w', 'leader_ignore']
nnoremap <leader>9 :9wincmd w<CR>

if has('nvim')
  " Terminal specific mappings
  SpBind 'tmap', 'wj', 'window-down', 'wincmd j', 1
  SpBind 'tmap', 'wk', 'window-up', 'wincmd k', 1
  SpBind 'tmap', 'wh', 'window-left', 'wincmd h', 1
  SpBind 'tmap', 'wl', 'window-right', 'wincmd l', 1
  SpBind 'tmap', 'ww', 'window-other', 'wincmd w', 1
  SpBind 'tmap', 'wd', 'window-close', 'wincmd c', 1
endif
