" Root level binding.
let g:lmap = get(g:, 'lmap', {})
let g:spNavigationOneKey = get(g:, 'spNavigationOneKey', 0)
if (g:spNavigationOneKey)
  let g:lmap.d = ['call feedkeys("\<Plug>(easymotion-overwin-f)")', 'easymotion']
else
  let g:lmap.d = ['call feedkeys("\<Plug>(easymotion-overwin-f2)")', 'easymotion']
endif


let g:lmap['N'] = get(g:lmap, 'N', { 'name': '+navigation' })
SpNMap 'N<', 'goto-first-line', 'normal gg'
SpNMap 'N>', 'goto-line', 'SpaceNeovimGoToLine'
SpNMap 'Nb', 'scroll-page-up', 'exe \"normal \<C-b>\"'
SpNMap 'Nj', 'scroll-line-down', 'exe \"normal \<C-e>\"'
SpNMap 'Nf', 'scroll-page-down', 'exe \"normal \<C-f>\"'
SpNMap 'Nk', 'scroll-line-up', 'exe \"normal \<C-y>\"'
SpNMap 'NG', 'goto-last-line', 'normal G'

" Disable default mappings.
let g:EasyMotion_do_mapping = 0
