"
" Helper functions for setting up key bindings and groups
"

" Cleaned up API.
command! -nargs=+ -bar SpBind call SpaceNeovimBufBind(<args>)
command! -nargs=+ -bar SpMap call SpaceNeovimBufMap(<args>)
command! -nargs=+ -bar SpNMap call SpaceNeovimBufNMap(<args>)
command! -nargs=+ -bar SpFileTypeBind call SpaceNeovimFTBind(<args>)
command! -nargs=+ -bar SpFileTypeMap call SpaceNeovimFTMap(<args>)
command! -nargs=+ -bar SpFileTypeNMap call SpaceNeovimFTNMap(<args>)
" FIXME: Currently these do not take effect, so they are disabled for now.
command! -nargs=+ -bar SpFileTypeGroup call SpaceNeovimFileTypeGroup(<args>)
command! -nargs=+ -bar SpFileTypeGroup2 call SpaceNeovimFileTypeGroup2(<args>)
command! -nargs=+ -bar SpFileTypeGroup3 call SpaceNeovimFileTypeGroup3(<args>)

""
" Debug messages to the console.
"
function! s:debug(msg)
  if g:dotspaceneovim_layer_debug
    echom a:msg
  endif
endfunction

" NOTE: Use `SpaceNeovimBufBind` instead since this section is currently broken.
" See https://github.com/Tehnix/spaceneovim/issues/23 for more info.
" Mapping functions for normal commands {{{
function! SpaceNeovimBind(key_map, binding, name, value, isCmd)
  call s:debug('+++ Adding mapping to key ' . a:binding . ' for cmd: ' . a:name)
  " Register keybindings for the various modes.
  if a:isCmd
    let l:value = ':' . a:value . '<cr>'
  else
    let l:value = a:value
  endif
  if a:key_map ==# 'map' && maparg('<Leader>' . a:binding, '') ==# ''
    let l:noremap = 'noremap'
  elseif a:key_map ==# 'nmap' && maparg('<Leader>' . a:binding, 'n') ==# ''
    let l:noremap = 'nnoremap'
  elseif a:key_map ==# 'vmap' && maparg('<Leader>' . a:binding, 'v') ==# ''
    let l:noremap = 'vnoremap'
  elseif a:key_map ==# 'tmap' && maparg('<Leader>' . a:binding, 't') ==# ''
    let l:noremap = 'tnoremap'
  else
    let l:noremap = ''
  endif

  if l:noremap !=# ''
    execute l:noremap . ' <silent> <SID>' . a:name . '# ' . l:value
    execute a:key_map . ' <Leader>' . a:binding . ' <SID>' . a:name . '#'
  endif
endfunction

function! SpaceNeovimMap(binding, name, value, ...)
  " Convenience function for SpaceNeovimBind using map/noremap.
  let l:isCmd = 1
  if a:0 > 0
    let l:isCmd = a:1
  endif
  call SpaceNeovimBind('map', a:binding, a:name, a:value, l:isCmd)
endfunction

function! SpaceNeovimNMap(binding, name, value, ...)
  " Convenience function for SpaceNeovimBind using nmap/nnoremap.
  let l:isCmd = 1
  if a:0 > 0
    let l:isCmd = a:1
  endif
  call SpaceNeovimBind('nmap', a:binding, a:name, a:value, l:isCmd)
endfunction
" }}}

" Mapping functions for file type specific commands, on `au VimEnter` {{{
function! SpaceNeovimBufBind(map, binding, name, value, isCmd)
  call s:debug('+++ Adding BufEnter mapping to key ' . a:binding . ' for cmd: ' . a:name)
  " Register keybindings for a specific filetype for the various modes.
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
    execute 'au VimEnter * ' . l:noremap . ' <SID>' . a:name . '# ' . l:value
    execute 'au VimEnter * ' . a:map . ' <Leader>' . a:binding . ' <SID>' . a:name . '#'
  endif
endfunction

function! SpaceNeovimBufMap(binding, name, value, ...)
  " Convenience function for SpaceNeovimBind using map/noremap.
  let l:isCmd = 1
  if a:0 > 0
    let l:isCmd = a:1
  endif
  call SpaceNeovimBufBind('map', a:binding, a:name, a:value, l:isCmd)
endfunction

function! SpaceNeovimBufNMap(binding, name, value, ...)
  " Convenience function for SpaceNeovimBind using nmap/nnoremap.
  let l:isCmd = 1
  if a:0 > 0
    let l:isCmd = a:1
  endif
  call SpaceNeovimBufBind('nmap', a:binding, a:name, a:value, l:isCmd)
endfunction
" }}}

" Mapping functions for file type specific commands {{{
function! SpaceNeovimFTBind(ft, map, binding, name, value, isCmd)
  call s:debug('-+- Adding FT mapping to key ' . a:binding . ' for cmd: ' . a:name . ' for file type ' . a:ft)
  " Register keybindings for a specific filetype for the various modes.
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
    execute 'au VimEnter * if &ft ==? "' . a:ft . '" | ' . l:noremap . ' <buffer> <SID>' . a:name . '# ' . l:value . '  | endif '
    execute 'au VimEnter * if &ft ==? "' . a:ft . '" | ' . a:map . ' <buffer> <Leader>' . a:binding . ' <SID>' . a:name . '#  | endif '

    execute 'au FileType ' . a:ft . ' ' . l:noremap . ' <buffer> <SID>' . a:name . '# ' . l:value
    execute 'au FileType ' . a:ft . ' ' . a:map . ' <buffer> <Leader>' . a:binding . ' <SID>' . a:name . '#'
  endif
endfunction

function! SpaceNeovimFTMap(tfile, binding, name, value, ...)
  " Convenience function for SpaceNeovimBind using map/noremap.
  let l:isCmd = 1
  if a:0 > 0
    let l:isCmd = a:1
  endif
  call SpaceNeovimFTBind(a:tfile, 'map', a:binding, a:name, a:value, l:isCmd)
endfunction

function! SpaceNeovimFTNMap(tfile, binding, name, value, ...)
  " Convenience function for SpaceNeovimBind using nmap/nnoremap.
  let l:isCmd = 1
  if a:0 > 0
    let l:isCmd = a:1
  endif
  call SpaceNeovimFTBind(a:tfile, 'nmap', a:binding, a:name, a:value, l:isCmd)
endfunction
" }}}


" Grouping functions for file type groups (under SPC m) {{{
function! SpaceNeovimFileTypeGroup(ft, group, name)
  " Register keybindings for a specific filetype for the various modes.
  " execute 'au VimEnter * if &ft ==? "' . a:ft . '" | let g:lmap.m.' . a:group . ' = { "name": "' . a:name . '" } | endif '
  " execute 'au FileType ' . a:ft . ' let g:lmap.m.' . a:group . ' = { "name": "' . a:name . '" } '
  execute 'au FileType ' . a:ft . ' let g:lmap.m.' . a:group . ' = get(g:lmap, "' . a:group . '", { "name": "' . a:name . '" })'
endfunction

function! SpaceNeovimFileTypeGroup2(ft, group1, group2, name)
  " Register keybindings for a specific filetype for the various modes.
  execute 'au VimEnter * if &ft ==? "' . a:ft . '" | let g:lmap.m.' . a:group1 . '.' . a:group2 . ' = { "name": "' . a:name . '" } | endif '
  execute 'au BufEnter * if &ft ==? "' . a:ft . '" | let g:lmap.m.' . a:group1 . '.' . a:group2 . ' = { "name": "' . a:name . '" } | endif '
endfunction

function! SpaceNeovimFileTypeGroup3(ft, group1, group2, group3, name)
  " Register keybindings for a specific filetype for the various modes.
  execute 'au VimEnter * if &ft ==? "' . a:ft . '" | let g:lmap.m.' . a:group1 . '.' . a:group2 . '.' . a:group3 . ' = { "name": "' . a:name . '" } | endif '
  execute 'au BufEnter * if &ft ==? "' . a:ft . '" | let g:lmap.m.' . a:group1 . '.' . a:group2 . '.' . a:group3 . ' = { "name": "' . a:name . '" } | endif '
endfunction
" }}}
