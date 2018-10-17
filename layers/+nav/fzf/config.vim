let g:lmap.f = get(g:lmap, 'f', { 'name': 'files' })
SpNMap 'fb', 'find-buffer', 'Buffers'
SpNMap 'ff', 'find-file', 'Files'
SpNMap 'fl', 'find-line', 'Lines'

if executable('rg')
  SpNMap 'fg', 'find-rg', 'Rg'
elseif executable('ag')
  SpNMap 'fg', 'find-ag', 'Ag'
endif

if SpaceNeovimIsLayerEnabled('+scm/git')
  SpNMap 'fG', 'find-git-grep', 'GGrep'
endif
