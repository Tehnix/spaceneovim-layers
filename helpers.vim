"
" Helper functions for creating layers
"

" Cleaned up API.
command! -nargs=+ -bar SpAddPlugin call SpaceNeovimAddPlugin(<args>)
command! -nargs=+ -bar SpSpaceIndent call SpaceNeovimSetFTIndentation(<args>)
command! -nargs=+ -bar SpTabsIndent call SpaceNeovimSetFTTabsIndentation(<args>)
command! -nargs=1 -bar SpCleanupFileTypeGroups call SpaceNeovimCleanupFileTypeGroups(<args>)
command! -nargs=+ -bar SpLoadFunc call SpaceNeovimLoadFunc(<args>)

" General Helper functions {{{
  " Avoid vint complaining about self
  " vint: -ProhibitImplicitScopeVariable -ProhibitUsingUndeclaredVariable

  " Create a non modifiable buffer in a split below.
  function! NewScratchBuffer()
    rightbelow new
    setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
    return bufnr('%')
  endfunction

  " Make sure we don't redefine these functions upon resourcing the VIM config.
  if !exists('g:spaceneovim_buffer_output_functions_defined')
    let g:spaceneovim_buffer_output_functions_defined = 1

    " Simply output a list to a buffer without focusing it, and then
    " call redraw to make sure it takes effect.
    function! OutputListToBuffer(buf_nr, out) 
      call nvim_buf_set_lines(a:buf_nr, 0, -1, v:true, a:out)
      redraw
    endfunction

    " Output an async job to a buffer without needing focus on the buffer.
    function! OutputJobToBuffer(job_id, data, event) dict
      if a:event ==? 'stdout' || a:event ==? 'stderr'
        let self.out += a:data
        " Use the Neovim internal API to update the buffer
        call nvim_buf_set_lines(self.buf, 0, -1, v:true, self.out)
      endif
    endfunction
    
    " Same as `OutputJobToBuffer`, but takes a callback function to call when
    " finished. Note, we have to make sure it doesn't get redefined, because the 
    " callback might reload the VIM config (arguably the original usecase).
    function! OutputJobExitToBuffer(exit_func, job_id, data, event) dict
      if a:event ==? 'stdout' || a:event ==? 'stderr'
        let self.out += a:data
        " Use the Neovim internal API to update the buffer
        call nvim_buf_set_lines(self.buf, 0, -1, v:true, self.out)
      endif
      call a:exit_func(self.buf, self.out)
    endfunction
  endif

" vint: +ProhibitImplicitScopeVariable +ProhibitUsingUndeclaredVariable
" }}}


" SpeaceNeovim Helper functions {{{
function! SpaceNeovimSetFTIndentation(ft, indentation)
  let l:indent = get(g:, 'sp_' . a:ft . '_indentation', a:indentation)
  execute 'au FileType ' . a:ft . ' setlocal expandtab shiftwidth=' . l:indent . ' tabstop=' . l:indent
endfunction

function! SpaceNeovimSetFTTabsIndentation(ft, indentation)
  let l:indent = get(g:, 'sp_' . a:ft . '_indentation', a:indentation)
  execute 'au FileType ' . a:ft . ' setlocal noexpandtab shiftwidth=' . l:indent . ' tabstop=' . l:indent
endfunction

function! SpaceNeovimAddPlugin(name, ...)
  let l:config = get(a:, '1', {})
  " Add a plugin to the list of plugins
  call spaceneovim#layer_plugin(a:name, l:config)
endfunction

function! SpaceNeovimIsLayerEnabled(name)
  " Check if a layer is enabled
  if !exists('g:spaceneovim_enabled_layers')
    return 1
  endif
  for l:layer_source in g:dotspaceneovim_layer_sources
    if index(g:spaceneovim_enabled_layers[l:layer_source], a:name) != -1
      return 1
    endif
  endfor
endfunction

function! SpaceNeovimLoadFunc(spath, ...)
  " Source func.vim if no argument given, else load the given script
  let l:script_name = 'func.vim'
  if a:0 > 0
    let l:script_name = a:1
  endif
  let l:path = fnamemodify(resolve(a:spath), ':h')
  execute 'source ' . l:path . '/' . l:script_name
endfunction

function! SpaceNeovimCleanupFileTypeGroups(ft)
  " Clean up the menus for the file type on buffer leave
  execute 'au BufLeave * if &ft ==# "' . a:ft . '" | let g:lmap.m = { "name": "+major-mode-cmd" } | endif '
endfunction
" }}}
