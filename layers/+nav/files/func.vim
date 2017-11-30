command! -nargs=0 -bar SpaceNeovimUpdateLayers call s:update_spaceneovim_layers()
command! -nargs=0 -bar SpaceNeovimSyncConfiguration call g:SyncConfiguration()

function! s:update_spaceneovim_layers()
  " The users home directory.
  let a:home_dir = $HOME
  if has('nvim')
    echo "Updating SpaceNeovim layers, please hold on..."
    let a:config_dir = expand(resolve(a:home_dir . '/.config/nvim'))
    
    " Update the SpaceNeovim Layers by performing a git pull operation
    let a:config_dir = $HOME . '/.config/nvim'
    let a:spacevim_layers_dir = expand(resolve(a:config_dir . '/spaceneovim-layers'))

    let a:scratch_buffer = NewScratchBuffer()
    wincmd k

    let data = {
    \  'out': ['Updating SpaceNeovim layers']
    \, 'buf': a:scratch_buffer
    \}
    let l:job_options = {
    \  'on_stdout': function('OutputJobToBuffer', data)
    \, 'on_stderr': function('OutputJobToBuffer', data)
    \, 'on_exit': function('OutputJobExitToBuffer', [function('g:SyncConfiguration')], data)
    \, 'cwd': a:spacevim_layers_dir
    \}
    let a:update_layers = jobstart([
    \  'git'
    \, 'pull'
    \, 'origin'
    \, 'master'
    \], l:job_options)
  else
    echo "This operation is only implemented for Neovim. Please manually perform a git pull in the layers repository!"
  endif
endfunction

" Make sure the function isn't redefined while being executed, since we are
" sourcing everything again.
if !exists('g:spaceneovim_update_and_sync_already_defined')
  let g:spaceneovim_update_and_sync_already_defined = 1

  "  Sync the configuration, unsetting `g:spaceneovim_postinit_loaded` first,
  " then sourcing the VIM config and finally running postinit. If no arguments
  " are supplied, it'll echo the output, if a buffer number and output list
  " are given, it'll put the output into that buffer.
  function! g:SyncConfiguration(...)
    if a:0 > 0
      let l:buf_nr = a:1
      let l:out = a:2
      let l:out += ["Syncing configuration, please hold on!..."]
      call OutputListToBuffer(l:buf_nr, l:out)
      echo "Wait for the sync to finish!"
      
      let l:out += ["    Setting spaceneovim_postinit_loaded to 0", "    Sourcing $MYVIMRC"]
      call OutputListToBuffer(l:buf_nr, l:out)
      " Start the sync.
      let g:spaceneovim_postinit_loaded = 0
      :source $MYVIMRC

      let l:out += ["    Calling post initialization"]
      call OutputListToBuffer(l:buf_nr, l:out)
      " Start the post initialization.
      call g:Spaceneovim_postinit()

      let l:out += ["Finished configuration sync!"]
      call OutputListToBuffer(l:buf_nr, l:out)
      echo "You are good to go!"
    else
      echo "Syncing configuration, please hold on!..."
      " Start the sync.
      let g:spaceneovim_postinit_loaded = 0
      :source $MYVIMRC
      call g:Spaceneovim_postinit()
      echo "Finished configuration sync!"
    endif
  endfunction
endif
