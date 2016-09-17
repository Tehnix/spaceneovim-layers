"
" Helper functions for creating layers
"

" General Helper functions {{{
function! NewScratchBuffer()
  " Create an empty buffer in a split below
  rightbelow new
  setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
  return bufnr('%')
endfunction

" Avoid vint complaining about self
" vint: -ProhibitImplicitScopeVariable -ProhibitUsingUndeclaredVariable
function! OutputJobToBuffer(job_id, data, event)
  " Output an async job to a buffer without needing focus on the buffer
  if a:event ==? 'stdout' || a:event ==? 'stderr'
    let self.out += a:data
    " Use the Neovim internal API to update the buffer
    call nvim_buf_set_lines(self.buf, 0, -1, v:true, self.out)
  endif
endfunction
" vint: +ProhibitImplicitScopeVariable +ProhibitUsingUndeclaredVariable
" }}}


" SpeaceNeovim Helper functions {{{
function! SpaceNeovimAddPlugin(name, config)
  " Add a plugin to the list of plugins
  if exists('g:spacevim_plugins')
    call add(g:spacevim_plugins, {'name': a:name, 'config': a:config})
    return 1
  endif
  return 0
endfunction

function! SpaceNeovimIsLayerEnabled(name)
  " Check if a layer is enabled
  if !exists('g:spacevim_enabled_layers')
    return 1
  endif
  return index(g:spacevim_enabled_layers, a:name) != -1
endfunction

function! SpaceNeovimLoadFunc(spath, ...)
  " Source func.vim if no argument given, else load the given script
  let l:script_name = 'func.vim'
  if a:0 > 1
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
