call SpaceNeovimLoadFunc(expand('<sfile>:p'), 'func.vim')

let g:lmap.g = { 'name': '+git' }
call SpaceNeovimNMap('gc', 'commit', 'Gcommit')
call SpaceNeovimNMap('gl', 'log', 'GV')
call SpaceNeovimNMap('gL', 'log-current-file', 'GV!')
call SpaceNeovimNMap('gp', 'push-current-branch', 'PushToCurrentBranch')
call SpaceNeovimNMap('gs', 'status', 'Gstatus')

" Disable default mapping for git gutter
let g:gitgutter_map_keys = 0
