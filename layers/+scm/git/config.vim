let g:lmap.g = get(g:lmap, 'g', { 'name': '+git' })
SpNMap  'gc', 'commit', 'Gcommit'
SpNMap  'gl', 'log', 'GV'
SpNMap  'gL', 'log-current-file', 'GV!'
SpNMap  'gp', 'push-current-branch', 'PushToCurrentBranch'
SpNMap  'gs', 'status', 'Gstatus'

" Disable default mapping for git gutter
let g:gitgutter_map_keys = 0
