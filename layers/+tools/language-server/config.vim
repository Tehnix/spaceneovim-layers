" Set the default LSP backend to vim-lsp.
let g:spLSPBackend = get(g:, 'spLSPBackend', 'vim-lsp')

" Set the key mappings for the various commands {{{
  let g:lmap.l = get(g:lmap, 'l', { 'name': '+lsp' })
  let s:cmdHover = ''
  let s:cmdGoToDef = ''
  let s:cmdFormat = ''
  let s:cmdRename = ''
  let s:cmdFormatSelection = ''
  let s:cmdContextMenu = ''
  " +list groups.
  let s:cmdListSymbols = ''
  let s:cmdListReferences = ''
  let s:cmdListProjectSymbols = ''
  " +errros group.
  let s:cmdExplainError = ''
  let s:cmdNextError = ''
  let s:cmdPrevError = ''

  if (g:spLSPBackend ==? 'nvim-lsp')
    let s:cmdHover = 'call LanguageClient#textDocument_hover()'
    let s:cmdGoToDef = 'call LanguageClient#textDocument_definition()'
    let s:cmdFormat = 'call LanguageClient#textDocument_formatting()'
    let s:cmdRename = 'call LanguageClient#textDocument_rename()'
    let s:cmdFormatSelection = 'call LanguageClient#textDocument_rangeFormatting()'
    let s:cmdContextMenu = 'call LanguageClient_contextMenu()'
    " +list groups.
    let s:cmdListSymbols = 'call LanguageClient#textDocument_documentSymbol()'
    let s:cmdListReferences = 'call LanguageClient#textDocument_references()'
    let s:cmdListProjectSymbols = 'call LanguageClient#workspace_symbol()'
    " +errros group.
    let s:cmdExplainError = 'call LanguageClient#explainErrorAtPoint()'
  else
    let s:cmdHover = 'LspHover'
    let s:cmdGoToDef = 'LspDefinition'
    let s:cmdFormat = 'LspDocumentFormat'
    let s:cmdRename = 'LspRename'
    let s:cmdFormatSelection = 'LspDocumentRangeFormat'
    " +list groups.
    let s:cmdListSymbols = 'LspDocumentSymbol'
    let s:cmdListReferences = 'LspReferences'
    let s:cmdListProjectSymbols = 'LspWorkspaceSymbol'
    " +errros group.
    let s:cmdNextError = 'LspNextError'
    let s:cmdPrevError = 'LspPreviousError'
  endif

  exec "SpNMap 'li', 'show-info', '" . s:cmdHover . "'"
  exec "SpNMap 'lg', 'go-to-definition', '" . s:cmdGoToDef . "'"
  exec "SpNMap 'lf', 'format', '" . s:cmdFormat . "'"
  exec "SpNMap 'lF', 'format-selection', '" . s:cmdFormatSelection . "'"
  exec "SpNMap 'lR', 'rename', '" . s:cmdRename . "'"
  if (s:cmdContextMenu != '')
    exec "SpNMap 'lC', 'context-menu', '" s:cmdContextMenu . "'"
  endif

  let g:lmap.l.l = get(g:lmap.l, 'l', { 'name': '+list' })
  exec "SpNMap 'lls', 'list-symbols', '" . s:cmdListSymbols . "'"
  exec "SpNMap 'llr', 'list-references', '" . s:cmdListReferences . "'"
  exec "SpNMap 'llS', 'list-project-symbols', '" . s:cmdListProjectSymbols . "'"

  let g:lmap.l.e = get(g:lmap.e, 'e', { 'name': '+errors' })
  if (s:cmdExplainError != '')
    exec "SpNMap 'lee', 'explain-error-at-point', '" . s:cmdExplainError . "'"
  endif
  if (s:cmdNextError != '')
    exec "SpNMap 'len', 'next-error', '" . s:cmdNextError . "'"
  endif
  if (s:cmdPrevError != '')
    exec "SpNMap 'lep', 'prev-error', '" . s:cmdPrevError . "'"
  endif
" }}}


" Layer specific configurations {{{
  " Set up a default 'LanguageClient_serverCommands' dictionary.
  let g:LanguageClient_serverCommands = get(g:, 'LanguageClient_serverCommands', {})
  " Required for operations modifying multiple buffers like rename.
  set hidden
  " Adjust the command line for echodoc.
  if SpaceNeovimIsLayerEnabled('+ui/airline')
    set noshowmode
  else
    set cmdheight=2
  endif
  set shortmess=a

  " Make sure nvim-lsp does not autostart.
  let g:lsp_auto_enable = 0
  " Make sure nvim-lsp does not autostart.
  let g:LanguageClient_autoStart = 0
  if (g:spLSPBackend ==? 'nvim-lsp')

    let g:LanguageClient_autoStart = 1
    " augroup autoStartLanguageServer
    "   autocmd!
    "   au BufWinEnter * SpaceNeovimHLSPEnableAutoStart
    " augroup END
  else
    let g:lsp_auto_enable = 0
    " Configure vim-lsp.
    let g:lsp_signs_enabled = 1
    let g:lsp_diagnostics_echo_cursor = 1
  endif
" }}}

" LSP Server configuration {{{
  " Enable the TypeScript LSP for both TypeScript and JavaScript.
  if (g:spLSPBackend ==? 'nvim-lsp')
    let g:LanguageClient_serverCommands.javascript = ['typescript-language-server']
    let g:LanguageClient_serverCommands.typescript = ['typescript-language-server']
    let g:LanguageClient_serverCommands.typescriptreact = ['typescript-language-server']
  else
    if executable('typescript-language-server')
      au User lsp_setup call lsp#register_server({
      \   'name': 'typescript-language-server'
      \ , 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']}
      \ , 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))}
      \ , 'whitelist': ['typescript', 'javascript', 'javascript.jsx', 'typescript.tsx']
      \})
    endif
    " Enable the Haskell hie-wrapper (falling back on hie) for stack projects.
    if executable('hie-wrapper')
      au User lsp_setup call lsp#register_server({
      \   'name': 'HIE'
      \ , 'cmd': { server_info->[&shell, &shellcmdflag, 'hie-wrapper --lsp']}
      \ , 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), 'stack.yaml/..'))}
      \ , 'whitelist': ['haskell']
      \})
    elseif executable('hie')
      au User lsp_setup call lsp#register_server({
      \   'name': 'HIE'
      \ , 'cmd': { server_info->[&shell, &shellcmdflag, 'hie --lsp']}
      \ , 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), 'stack.yaml/..'))}
      \ , 'whitelist': ['haskell']
      \})
    endif
  endif
" }}}
