call SpaceNeovimLoadFunc(expand('<sfile>:p'), 'func.vim')

let g:lmap.f = { 'name': '+files' }
call SpaceNeovimNMap('fs', 'save-buffer', 'update')
call SpaceNeovimNMap('ft', 'nerdtree-toggle', 'NERDTreeToggle')

let g:lmap.f.e = { 'name': 'spaceneovim/files' }
call SpaceNeovimNMap('fed', 'find-config-file', 'e $MYVIMRC')
call SpaceNeovimNMap('feU', 'update-spaceneovim-layers', 'UpdateSpaceNeovimLayers')
call SpaceNeovimNMap('fep', 'update-plugins', 'PlugInstall!')
