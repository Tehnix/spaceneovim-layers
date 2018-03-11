let g:lmap.f = get(g:lmap, 'f', { 'name': '+files' })
SpNMap 'fb', 'find-buffer', 'CtrlPBuffer'
SpNMap 'ff', 'find-file', 'CtrlP'
SpNMap 'fm', 'find-method', 'CtrlPFunky'
SpNMap 'fM', 'find-method-under-cursor', 'CtrlPFunkyUnderCursor'
SpNMap 'fR', 'find-recently-used', 'CtrlPMRU'

" Disable default mapping for CtrlP (but allow <c-p>)
let g:ctrlp_map = get(g:, 'sp_ctrlp_map', '')
nnoremap <c-p> :CtrlP<CR>

" Ignore certain files/folders in CtrlP.
let g:ctrlp_custom_ignore = get(g:, 'sp_ctrlp_custom_ignore', '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn|stack-work))$')

" Always open files in new buffers
let g:ctrlp_switch_buffer = get(g:, 'sp_ctrlp_switch_buffer', 0)

" Respect current working directory during Vim session
let g:ctrlp_working_path_mode = get(g:, 'sp_ctrlp_working_path_mode', 0)

" Use the silver searcher if available to speed up indexing
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -f -l -U --hidden --nocolor -g ""'
  let g:ctrlp_use_caching = 0
end
