call SpaceNeovimLoadFunc(expand('<sfile>:p'), 'func.vim')

let g:lmap.f = get(g:lmap, 'f', { 'name': '+files' })
call SpaceNeovimNMap('fr', 'nerdtree-reveal', 'NERDTreeFind')
call SpaceNeovimNMap('fs', 'save-buffer', 'update')
call SpaceNeovimNMap('ft', 'nerdtree-toggle', 'NERDTreeToggle')

let g:lmap.f.e = { 'name': 'spaceneovim/files' }
call SpaceNeovimNMap('fed', 'edit-config-file', 'e $MYVIMRC')
call SpaceNeovimNMap('feu', 'update-spaceneovim-layers', 'UpdateSpaceNeovimLayers')
call SpaceNeovimNMap('fep', 'update-plugins', 'PlugInstall!')
call SpaceNeovimNMap('fec', 'clean-plugins', 'PlugClean!')
call SpaceNeovimNMap('fer', 'reload-config-file', 'source $MYVIMRC')
