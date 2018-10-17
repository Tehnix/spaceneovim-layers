let g:lmap.g = get(g:lmap, 'g', { 'name': 'git' })
SpNMap  'gc', 'commit', 'Gcommit'
SpNMap  'gp', 'push-current-branch', 'PushToCurrentBranch'
SpNMap  'gs', 'status', 'Gstatus'

if SpaceNeovimIsLayerEnabled('+nav/fzf')
  SpNMap  'gl', 'log', 'Commits!'
  SpNMap  'gL', 'log-current-file', 'BCommits!'
else
  SpNMap  'gl', 'log', 'GV'
  SpNMap  'gL', 'log-current-file', 'GV!'
endif

" Disable default mapping for git gutter
let g:gitgutter_map_keys = 0
