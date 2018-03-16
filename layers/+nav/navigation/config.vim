let g:lmap['N'] = get(g:lmap, 'N', { 'name': '+navigation' })
SpNMap 'N<', 'goto-first-line', 'normal gg'
SpNMap 'N>', 'goto-line', 'SpaceNeovimGoToLine'
SpNMap 'Nb', 'scroll-page-up', 'exe \"normal \<C-b>\"'
SpNMap 'Nj', 'scroll-line-down', 'exe \"normal \<C-e>\"'
SpNMap 'Nf', 'scroll-page-down', 'exe \"normal \<C-f>\"'
SpNMap 'Nk', 'scroll-line-up', 'exe \"normal \<C-y>\"'
SpNMap 'NG', 'goto-last-line', 'normal G'
