call SpaceNeovimLoadFunc(expand('<sfile>:p'), 'func.vim')

let g:lmap.f = get(g:lmap, 'f', { 'name': '+files' })
call SpaceNeovimNMap('fb', 'find-buffer', 'CtrlPBuffer')
call SpaceNeovimNMap('ff', 'find-file', 'CtrlP')
call SpaceNeovimNMap('fm', 'find-method', 'CtrlPFunky')
call SpaceNeovimNMap('fM', 'find-method-under-cursor', 'CtrlPFunkyUnderCursor')
call SpaceNeovimNMap('fr', 'find-recently-used', 'CtrlPMRU')

" Disable default mapping for CtrlP
let g:ctrlp_map = ''

" Always open files in new buffers
let g:ctrlp_switch_buffer = 0

" Respect current working directory during Vim session
let g:ctrlp_working_path_mode = 0

" Use the silver searcher if available to speed up indexing
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -f -l -U --hidden --nocolor -g ""'
  let g:ctrlp_use_caching = 0
end
