" Add layers {{{
let g:spacevim_layers = [
\  '+nav/quit'
\, '+nav/buffers'
\, '+nav/windows'
\, '+nav/text'
\, '+nav/start-screen'
\, '+checkers/syntax-checking'
\]

" }}}

" Setup default plugin configuration {{{
if exists('g:loaded_spacevim')
  finish
endif
let g:loaded_spacevim = 1

" vim-leader-guide {{{
let g:lmap = get(g:, 'lmap', {})
let g:lmap.m = { 'name': '+major-mode-cmd' }
" }}}

function! s:spacevim_preinstall()
  " nerdcommenter {{{
  let g:NERDCreateDefaultMappings = get(g:, 'NERDCreateDefaultMappings', 0)
  " }}}

  " vim-easymotion {{{
  let g:EasyMotion_do_mapping = get(g:, 'EasyMotion_do_mapping', 0)
  " }}}

  " vim-gitgutter {{{
  let g:gitgutter_map_keys = get(g:, 'gitgutter_map_keys', 0)
  " }}}

  " vim-startify {{{
  let g:startify_custom_header = get(g:, 'startify_custom_header', [
  \'',
  \'                         [S P A C E N E O V I M]',
  \'',
  \ ])
  " }}}

  " vim-swoop {{{
  let g:swoopUseDefaultKeyMap = get(g:, 'swoopUseDefaultKeyMap', 0)
  " }}}
endfunction

function! s:spacevim_postinstall()
  " vim-arpeggio {{{
  if exists('g:loaded_arpeggio')
    if exists('g:dotspacevim_escape_key_sequence')
      call arpeggio#map('i', '', 0, g:dotspacevim_escape_key_sequence, '<Esc>')
    endif
    let g:arpeggio_timeoutlen = get(g:, 'arpeggio_timeoutlen', 100)
  endif
  " }}}

  " vim-leader-guide {{{
  if exists('g:loaded_leaderGuide_vim')
    function! s:spacevim_displayfunc()
      let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '\c<cr>$', '', '')
      let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '^<SID>', '', '')
      let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '#', '', '')
    endfunction
    if exists('g:leaderGuide_displayfunc')
      call add(g:leaderGuide_displayfunc, function('s:spacevim_displayfunc'))
    else
      let g:leaderGuide_displayfunc = [function('s:spacevim_displayfunc')]
    endif

    call leaderGuide#register_prefix_descriptions('<Space>', 'g:lmap')
    nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
    vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
  endif
  " }}}
endfunction

call s:spacevim_preinstall()
augroup spacevim_postinstall
  autocmd!
  autocmd VimEnter * call s:spacevim_postinstall()
augroup END
" }}}

" Helper functions {{{
function! g:spacevim_add_plugin(name, config)
  " Add a plugin to the list of plugins
  if exists('g:spacevim_plugins')
    call add(g:spacevim_plugins, {'name': a:name, 'config': a:config})
    return 1
  endif
  return 0
endfunction

function! g:spacevim_is_layer_enabled(name)
  " Check if a layer is enabled
  if !exists('g:spacevim_enabled_layers')
    return 1
  endif
  return index(g:spacevim_enabled_layers, a:name) != -1
endfunction

function! g:spacevim_bind(map, binding, name, value, isCmd)
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
  else
    let l:noremap = ''
  endif

  if l:noremap !=# ''
    execute l:noremap . ' <silent> <SID>' . a:name . '# ' . l:value
    execute a:map . ' <Leader>' . a:binding . ' <SID>' . a:name . '#'
  endif
endfunction

function! g:spacevim_bind_plug(map, binding, name, value)
  if a:map ==# 'map' && maparg('<Leader>' . a:binding, '') ==# ''
    let l:map = 'map'
  elseif a:map ==# 'nmap' && maparg('<Leader>' . a:binding, 'n') ==# ''
    let l:map = 'nmap'
  elseif a:map ==# 'vmap' && maparg('<Leader>' . a:binding, 'v') ==# ''
    let l:map = 'vmap'
  else
    let l:map = ''
  endif

  if l:map !=# ''
    execute l:map . ' <silent> <SID>' . a:name . '# <Plug>' . a:value
    execute a:map . ' <Leader>' . a:binding . ' <SID>' . a:name . '#'
  endif
endfunction
" }}}
