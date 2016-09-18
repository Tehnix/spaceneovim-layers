"
" Helper functions for setting up key bindings and groups
"

" Mapping functions for normal commands {{{
function! SpaceNeovimBind(map, binding, name, value, isCmd)
  " Register keybindings for the various modes
  if a:isCmd
    let l:value = ':' . a:value . '<cr>'
  else
    let l:value = a:value
  endif
  if a:map ==# 'map' && maparg('<Leader>' . a:binding, '') ==# ''
    let l:noremap = 'noremap'
  elseif a:map ==# 'nmap' && maparg('<Leader>' . a:binding, 'n') ==# ''
    let l:noremap = 'nnoremap'
  elseif a:map ==# 'vmap' && maparg('<Leader>' . a:binding, 'v') ==# ''
    let l:noremap = 'vnoremap'
  elseif a:map ==# 'tmap' && maparg('<Leader>' . a:binding, 't') ==# ''
    let l:noremap = 'tnoremap'
  else
    let l:noremap = ''
  endif

  if l:noremap !=# ''
    execute l:noremap . ' <silent> <SID>' . a:name . '# ' . l:value
    execute a:map . ' <Leader>' . a:binding . ' <SID>' . a:name . '#'
  endif
endfunction

function! SpaceNeovimMap(binding, name, value, ...)
  " Convenience function for SpaceNeovimBind using map/noremap
  let l:isCmd = 1
  if a:0 > 1
    let l:isCmd = a:1
  endif
  call SpaceNeovimBind('map', a:binding, a:name, a:value, l:isCmd)
endfunction

function! SpaceNeovimNMap(binding, name, value, ...)
  " Convenience function for SpaceNeovimBind using nmap/nnoremap
  let l:isCmd = 1
  if a:0 > 1
    let l:isCmd = a:1
  endif
  call SpaceNeovimBind('nmap', a:binding, a:name, a:value, l:isCmd)
endfunction
" }}}


" Mapping functions for file type specific commands {{{
function! SpaceNeovimFTBind(ft, map, binding, name, value, isCmd)
  " Register keybindings for a specific filetype for the various modes
  if a:isCmd
    let l:value = ':' . a:value . '<cr>'
  else
    let l:value = a:value
  endif
  if a:map ==# 'map' && maparg('<Leader>' . a:binding, '') ==# ''
    let l:noremap = 'noremap'
  elseif a:map ==# 'nmap' && maparg('<Leader>' . a:binding, 'n') ==# ''
    let l:noremap = 'nnoremap'
  elseif a:map ==# 'vmap' && maparg('<Leader>' . a:binding, 'v') ==# ''
    let l:noremap = 'vnoremap'
  elseif a:map ==# 'tmap' && maparg('<Leader>' . a:binding, 't') ==# ''
    let l:noremap = 'tnoremap'
  else
    let l:noremap = ''
  endif

  if l:noremap !=# ''
    execute 'au FileType ' . a:ft . ' ' . l:noremap . ' <buffer> <SID>' . a:name . '# ' . l:value
    execute 'au FileType ' . a:ft . ' ' . a:map . ' <buffer> <Leader>' . a:binding . ' <SID>' . a:name . '#'
  endif
endfunction

function! SpaceNeovimFTMap(tfile, binding, name, value, ...)
  " Convenience function for SpaceNeovimBind using map/noremap
  let l:isCmd = 1
  if a:0 > 1
    let l:isCmd = a:1
  endif
  call SpaceNeovimFTBind(a:tfile, 'map', a:binding, a:name, a:value, l:isCmd)
endfunction

function! SpaceNeovimFTNMap(tfile, binding, name, value, ...)
  " Convenience function for SpaceNeovimBind using nmap/nnoremap
  let l:isCmd = 1
  if a:0 > 1
    let l:isCmd = a:1
  endif
  call SpaceNeovimFTBind(a:tfile, 'nmap', a:binding, a:name, a:value, l:isCmd)
endfunction
" }}}


" Grouping functions for file type groups (under SPC m) {{{
function! SpaceNeovimFileTypeGroup(ft, group, name)
  " Register keybindings for a specific filetype for the various modes
  execute 'au FileType ' . a:ft . ' let g:lmap.m.' . a:group . ' = { "name": "' . a:name . '" }'
endfunction

function! SpaceNeovimFileTypeGroup2(ft, group1, group2, name)
  " Register keybindings for a specific filetype for the various modes
  execute 'au BufEnter * if &ft ==? "' . a:ft . '" | let g:lmap.m.' . a:group1 . '.' . a:group2 . ' = { "name": "' . a:name . '" } | endif '
endfunction

function! SpaceNeovimFileTypeGroup3(ft, group1, group2, group3, name)
  " Register keybindings for a specific filetype for the various modes
  execute 'au BufEnter * if &ft ==? "' . a:ft . '" | let g:lmap.m.' . a:group1 . '.' . a:group2 . '.' . a:group3 . ' = { "name": "' . a:name . '" } | endif '
endfunction
" }}}
