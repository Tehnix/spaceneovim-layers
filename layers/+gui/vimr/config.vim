if has("gui_vimr")
  let g:spVimrUseTabs = get(g:, 'spVimrUseTabs', 1)
  let g:spVimrOpenNERDTree = get(g:, 'spVimrOpenNERDTree', 1)
  let g:spVimrSyncNERDTreeAutomatically = get(g:, 'spVimrSyncNERDTreeAutomatically', 1)
  let g:spVimrOpenBufferWhenNERDTreeIsLast = get(g:, 'spVimrOpenBufferWhenNERDTreeIsLast', 1)

  if SpaceNeovimIsLayerEnabled('+nav/fuzzy')
    if g:spVimrUseTabs
      " Switch CtrlP mappings to open in tabs instead.
      let g:ctrlp_prompt_mappings = get(g:, 'ctrlp_prompt_mappings', {})
      let g:ctrlp_prompt_mappings['AcceptSelection("e")'] = ['<c-t>']
      let g:ctrlp_prompt_mappings['AcceptSelection("t")'] = ['<cr>', '<2-LeftMouse>']
    endif
    " Try to locate the project root, when searching for files.
    let g:ctrlp_working_path_mode = 'rw'
    " Map CMD+p to CtrlP.
    nnoremap <d-p> :CtrlP<CR>
    inoremap <d-p> :CtrlP<CR>
  endif

  " Save file with CMD+s.
  nnoremap <d-s> :w<CR>
  inoremap <d-s> :w<CR>
  " Make CMD+q quit instead of start recording.
  nnoremap <d-q> :q<CR>
  inoremap <d-q> :q<CR>
  " Map CMD+[j/k] or Shift+[j/k] to scroll n lines and keep cursor at same
  " screen position.
  nnoremap <d-k> 5<C-y>5gk
  nnoremap <d-j> 5<C-e>5gj
  inoremap <d-k> 5<C-y>5gk
  inoremap <d-j> 5<C-e>5gj
  nnoremap <s-k> 5<C-y>5gk
  nnoremap <s-j> 5<C-e>5gj
  " Map CMD+z and CMD+Shift+z to undo/redo.
  nnoremap <C-z> u
  inoremap <C-z> u
  nnoremap <C-S-z> <C-r>
  inoremap <C-S-z> <C-r>
  if SpaceNeovimIsLayerEnabled('+tools/multicursor')
    " Map CMD+d to multicursor start+next (i.e. the behaviour of <c-n>).
    "let g:multi_cursor_next_key    = '<d-d>'
    "let g:multi_cursor_prev_key    = '<d-s-d>'
  endif

  if g:spVimrUseTabs
    " Make switching buffer open an existing tab, if the file is there, else
    " open a new tab.
    set switchbuf=usetab,newtab,useopen
    " Map common macOS shortcuts (m is CMD in Oni).
    " New buffer/file with Cmd + n.
    if SpaceNeovimIsLayerEnabled('+nav/start-screen')
      nnoremap <d-n> :tabnew<CR>:Startify<CR>
      inoremap <d-n> :tabnew<CR>:Startify<CR>
    else
      nnoremap <d-n> :tabnew<CR>
      inoremap <d-n> :tabnew<CR>
    endif
    " Close current buffer/file with Cmd + w.
    nnoremap <d-w> :tabclose<CR>
    inoremap <d-w> :tabclose<CR>
    " Switch buffer/tab/file with Cmd + [1-9].
    nnoremap <d-1> :tabn 1<CR>
    nnoremap <d-2> :tabn 2<CR>
    nnoremap <d-3> :tabn 3<CR>
    nnoremap <d-4> :tabn 4<CR>
    nnoremap <d-5> :tabn 5<CR>
    nnoremap <d-6> :tabn 6<CR>
    nnoremap <d-7> :tabn 7<CR>
    nnoremap <d-8> :tabn 8<CR>
    nnoremap <d-9> :tabn 9<CR>
    nnoremap <d-9> :tabn 0<CR>
    inoremap <d-1> :tabn 1<CR>
    inoremap <d-2> :tabn 2<CR>
    inoremap <d-3> :tabn 3<CR>
    inoremap <d-4> :tabn 4<CR>
    inoremap <d-5> :tabn 5<CR>
    inoremap <d-6> :tabn 6<CR>
    inoremap <d-7> :tabn 7<CR>
    inoremap <d-8> :tabn 8<CR>
    inoremap <d-9> :tabn 9<CR>
    inoremap <d-9> :tabn 0<CR>
  else
    " Map common macOS shortcuts (m is CMD in Oni).
    " New buffer/file with Cmd + n.
    nnoremap <d-n> :enew<CR>
    inoremap <d-n> :enew<CR>
    " Close current buffer/file with Cmd + w.
    nnoremap <d-w> :bw<CR>
    inoremap <d-w> :bw<CR>
    " Switch buffer/tab/file with Cmd + [1-9].
    nnoremap <d-1> :SwitchBuffer 1<CR>
    nnoremap <d-2> :SwitchBuffer 2<CR>
    nnoremap <d-3> :SwitchBuffer 3<CR>
    nnoremap <d-4> :SwitchBuffer 4<CR>
    nnoremap <d-5> :SwitchBuffer 5<CR>
    nnoremap <d-6> :SwitchBuffer 6<CR>
    nnoremap <d-7> :SwitchBuffer 7<CR>
    nnoremap <d-8> :SwitchBuffer 8<CR>
    nnoremap <d-9> :SwitchBuffer 9<CR>
    inoremap <d-1> :SwitchBuffer 1<CR>
    inoremap <d-2> :SwitchBuffer 2<CR>
    inoremap <d-3> :SwitchBuffer 3<CR>
    inoremap <d-4> :SwitchBuffer 4<CR>
    inoremap <d-5> :SwitchBuffer 5<CR>
    inoremap <d-6> :SwitchBuffer 6<CR>
    inoremap <d-7> :SwitchBuffer 7<CR>
    inoremap <d-8> :SwitchBuffer 8<CR>
    inoremap <d-9> :SwitchBuffer 9<CR>
  endif

  if SpaceNeovimIsLayerEnabled('+nav/files')
    " Set NERDTree root to CWD.
    " let g:NERDTreeChDirMode = 2
    augroup VimrNERDTree
      au!
      " Open NERDTree on startup, and on a new tab.
      au VimEnter * if g:spVimrOpenNERDTree | NERDTree | execute "normal \<C-w>\<C-p>" | SyncNERDTree | endif
      au TabNew * if g:spVimrOpenNERDTree && g:spVimrUseTabs | NERDTree | execute "normal \<C-w>\<C-p>" | SyncNERDTree | endif

      " If NERDTree is the only window left, open a new buffer in a split on
      " the left side.
      au BufEnter * if g:spVimrOpenBufferWhenNERDTreeIsLast && (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | vertical leftabove new | endif

      " On buffer enter, set the current working directory to the file path.
      au BufEnter * if g:spVimrSyncNERDTreeAutomatically | SyncNERDTree | endif

      " Make NERDTree open tabs when mouse clicking.
      "au WinEnter * if g:spVimrUseTabs && &ft == 'nerdtree' && exists("b:NERDTree") && b:NERDTree.isTabTree() | SetNERDTreeDoubleClick | endif
    augroup END
  endif

endif
