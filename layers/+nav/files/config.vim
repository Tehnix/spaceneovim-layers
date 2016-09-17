function! s:finished_update()
  echo "SpaceNeovim layers have been updated"
endfunction

function! s:update_spaceneovim_layers()
  let s:config_dir = $HOME . '/.config/nvim'
  let s:spacevim_layers_dir = expand(resolve(s:config_dir . '/spaceneovim-layers'))

  echo "Updating SpaceNeovim layers"
  let update_layers = jobstart([
  \  'git'
  \, '-C'
  \, s:spacevim_layers_dir
  \, 'pull'
  \, 'origin'
  \, 'master'
  \], {'on_exit': function('s:finished_update')})
  let waiting_for_update = jobwait([update_layers])
endfunction

if spacevim#is_layer_enabled('+nav/files')
  command! UpdateSpaceNeovimLayers call s:update_spaceneovim_layers()

  let g:lmap.f = { 'name': '+files' }
  call spacevim#bind('map', 'fs', 'save-buffer', 'w', 1)
  call spacevim#bind('map', 'ft', 'nerdtree-toggle', 'NERDTreeToggle', 1)

  let g:lmap.f.s = { 'name': 'spaceneovim/files' }
  call spacevim#bind('map', 'fsd', 'find-config-file', 'e $MYVIMRC', 1)
  call spacevim#bind('map', 'fsU', 'update-spaceneovim-layers', 'UpdateSpaceNeovimLayers', 1)
endif
