if exists('g:gui_oni')
  let g:spOniUseTabs = get(g:, 'spOniUseTabs', 1)
  let g:spOniOpenNERDTree = get(g:, 'spOniOpenNERDTree', 1)
  let g:spOniSyncNERDTreeAutomatically = get(g:, 'spOniSyncNERDTreeAutomatically', 1)
  let g:spOniOpenBufferWhenNERDTreeIsLast = get(g:, 'spOniOpenBufferWhenNERDTreeIsLast', 0)

  " Make an Oni theme
  " https://github.com/onivim/oni/blob/master/extensions/theme-onedark/colors/onedark.json.

  " Look into integrating with Oni more deeply, with `OniCommand('...')`
  " https://github.com/onivim/oni/wiki/Configuration#oni-commands.

  if SpaceNeovimIsLayerEnabled('+nav/fuzzy')
    " Switch CtrlP mappings to open in tabs instead.
    let g:ctrlp_prompt_mappings = get(g:, 'ctrlp_prompt_mappings', {})
    let g:ctrlp_prompt_mappings['AcceptSelection("e")'] = ['<c-t>']
    let g:ctrlp_prompt_mappings['AcceptSelection("t")'] = ['<cr>', '<2-LeftMouse>']
    " Try to locate the project root, when searching for files.
    let g:ctrlp_working_path_mode = 'rw'
  endif

  " Save file with CMD+s.
  nnoremap <m-s> :w<CR>
  inoremap <m-s> :w<CR>
  " Make CMD+q quit instead of start recording.
  nnoremap <m-q> :q<CR>
  inoremap <m-q> :q<CR>
  " Map CMD+[j/k] or Shift+[j/k] to scroll n lines and keep cursor at same
  " screen position.
  nnoremap <m-k> 5<C-y>5gk
  nnoremap <m-j> 5<C-e>5gj
  inoremap <m-k> 5<C-y>5gk
  inoremap <m-j> 5<C-e>5gj
  nnoremap <s-k> 5<C-y>5gk
  nnoremap <s-j> 5<C-e>5gj
  " Map CMD+z and CMD+Shift+z to undo/redo.
  nnoremap <C-z> u
  inoremap <C-z> u
  nnoremap <C-S-z> <C-r>
  inoremap <C-S-z> <C-r>
  if SpaceNeovimIsLayerEnabled('+tools/multicursor')
    " Map CMD+d to multicursor start+next (i.e. the behaviour of <c-n>).
    "let g:multi_cursor_next_key    = '<m-d>'
    "let g:multi_cursor_prev_key    = '<m-s-d>'
  endif

  if g:spOniUseTabs
    " Make switching buffer open an existing tab, if the file is there, else
    " open a new tab.
    set switchbuf=usetab,newtab,useopen
    " Map common macOS shortcuts (m is CMD in Oni).
    " New buffer/file with Cmd + n.
    nnoremap <m-n> :tabnew<CR>
    inoremap <m-n> :tabnew<CR>
    " Close current buffer/file with Cmd + w.
    nnoremap <m-w> :tabclose<CR>
    inoremap <m-w> :tabclose<CR>
    " Switch buffer/tab/file with Cmd + [1-9].
    nnoremap <m-1> :tabn 1<CR>
    nnoremap <m-2> :tabn 2<CR>
    nnoremap <m-3> :tabn 3<CR>
    nnoremap <m-4> :tabn 4<CR>
    nnoremap <m-5> :tabn 5<CR>
    nnoremap <m-6> :tabn 6<CR>
    nnoremap <m-7> :tabn 7<CR>
    nnoremap <m-8> :tabn 8<CR>
    nnoremap <m-9> :tabn 9<CR>
    nnoremap <m-9> :tabn 0<CR>
    inoremap <m-1> :tabn 1<CR>
    inoremap <m-2> :tabn 2<CR>
    inoremap <m-3> :tabn 3<CR>
    inoremap <m-4> :tabn 4<CR>
    inoremap <m-5> :tabn 5<CR>
    inoremap <m-6> :tabn 6<CR>
    inoremap <m-7> :tabn 7<CR>
    inoremap <m-8> :tabn 8<CR>
    inoremap <m-9> :tabn 9<CR>
    inoremap <m-9> :tabn 0<CR>
  else
    " Map common macOS shortcuts (m is CMD in Oni).
    " New buffer/file with Cmd + n.
    nnoremap <m-n> :enew<CR>
    inoremap <m-n> :enew<CR>
    " Close current buffer/file with Cmd + w.
    nnoremap <m-w> :bw<CR>
    inoremap <m-w> :bw<CR>
    " Switch buffer/tab/file with Cmd + [1-9].
    nnoremap <m-1> :SwitchBuffer 1<CR>
    nnoremap <m-2> :SwitchBuffer 2<CR>
    nnoremap <m-3> :SwitchBuffer 3<CR>
    nnoremap <m-4> :SwitchBuffer 4<CR>
    nnoremap <m-5> :SwitchBuffer 5<CR>
    nnoremap <m-6> :SwitchBuffer 6<CR>
    nnoremap <m-7> :SwitchBuffer 7<CR>
    nnoremap <m-8> :SwitchBuffer 8<CR>
    nnoremap <m-9> :SwitchBuffer 9<CR>
    inoremap <m-1> :SwitchBuffer 1<CR>
    inoremap <m-2> :SwitchBuffer 2<CR>
    inoremap <m-3> :SwitchBuffer 3<CR>
    inoremap <m-4> :SwitchBuffer 4<CR>
    inoremap <m-5> :SwitchBuffer 5<CR>
    inoremap <m-6> :SwitchBuffer 6<CR>
    inoremap <m-7> :SwitchBuffer 7<CR>
    inoremap <m-8> :SwitchBuffer 8<CR>
    inoremap <m-9> :SwitchBuffer 9<CR>
  endif
  " Toggle the sidebar.
  nnoremap ft :call OniCommand('sidebar.toggle')<CR>

  " Make the clipboard behave normally in Oni.
  set clipboard-=unnamed
  set clipboard-=unnamedplus

  if SpaceNeovimIsLayerEnabled('+nav/files')
    " Set NERDTree root to CWD.
    let g:NERDTreeChDirMode = 2
    augroup OniNERDTree
      au!
      " Open NERDTree on startup, and on a new tab.
      au VimEnter * if g:spOniOpenNERDTree | NERDTree | execute "normal \<C-w>\<C-p>" | SyncNERDTree | endif
      au TabNew * if g:spOniOpenNERDTree && g:spOniUseTabs | NERDTree | execute "normal \<C-w>\<C-p>" | SyncNERDTree | endif

      " If NERDTree is the only window left, open a new buffer in a split on
      " the left side.
      au BufEnter * if g:spOniOpenBufferWhenNERDTreeIsLast && (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | vertical leftabove new | endif

      " On buffer enter, set the current working directory to the file path.
      au BufEnter * if g:spOniSyncNERDTreeAutomatically | SyncNERDTree | endif

      " Make NERDTree open tabs when mouse clicking.
      "au WinEnter * if g:spOniUseTabs && &ft == 'nerdtree' && exists("b:NERDTree") && b:NERDTree.isTabTree() | SetNERDTreeDoubleClick | endif
    augroup END
  endif

endif
