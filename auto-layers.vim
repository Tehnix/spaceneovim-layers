""
" Set up pre/post installation and pull in library files.
"

""
" Debug messages to the console.
"
function! s:debug(msg)
  if g:dotspaceneovim_layer_debug
    echom a:msg
  endif
endfunction

" Set up path variables {{{
if has('nvim')
  let s:config_dir = $HOME . '/.config/nvim'
else
  let s:config_dir = $HOME . '/.vim'
endif
let s:spaceneovim_layers_dir = expand(resolve(s:config_dir . '/spaceneovim-layers'))
" }}}


" Load library files {{{
call s:debug('>>> Loading helpers')
execute 'source ' . s:spaceneovim_layers_dir . '/helpers.vim'
call s:debug('>>> Loading keybinding-helpers')
execute 'source ' . s:spaceneovim_layers_dir . '/keybinding-helpers.vim'
" }}}


" Halt if SpaceNeovim is already loaded {{{
if exists('g:loaded_spaceneovim')
  finish
endif
let g:loaded_spaceneovim = 1
" }}}


" Setup default plugin configuration {{{
function! s:spaceneovim_preinstall()
  call s:debug('>>> Run pre install')
  " Create default vim-leader-guide map and add +major-mode-cmd grouping {{{
  let g:lmap = get(g:, 'lmap', {})
  let g:lmap.m = get(g:lmap, 'm', { 'name': '+major-mode-cmd' })
  " }}}

  " Reset nerdcommenter key mappings {{{
  let g:NERDCreateDefaultMappings = get(g:, 'NERDCreateDefaultMappings', 0)
  " }}}

  " Reset vim-easymotion key mappings {{{
  let g:EasyMotion_do_mapping = get(g:, 'EasyMotion_do_mapping', 0)
  " }}}

  " Reset vim-gitgutter key mappings {{{
  let g:gitgutter_map_keys = get(g:, 'gitgutter_map_keys', 0)
  " }}}

  " Reset vim-swoop key mappings {{{
  let g:swoopUseDefaultKeyMap = get(g:, 'swoopUseDefaultKeyMap', 0)
  " }}}
endfunction

function! g:Spaceneovim_postinit()
  call s:debug('>>> Run postinit')
  " Configure vim-arpeggio {{{
  if exists('g:loaded_arpeggio')
    if exists('g:dotspaceneovim_escape_key_sequence')
      call arpeggio#map('i', '', 0, g:dotspaceneovim_escape_key_sequence, '<Esc>')
    endif
    let g:arpeggio_timeoutlen = get(g:, 'arpeggio_timeoutlen', 100)
  endif
  " }}}

  " Configure vim-leader-guide {{{
  if exists('g:loaded_leaderGuide_vim')
    call s:debug('>>> Configure vim-leader-guide')
    " Clean up the displayed key bindings.
    function! s:spaceneovim_displayfunc()
      let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '\c<cr>$', '', '')
      let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '^<SID>', '', '')
      let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '^<Plug>', '', '')
      let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '#', '', '')
    endfunction
    " Add custom display func if found.
    if exists('g:leaderGuide_displayfunc')
      call add(g:leaderGuide_displayfunc, function('s:spaceneovim_displayfunc'))
    else
      let g:leaderGuide_displayfunc = [function('s:spaceneovim_displayfunc')]
    endif
    " Map the leader key to <Space> (or use defined one).
    let l:leader_key = spaceneovim#get_leader_key()
    if l:leader_key ==? '<Space>'
      let g:mapleader = ' '
    else
      let g:mapleader = l:leader_key
    endif
    execute 'nnoremap <silent> <Leader> :<c-u>LeaderGuide "' . l:leader_key . '"<CR>'
    execute 'vnoremap <silent> <Leader> :<c-u>LeaderGuideVisual "' . l:leader_key . '"<CR>'

  endif
  " }}}
endfunction

" Setup default plugin configuration after all autoload/*.vim {{{
function! g:Spaceneovim_postinstall()
  try
    call s:debug('>>> Run post install')
    " Register g:lmap to the <Space> key.
    let l:leader_key = spaceneovim#get_leader_key()
    call leaderGuide#register_prefix_descriptions(l:leader_key, 'g:lmap')
  catch
  endtry
endfunction
" }}}

call s:spaceneovim_preinstall()

if !exists('g:spaceneovim_postinit_loaded')
  let g:spaceneovim_postinit_loaded = 1
  augroup spaceneovim_postinit
    autocmd!
    autocmd VimEnter * call g:Spaceneovim_postinit()
  augroup END
endif
" }}}
