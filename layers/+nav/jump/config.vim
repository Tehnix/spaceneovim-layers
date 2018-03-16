" Root level binding.
let g:lmap.j = get(g:lmap, 'j', { 'name': '+jump/join/split' })
SpNMap 'jj', 'goto-char', 'call feedkeys(\"\<Plug>(easymotion-overwin-f)\")'
SpNMap 'jJ', 'goto-char-2', 'call feedkeys(\"\<Plug>(easymotion-overwin-f2)\")'
SpNMap 'jw', 'goto-word', 'call feedkeys(\"\<Plug>(easymotion-overwin-w)\")'
SpNMap 'jl', 'goto-line', 'call feedkeys(\"\<Plug>(easymotion-overwin-line)\")'

" Disable default mappings.
let g:EasyMotion_do_mapping = 0
