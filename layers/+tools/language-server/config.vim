" Set the default LSP backend to nvim-lsp.
let g:spLSPBackend = get(g:, 'spLSPBackend', 'nvim-lsp')

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
  let s:cmdDiagnostics = ''

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
    let s:cmdDiagnostics = 'LspDocumentDiagnostics'
  endif

  exec "SpNMap 'li', 'show-info', '" . s:cmdHover . "'"
  exec "SpNMap 'lg', 'go-to-definition', '" . s:cmdGoToDef . "'"
  exec "SpNMap 'lf', 'format', '" . s:cmdFormat . "'"
  exec "SpNMap 'lF', 'format-selection', '" . s:cmdFormatSelection . "'"
  exec "SpNMap 'lR', 'rename', '" . s:cmdRename . "'"
  if (s:cmdContextMenu != '')
    exec "SpNMap 'lC', 'context-menu', '" s:cmdContextMenu . "'"
  endif
  if (s:cmdDiagnostics != '')
    exec "SpNMap 'ld', 'diagnostics', '" . s:cmdDiagnostics . "'"
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
    augroup autoStartLanguageServer
      autocmd!
      au BufWinEnter * SpaceNeovimHLSPEnableAutoStart
    augroup END
  else
    let g:lsp_auto_enable = 1
    " Configure vim-lsp.
    let g:lsp_signs_enabled = 1
    let g:lsp_diagnostics_echo_cursor = 0
    let g:lsp_signs_error = {'text': '>>'}
    let g:lsp_signs_warning = {'text': '--'}
    let g:lsp_signs_hint = {'text': '!!'}
  endif
" }}}

" LSP Server configuration {{{
  " Enable the TypeScript LSP for both TypeScript and JavaScript.
  if (g:spLSPBackend ==? 'nvim-lsp')
    if executable('typescript-language-server')
      let g:LanguageClient_serverCommands.javascript = ['typescript-language-server']
      let g:LanguageClient_serverCommands.typescript = ['typescript-language-server']
      let g:LanguageClient_serverCommands.typescriptreact = ['typescript-language-server']
    endif
    if executable('hie-wrapper')
      let g:LanguageClient_serverCommands.haskell = ['stack exec -- hie-wrapper --lsp']
    elseif executable('hie')
      let g:LanguageClient_serverCommands.haskell = ['stack exec -- hie --lsp']
    endif
    if executable('ocaml-language-server')
      let g:LanguageClient_serverCommands.ocaml = ['ocaml-language-server --stdio']
      let g:LanguageClient_serverCommands.reason = ['ocaml-language-server --stdio']
    endif
    if executable('rls')
      let g:LanguageClient_serverCommands.rust = ['rustup run nightly rls']
    endif
    if executable('solargraph')
      let g:LanguageClient_serverCommands.ruby = ['solargraph stdio']
    endif
    if executable('pyls')
     let g:LanguageClient_serverCommands.python = ['pyls']
    endif
    if executable('docker-langserver')
      let g:LanguageClient_serverCommands.docker = ['docker-langserver --stdio']
    endif
    if executable('clangd')
      let g:LanguageClient_serverCommands.c = ['clangd']
      let g:LanguageClient_serverCommands.cpp = ['clangd']
      let g:LanguageClient_serverCommands.objc = ['clangd']
      let g:LanguageClient_serverCommands.objcpp = ['clangd']
    elseif executable('cquery')
      let g:LanguageClient_serverCommands.c = ['cquery']
      let g:LanguageClient_serverCommands.cpp = ['cquery']
      let g:LanguageClient_serverCommands.objc = ['cquery']
      let g:LanguageClient_serverCommands.objcpp = ['cquery']
    elseif executable('ccls')
      let g:LanguageClient_serverCommands.c = ['ccls']
      let g:LanguageClient_serverCommands.cpp = ['ccls']
      let g:LanguageClient_serverCommands.objc = ['ccls']
      let g:LanguageClient_serverCommands.objcpp = ['ccls']
      let g:LanguageClient_serverCommands.cc = ['ccls']
    endif
  else
    " TypeScript -- https://github.com/prabirshrestha/vim-lsp/wiki/Servers-TypeScript.
    if executable('typescript-language-server')
      au User lsp_setup call lsp#register_server({
      \   'name': 'typescript-language-server'
      \ , 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']}
      \ , 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))}
      \ , 'whitelist': ['typescript', 'javascript', 'javascript.jsx', 'typescript.tsx', 'typescriptreact', 'javascriptreact']
      \})
    endif

    " Enable the Haskell hie-wrapper (falling back on hie) for stack projects.
    if executable('hie-wrapper')
      au User lsp_setup call lsp#register_server({
      \   'name': 'HIE'
      \ , 'cmd': { server_info->[&shell, &shellcmdflag, 'stack exec -- hie-wrapper --lsp']}
      \ , 'whitelist': ['haskell']
      \})
    elseif executable('hie')
      au User lsp_setup call lsp#register_server({
      \   'name': 'HIE'
      \ , 'cmd': { server_info->[&shell, &shellcmdflag, 'stack exec -- hie --lsp']}
      \ , 'whitelist': ['haskell']
      \})
    endif

    " OCaml/Reason -- https://github.com/prabirshrestha/vim-lsp/wiki/Servers-OCaml---Reason.
    if executable('ocaml-language-server')
      " Alternatively, if ocaml-language-server was installed via OPAM, then:
      " 'cmd': {server_info->[&shell, &shellcmdflag, 'opam config exec -- ocaml-language-server --stdio']}
      au User lsp_setup call lsp#register_server({
            \ 'name': 'ocaml-language-server',
            \ 'cmd': {server_info->[&shell, &shellcmdflag, 'ocaml-language-server --stdio']},
            \ 'whitelist': ['reason', 'ocaml'],
            \ })
    endif

    " Rust -- https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Rust.
    if executable('rls')
        au User lsp_setup call lsp#register_server({
            \ 'name': 'rls',
            \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
            \ 'whitelist': ['rust'],
            \ })
    endif

    " Ruby -- https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Ruby.
    if executable('solargraph')
    " gem install solargraph
        au User lsp_setup call lsp#register_server({
            \ 'name': 'solargraph',
            \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
            \ 'initialization_options': {"diagnostics": "true"},
            \ 'whitelist': ['ruby'],
            \ })
    endif

    " Python -- https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Python.
    if executable('pyls')
        " Additionally, pydocstyle can be enabled by adding:
        " 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}}}}
        au User lsp_setup call lsp#register_server({
            \ 'name': 'pyls',
            \ 'cmd': {server_info->['pyls']},
            \ 'whitelist': ['python'],
            \ })
    endif

    " Go -- https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Go.
    if executable('go-langserver')
        au User lsp_setup call lsp#register_server({
            \ 'name': 'go-langserver',
            \ 'cmd': {server_info->['go-langserver', '-mode', 'stdio']},
            \ 'whitelist': ['go'],
            \ })
    endif

    " Docker -- https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Docker.
    if executable('docker-langserver')
        au User lsp_setup call lsp#register_server({
            \ 'name': 'docker-langserver',
            \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
            \ 'whitelist': ['dockerfile'],
            \ })
    endif

    " CQuery -- https://github.com/prabirshrestha/vim-lsp/wiki/Servers-cquery.
    if executable('cquery')
      au User lsp_setup call lsp#register_server({
          \ 'name': 'cquery',
          \ 'cmd': {server_info->['cquery']},
          \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
          \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
          \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
          \ })
    endif

    " clangd -- https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Clangd.
    if executable('clangd')
        au User lsp_setup call lsp#register_server({
            \ 'name': 'clangd',
            \ 'cmd': {server_info->['clangd']},
            \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
            \ })
    endif

    " CCLS -- https://github.com/prabirshrestha/vim-lsp/wiki/Servers-ccls.
    if executable('ccls')
      au User lsp_setup call lsp#register_server({
          \ 'name': 'ccls',
          \ 'cmd': {server_info->['ccls']},
          \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
          \ 'initialization_options': { 'cacheDirectory': '.ccls-cache' },
          \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
          \ })
    endif

  endif
" }}}
