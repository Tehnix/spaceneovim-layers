" By default we enable TypeScript and keep Flow optional.
let g:spAutocompletionEnableFlow = get(g:, 'spAutocompletionEnableFlow', 0)
let g:spAutocompletionEnableTypeScript = get(g:, 'spAutocompletionEnableTypeScript', 1)

" Remove duplicates.
let g:asyncomplete_remove_duplicates = 1

" Enable fuzzy smart completion.
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1

" Enable preview window.
set completeopt+=preview
" and autoclose it once the completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Register completions {{{
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emoji#get_source_options({
    \ 'name': 'emoji',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#emoji#completor'),
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#gocode#get_source_options({
    \ 'name': 'gocode',
    \ 'whitelist': ['go'],
    \ 'completor': function('asyncomplete#sources#gocode#completor')
    \ }))

if (g:spAutocompletionEnableFlow)
  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#flow#get_source_options({
      \ 'name': 'flow',
      \ 'whitelist': ['javascript'],
      \ 'completor': function('asyncomplete#sources#flow#completor'),
      \ 'config': {
      \    " Resolves 'flow' in the closest node_modules/.bin directory (in case
      \    " flow is installed via 'npm install flow-bin' locally). Falls back to
      \    " 'flowbin_path' (see below) if can't find it.
      \    'prefer_local': 1,
      \    " Path to 'flow' executable.
      \    'flowbin_path': 'flow',
      \    " Displays additional typeinfo exposed by flow, if any is provided.
      \    " Defaults to 0.
      \    'show_typeinfo': 1
      \  },
      \ }))
endif

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
\ 'name': 'omni',
\ 'whitelist': ['*'],
\ 'blacklist': ['c', 'cpp', 'html'],
\ 'completor': function('asyncomplete#sources#omni#completor')
\  }))

let g:tmuxcomplete#asyncomplete_source_options = {
            \ 'name':      'tmuxcomplete',
            \ 'whitelist': ['*'],
            \ 'config': {
            \     'splitmode':      'words',
            \     'filter_prefix':   1,
            \     'show_incomplete': 1,
            \     'sort_candidates': 0,
            \     'scrollback':      0,
            \     'truncate':        0
            \     }
            \ }

if (g:spAutocompletionEnableTypeScript)
  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tscompletejob#get_source_options({
      \ 'name': 'tscompletejob',
      \ 'whitelist': ['typescript'],
      \ 'completor': function('asyncomplete#sources#tscompletejob#completor'),
      \ }))
endif

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necosyntax#get_source_options({
    \ 'name': 'necosyntax',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#necosyntax#completor'),
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
    \ 'name': 'tags',
    \ 'whitelist': ['c'],
    \ 'completor': function('asyncomplete#sources#tags#completor'),
    \ 'config': {
    \    'max_file_size': 50000000,
    \  },
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
    \ 'name': 'necovim',
    \ 'whitelist': ['vim'],
    \ 'completor': function('asyncomplete#sources#necovim#completor'),
    \ }))
" }}}
