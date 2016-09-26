"call SpaceNeovimMap('0', 'window 1', '1 wincmd w')
"call SpaceNeovimMap('1', 'window 2', '2 wincmd w')
"call SpaceNeovimMap('2', 'window 3', '3 wincmd w')
"call SpaceNeovimNMap('3', 'window 4', '4 wincmd w')
"call SpaceNeovimNMap('4', 'window 5', '5 wincmd w')
"call SpaceNeovimNMap('5', 'window 6', '6 wincmd w')
"call SpaceNeovimNMap('6', 'window 7', '7 wincmd w')
"call SpaceNeovimNMap('7', 'window 8', '8 wincmd w')
"call SpaceNeovimNMap('8', 'window 9', '9 wincmd w')
"call SpaceNeovimNMap('9', 'window 10', '10 wincmd w')

let g:lmap.w = { 'name': '+windows' }
call SpaceNeovimNMap('ws', 'split-window-below', 'rightbelow split')
call SpaceNeovimNMap('wv', 'split-window-right', 'rightbelow vsplit')
call SpaceNeovimNMap('wo', 'make-current-window-only-one', 'wincmd o')
call SpaceNeovimNMap('wj', 'window-down', 'wincmd j')
call SpaceNeovimNMap('wk', 'window-up', 'wincmd k')
call SpaceNeovimNMap('wh', 'window-left', 'wincmd h')
call SpaceNeovimNMap('wl', 'window-right', 'wincmd l')
call SpaceNeovimNMap('ww', 'window-other', 'wincmd w')

if has('nvim')
  " Terminal specific mappings
  call SpaceNeovimBind('tmap', 'wj', 'window-down', 'wincmd j', 1)
  call SpaceNeovimBind('tmap', 'wk', 'window-up', 'wincmd k', 1)
  call SpaceNeovimBind('tmap', 'wh', 'window-left', 'wincmd h', 1)
  call SpaceNeovimBind('tmap', 'wl', 'window-right', 'wincmd l', 1)
  call SpaceNeovimBind('tmap', 'ww', 'window-other', 'wincmd w', 1)
endif
