let g:lmap.f = get(g:lmap, 'f', { 'name': '+files' })
SpNMap 'fr', 'nerdtree-reveal', 'NERDTreeFind'
SpNMap 'fs', 'save-buffer', ':w'
SpNMap 'fS', 'save-buffer', ':w'
SpNMap 'ft', 'nerdtree-toggle', 'NERDTreeToggle'

let g:lmap.f.e = get(g:lmap.f, 'e', { 'name': '+spaceneovim' })
SpNMap 'fed', 'find-dotfile', 'e $MYVIMRC'
SpNMap 'feu', 'update-spaceneovim-layers', 'SpaceNeovimUpdateLayers'
SpNMap 'fep', 'update-plugins', 'PlugUpdate!'
SpNMap 'fec', 'clean-plugins', 'PlugClean!'
SpNMap 'feR', 'sync-configuration', 'SpaceNeovimSyncConfiguration'
