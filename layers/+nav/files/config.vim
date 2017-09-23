let g:lmap.f = get(g:lmap, 'f', { 'name': '+files' })
SpNMap 'fr', 'nerdtree-reveal', 'NERDTreeFind'
SpNMap 'fs', 'save-buffer', 'update'
SpNMap 'ft', 'nerdtree-toggle', 'NERDTreeToggle'

" FIXME: For some reason this grouping isn't showing up?
let g:lmap.f.e = get(g:lmap.f, 'e', { 'name': '+spaceneovim' })
SpNMap 'fed', 'edit-config-file', 'e $MYVIMRC'
SpNMap 'feu', 'update-spaceneovim-layers', 'UpdateSpaceNeovimLayers'
SpNMap 'fep', 'update-plugins', 'PlugInstall!'
SpNMap 'fec', 'clean-plugins', 'PlugClean!'
SpNMap 'fer', 'reload-config-file', 'source $MYVIMRC'
