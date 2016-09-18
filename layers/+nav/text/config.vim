let g:lmap.x = { 'name': '+text' }
call SpaceNeovimNMap('xJ', 'move-text-down', 'm+')
call SpaceNeovimNMap('xK', 'move-text-up', 'm .-2')
call SpaceNeovimNMap('xU', 'uppercase-word', 'gUiw')
call SpaceNeovimNMap('xu', 'downcase-word', 'guiw')
