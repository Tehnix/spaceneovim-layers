function! UpdateSpaceNeovimLayers()
  " Update the SpaceNeovim Layers by performing a git pull operation
  let a:config_dir = $HOME . '/.config/nvim'
  let a:spacevim_layers_dir = expand(resolve(a:config_dir . '/spaceneovim-layers'))

  let a:scratch_buffer = NewScratchBuffer()
  wincmd k

  let l:job_options = {
  \  'on_stdout': function('OutputJobToBuffer')
  \, 'on_stderr': function('OutputJobToBuffer')
  \, 'on_exit': function('OutputJobToBuffer')
  \, 'out': ["Updating SpaceNeovim layers"]
  \, 'cwd': a:spacevim_layers_dir
  \, 'buf': a:scratch_buffer
  \}
  let a:update_layers = jobstart([
  \  'git'
  \, 'pull'
  \, 'origin'
  \, 'master'
  \], l:job_options)
endfunction
