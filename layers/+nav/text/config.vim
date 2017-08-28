let g:lmap.x = get(g:lmap, 'x', { 'name': '+text' })
SpNMap 'xJ', 'move-text-down', 'm+'
SpNMap 'xK', 'move-text-up', 'm .-2'
SpNMap 'xU', 'uppercase-word', 'gUiw'
SpNMap 'xu', 'downcase-word', 'guiw'
