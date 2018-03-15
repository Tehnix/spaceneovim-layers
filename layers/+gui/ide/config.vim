if has("gui_vimr") || exists('g:gui_oni')
  let g:spIdeUseTabs = get(g:, 'spIdeUseTabs', 1)
  let g:spIdeUseTabsInCtrlP = get(g:, 'spIdeUseTabsInCtrlP', 0)
  let g:spIdeOpenNERDTree = get(g:, 'spIdeOpenNERDTree', 1)
  let g:spIdeSyncNERDTreeAutomatically = get(g:, 'spIdeSyncNERDTreeAutomatically', 1)
  let g:spIdeFindFileNERDTreeAutomatically = get(g:, 'spIdeFindFileNERDTreeAutomatically', 1)
  let g:spIdeOpenBufferWhenNERDTreeIsLast = get(g:, 'spIdeOpenBufferWhenNERDTreeIsLast', 0)
  let g:spIdeCloseNERDTreeIfIsLast = get(g:, 'spIdeCloseNERDTreeIfIsLast', 0)

  " Set the command key mapping, depending on the convention of the editor ('d' for VimR).
  let s:cmdMap = 'd'
  if exists('g:gui_oni')
    let s:cmdMap = 'm'
  endif


  if SpaceNeovimIsLayerEnabled('+nav/fuzzy')
    if g:spIdeUseTabs && g:spIdeUseTabsInCtrlP
      " Switch CtrlP mappings to open in tabs instead.
      let g:ctrlp_prompt_mappings = get(g:, 'ctrlp_prompt_mappings', {})
      let g:ctrlp_prompt_mappings['AcceptSelection("e")'] = ['<c-t>']
      let g:ctrlp_prompt_mappings['AcceptSelection("t")'] = ['<cr>', '<2-LeftMouse>']
    endif
    " Try to locate the project root, when searching for files.
    let g:ctrlp_working_path_mode = 'rw'
    " Map CMD+p to CtrlP.
    exe 'nnoremap <' . s:cmdMap . '-p> :CtrlP<CR>'
    exe 'inoremap <' . s:cmdMap . '-p> <c-o>:CtrlP<CR>'
  endif


  " Save file with CMD+s.
  exe 'nnoremap <' . s:cmdMap . '-s> :w<CR>'
  exe 'inoremap <' . s:cmdMap . '-s> <c-o>:w<CR>'
  " Make CMD+q quit instead of start recording.
  exe 'nnoremap <' . s:cmdMap . '-q> :q<CR>'
  exe 'inoremap <' . s:cmdMap . '-q> <C-o>:q<CR>'
  " Map CMD+[j/k] to scroll n lines and keep cursor at same
  " screen position.
  exe 'nnoremap <' . s:cmdMap . '-k> 5<C-y>5gk'
  exe 'nnoremap <' . s:cmdMap . '-j> 5<C-e>5gj'
  exe 'inoremap <' . s:cmdMap . '-k> <C-o>5<C-y><C-o>5gk'
  exe 'inoremap <' . s:cmdMap . '-j> <C-o>5<C-e><C-o>5gj'
  " Map CMD+z and CMD+Shift+z to undo/redo.
  exe 'nnoremap <' . s:cmdMap . '-z> u'
  exe 'nnoremap <' . s:cmdMap . '-S-z> <C-r>'
  exe 'inoremap <' . s:cmdMap . '-z> <C-o>u'
  exe 'inoremap <' . s:cmdMap . '-S-z> <C-o><C-r>'
  " Map CMD+f to search (that is, the `/` vim search).
  exe 'nnoremap <' . s:cmdMap . '-f> <kDivide>'
  exe 'inoremap <' . s:cmdMap . '-f> <Esc><kDivide>'
  if SpaceNeovimIsLayerEnabled('+tools/multicursor')
    " Map CMD+d to multicursor start+next (i.e. the behaviour of <c-n>).
    "let g:multi_cursor_next_key    = '<d-d>'
    "let g:multi_cursor_prev_key    = '<d-s-d>'
  endif

  if g:spIdeUseTabs
    " Make switching buffer open an existing tab, if the file is there, else
    " open a new tab.
    set switchbuf=usetab,newtab,useopen
    " Map common macOS shortcuts (m is CMD in Oni).
    " New buffer/file with Cmd + n.
    if SpaceNeovimIsLayerEnabled('+nav/start-screen')
      exe 'nnoremap <' . s:cmdMap . '-n> :tabnew<CR>:Startify<CR>'
      exe 'inoremap <' . s:cmdMap . '-n> <C-o>:tabnew<CR>:Startify<CR>'
    else
      exe 'nnoremap <' . s:cmdMap . '-n> :tabnew<CR>'
      exe 'inoremap <' . s:cmdMap . '-n> <C-o>:tabnew<CR>'
    endif
    " Close current buffer/file with Cmd + w.
    exe 'nnoremap <' . s:cmdMap . '-w> :tabclose<CR>'
    exe 'inoremap <' . s:cmdMap . '-w> <C-o>:tabclose<CR>'
    " Switch buffer/tab/file with Cmd + [1-9].
    exe 'nnoremap <' . s:cmdMap . '-1> :tabn 1<CR>'
    exe 'nnoremap <' . s:cmdMap . '-2> :tabn 2<CR>'
    exe 'nnoremap <' . s:cmdMap . '-3> :tabn 3<CR>'
    exe 'nnoremap <' . s:cmdMap . '-4> :tabn 4<CR>'
    exe 'nnoremap <' . s:cmdMap . '-5> :tabn 5<CR>'
    exe 'nnoremap <' . s:cmdMap . '-6> :tabn 6<CR>'
    exe 'nnoremap <' . s:cmdMap . '-7> :tabn 7<CR>'
    exe 'nnoremap <' . s:cmdMap . '-8> :tabn 8<CR>'
    exe 'nnoremap <' . s:cmdMap . '-9> :tabn 9<CR>'
    exe 'nnoremap <' . s:cmdMap . '-9> :tabn 0<CR>'
    exe 'inoremap <' . s:cmdMap . '-1> <Esc>:tabn 1<CR>'
    exe 'inoremap <' . s:cmdMap . '-2> <Esc>:tabn 2<CR>'
    exe 'inoremap <' . s:cmdMap . '-3> <Esc>:tabn 3<CR>'
    exe 'inoremap <' . s:cmdMap . '-4> <Esc>:tabn 4<CR>'
    exe 'inoremap <' . s:cmdMap . '-5> <Esc>:tabn 5<CR>'
    exe 'inoremap <' . s:cmdMap . '-6> <Esc>:tabn 6<CR>'
    exe 'inoremap <' . s:cmdMap . '-7> <Esc>:tabn 7<CR>'
    exe 'inoremap <' . s:cmdMap . '-8> <Esc>:tabn 8<CR>'
    exe 'inoremap <' . s:cmdMap . '-9> <Esc>:tabn 9<CR>'
    exe 'inoremap <' . s:cmdMap . '-9> <Esc>:tabn 0<CR>'
    " Move tab around with Cmd + Shift + [1-9].
    exe 'nnoremap <' . s:cmdMap . '-s-1> :tabmove 0<CR>'
    exe 'nnoremap <' . s:cmdMap . '-s-2> :tabmove 1<CR>'
    exe 'nnoremap <' . s:cmdMap . '-s-3> :tabmove 2<CR>'
    exe 'nnoremap <' . s:cmdMap . '-s-4> :tabmove 3<CR>'
    exe 'nnoremap <' . s:cmdMap . '-s-5> :tabmove 4<CR>'
    exe 'nnoremap <' . s:cmdMap . '-s-6> :tabmove 5<CR>'
    exe 'nnoremap <' . s:cmdMap . '-s-7> :tabmove 6<CR>'
    exe 'nnoremap <' . s:cmdMap . '-s-8> :tabmove 7<CR>'
    exe 'nnoremap <' . s:cmdMap . '-s-9> :tabmove 8<CR>'
    exe 'nnoremap <' . s:cmdMap . '-s-9> :tabmove 9<CR>'
    exe 'inoremap <' . s:cmdMap . '-s-1> <C-o>:tabmove 0<CR>'
    exe 'inoremap <' . s:cmdMap . '-s-2> <C-o>:tabmove 1<CR>'
    exe 'inoremap <' . s:cmdMap . '-s-3> <C-o>:tabmove 2<CR>'
    exe 'inoremap <' . s:cmdMap . '-s-4> <C-o>:tabmove 3<CR>'
    exe 'inoremap <' . s:cmdMap . '-s-5> <C-o>:tabmove 4<CR>'
    exe 'inoremap <' . s:cmdMap . '-s-6> <C-o>:tabmove 5<CR>'
    exe 'inoremap <' . s:cmdMap . '-s-7> <C-o>:tabmove 6<CR>'
    exe 'inoremap <' . s:cmdMap . '-s-8> <C-o>:tabmove 7<CR>'
    exe 'inoremap <' . s:cmdMap . '-s-9> <C-o>:tabmove 8<CR>'
    exe 'inoremap <' . s:cmdMap . '-s-9> <C-o>:tabmove 9<CR>'
  else
    " Map common macOS shortcuts (m is CMD in Oni).
    " New buffer/file with Cmd + n.
    exe 'nnoremap <' . s:cmdMap . '-n> :enew<CR>'
    exe 'inoremap <' . s:cmdMap . '-n> <C-o>:enew<CR>'
    " Close current buffer/file with Cmd + w.
    exe 'nnoremap <' . s:cmdMap . '-w> :bw<CR>'
    exe 'inoremap <' . s:cmdMap . '-w> <C-o>:bw<CR>'
    " Switch buffer/tab/file with Cmd + [1-9].
    exe 'nnoremap <' . s:cmdMap . '-1> :SwitchBuffer 1<CR>'
    exe 'nnoremap <' . s:cmdMap . '-2> :SwitchBuffer 2<CR>'
    exe 'nnoremap <' . s:cmdMap . '-3> :SwitchBuffer 3<CR>'
    exe 'nnoremap <' . s:cmdMap . '-4> :SwitchBuffer 4<CR>'
    exe 'nnoremap <' . s:cmdMap . '-5> :SwitchBuffer 5<CR>'
    exe 'nnoremap <' . s:cmdMap . '-6> :SwitchBuffer 6<CR>'
    exe 'nnoremap <' . s:cmdMap . '-7> :SwitchBuffer 7<CR>'
    exe 'nnoremap <' . s:cmdMap . '-8> :SwitchBuffer 8<CR>'
    exe 'nnoremap <' . s:cmdMap . '-9> :SwitchBuffer 9<CR>'
    exe 'inoremap <' . s:cmdMap . '-1> <Esc>:SwitchBuffer 1<CR>'
    exe 'inoremap <' . s:cmdMap . '-2> <Esc>:SwitchBuffer 2<CR>'
    exe 'inoremap <' . s:cmdMap . '-3> <Esc>:SwitchBuffer 3<CR>'
    exe 'inoremap <' . s:cmdMap . '-4> <Esc>:SwitchBuffer 4<CR>'
    exe 'inoremap <' . s:cmdMap . '-5> <Esc>:SwitchBuffer 5<CR>'
    exe 'inoremap <' . s:cmdMap . '-6> <Esc>:SwitchBuffer 6<CR>'
    exe 'inoremap <' . s:cmdMap . '-7> <Esc>:SwitchBuffer 7<CR>'
    exe 'inoremap <' . s:cmdMap . '-8> <Esc>:SwitchBuffer 8<CR>'
    exe 'inoremap <' . s:cmdMap . '-9> <Esc>:SwitchBuffer 9<CR>'
  endif

  if exists('g:gui_oni')
    " Toggle the sidebar.
    nnoremap ft :call OniCommand('sidebar.toggle')<CR>

    " Make the clipboard behave normally in Oni.
    set clipboard-=unnamed
    set clipboard-=unnamedplus

    " Make an Oni theme
    " https://github.com/onivim/oni/blob/master/extensions/theme-onedark/colors/onedark.json.

    " Look into integrating with Oni more deeply, with `OniCommand('...')`
    " https://github.com/onivim/oni/wiki/Configuration#oni-commands.
  endif

  if SpaceNeovimIsLayerEnabled('+nav/files')
    " Set NERDTree root to CWD.
    let g:NERDTreeChDirMode = 2
    augroup VimrNERDTree
      au!
      " Open NERDTree on startup, and on a new tab.
      au VimEnter * if g:spIdeOpenNERDTree | NERDTree | execute "normal \<C-w>\<C-p>" | SyncNERDTree | endif
      au TabNew * if g:spIdeOpenNERDTree && g:spIdeUseTabs | NERDTree | SyncNERDTree | execute "normal \<C-w>\<C-p>" | SyncNERDTree | endif
    augroup END
    augroup VimrNERDTreeSync
      " If NERDTree is the only window left, open a new buffer in a split on
      " the left side.
      au BufEnter * if g:spIdeOpenBufferWhenNERDTreeIsLast && (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | vertical leftabove Startify | endif

      " Close NERDTree if it's the last open window in the tab page, but not the last tab open.
      au BufEnter * if g:spIdeCloseNERDTreeIfIsLast && (tabpagenr('$') > 1 && winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

      " On buffer enter, set the current working directory to the file path.
      au BufEnter * if g:spIdeSyncNERDTreeAutomatically && !exists("b:NERDTree") | SyncNERDTree | endif

      " Automatically highlight the current file, and refresh the file list.
      au BufEnter * if g:spIdeFindFileNERDTreeAutomatically && !exists("b:NERDTree") | FindNERDTreeFile | call NERDTreeFocus() | call g:NERDTree.ForCurrentTab().getRoot().refresh() | call g:NERDTree.ForCurrentTab().render() | execute "normal \<C-w>\<C-p>" | endif

      " Make NERDTree open tabs when mouse clicking.
      "au WinEnter * if g:spIdeUseTabs && &ft == 'nerdtree' && exists("b:NERDTree") && b:NERDTree.isTabTree() | SetNERDTreeDoubleClick | endif
    augroup END
  endif

endif
