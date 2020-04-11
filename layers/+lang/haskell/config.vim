" Configuration {{{
  " Control whether the LSP should use stack or not [default true].
  let g:sp_haskell_lsp_use_stack = get(g:, 'spHaskellLspUseStack', 1)
  " Control which backend should be used [default lsp].
  let g:sp_haskell_backend = get(g:, 'spHaskellBackend', 'lsp')
" }}}

" Remove default mappings {{{
  let g:hlintRefactor#disableDefaultKeybindings = 1
" }}}

" Backend keymappings {{{
  " Stitch together the correct keymappings based on the backends.
  SpFileTypeNMap 'haskell', 'md', 'ghcid', 'Ghcid'

  if g:sp_haskell_backend == 'intero'
    let s:haskell_backend_name = { "name": "haskell/intero" }
    " haskell/intero (backend).
    SpFileTypeNMap 'haskell', 'mid', 'intero/devel-reload', 'InteroReload'
    SpFileTypeNMap 'haskell', 'mik', 'intero/destroy', 'InteroKill'
    SpFileTypeNMap 'haskell', 'mir', 'intero/start', 'InteroStart'
    SpFileTypeNMap 'haskell', 'mit', 'intero/targets', 'SpaceNeovimHaskellInteroTarget'
    " haskell/navigation".
    SpFileTypeNMap 'haskell', 'mgg', 'intero/jump-to-definition', 'InteroGoToDef'
    " haskell/repl.
    SpFileTypeNMap 'haskell', 'msb', 'intero/repl-load', 'SpaceNeovimHaskellInteroRepl'
    SpFileTypeNMap 'haskell', 'msS', 'intero/pop-to-repl', 'InteroOpen'
    SpFileTypeNMap 'haskell', 'mss', 'intero/display-repl', 'InteroOpen'
    SpFileTypeNMap 'haskell', 'msh', 'intero/hide-repl', 'InteroHide'
    SpFileTypeNMap 'haskell', 'msr', 'intero/reload-repl', 'InteroReload'
    " haskell/documentation.
    SpFileTypeNMap 'haskell', 'mht', 'intero/type-at', 'SpaceNeovimHaskellInteroType'
    SpFileTypeNMap 'haskell', 'mhi', 'intero/info', 'InteroInfo'
    SpFileTypeNMap 'haskell', 'mhg', 'intero/generic-type', 'InteroGenericType'
    SpFileTypeNMap 'haskell', 'mhT', 'intero/insert-type', 'InteroTypeInsert'
  elseif g:sp_haskell_backend == 'both'
    let s:haskell_backend_name = { "name": "haskell/ghc-mod-intero" }
    " haskell/ghc-mod-intero (backend).
    SpFileTypeNMap 'haskell', 'mid', 'intero/devel-reload', 'InteroReload'
    SpFileTypeNMap 'haskell', 'mik', 'intero/destroy', 'InteroKill'
    SpFileTypeNMap 'haskell', 'mir', 'intero/start', 'InteroStart'
    SpFileTypeNMap 'haskell', 'mit', 'intero/targets', 'SpaceNeovimHaskellInteroTarget'
    SpFileTypeNMap 'haskell', 'mic', 'ghcmod/check', 'GhcModCheckAndLintAsync'
    " haskell/navigation".
    SpFileTypeNMap 'haskell', 'mgg', 'intero/jump-to-definition', 'InteroGoToDef'
    " haskell/repl.
    SpFileTypeNMap 'haskell', 'msb', 'ghci/repl-load', 'GhciLoadCurrentFile'
    SpFileTypeNMap 'haskell', 'msS', 'ghci/pop-to-repl', 'GhciOpen'
    SpFileTypeNMap 'haskell', 'mss', 'ghci/display-repl', 'GhciOpen'
    SpFileTypeNMap 'haskell', 'msh', 'ghci/hide-repl', 'GhciHide'
    SpFileTypeNMap 'haskell', 'msr', 'ghci/reload-repl', 'GhciReload'
    SpFileTypeNMap 'haskell', 'mse', 'ghci/eval-expression', 'SpaceNeovimHaskellGhciExpression'
    " haskell/documentation.
    SpFileTypeNMap 'haskell', 'mht', 'intero/type-at', 'SpaceNeovimHaskellInteroType'
    SpFileTypeNMap 'haskell', 'mhi', 'intero/info', 'InteroInfo'
    SpFileTypeNMap 'haskell', 'mhg', 'intero/generic-type', 'InteroGenericType'
    SpFileTypeNMap 'haskell', 'mhT', 'intero/insert-type', 'InteroTypeInsert'
    " haskell/refactor.
    SpFileTypeNMap 'haskell', 'mrf', 'ghcmod/split-fun', 'GhcModSplitFunCase'
    SpFileTypeNMap 'haskell', 'mrg', 'ghcmod/sig-gen-code', 'GhcModSigCodegen'
    SpFileTypeNMap 'haskell', 'mre', 'ghcmod/expand', 'GhcModExpand'
  elseif g:sp_haskell_backend == 'ghc-mod'
    let s:haskell_backend_name = { "name": "haskell/ghcmod" }
    SpFileTypeNMap 'haskell', 'mic', 'ghcmod/check', 'GhcModCheckAndLintAsync'
    " haskell/repl.
    SpFileTypeNMap 'haskell', 'msb', 'ghci/repl-load', 'GhciLoadCurrentFile'
    SpFileTypeNMap 'haskell', 'msS', 'ghci/pop-to-repl', 'GhciOpen'
    SpFileTypeNMap 'haskell', 'mss', 'ghci/display-repl', 'GhciOpen'
    SpFileTypeNMap 'haskell', 'msh', 'ghci/hide-repl', 'GhciHide'
    SpFileTypeNMap 'haskell', 'msr', 'ghci/reload-repl', 'GhciReload'
    SpFileTypeNMap 'haskell', 'mse', 'ghci/eval-expression', 'SpaceNeovimHaskellGhciExpression'
    " haskell/documentation.
    SpFileTypeNMap 'haskell', 'mht', 'ghcmod/type-at', 'SpaceNeovimHaskellGhcmodType'
    SpFileTypeNMap 'haskell', 'mhi', 'ghcmod/info', 'GhcModInfo'
    SpFileTypeNMap 'haskell', 'mhT', 'ghcmod/insert-type', 'GhcModTypeInsert'
    SpFileTypeNMap 'haskell', 'mhc', 'ghcmod/clear-type', 'GhcModTypeClear'
    " haskell/refactor.
    SpFileTypeNMap 'haskell', 'mrf', 'ghcmod/split-fun', 'GhcModSplitFunCase'
    SpFileTypeNMap 'haskell', 'mrg', 'ghcmod/sig-gen-code', 'GhcModSigCodegen'
    SpFileTypeNMap 'haskell', 'mre', 'ghcmod/expand', 'GhcModExpand'
  else
    let s:haskell_backend_name = { "name": "haskell/lsp" }
  endif
" }}}

" Set the key mappings for the various commands {{{
  au FileType haskell let g:lmap.m = { "name": "major-mode-cmd",
    \"i": s:haskell_backend_name,
    \"r": { "name": "haskell/refactor"
        \, "b": ["call ApplyAllSuggestion()", "hlint/refactor-buffer"]
        \, "r": ["all ApplyOneSuggestion()", "hlint/refactor-at-point"]
      \ },
    \"h": { "name": "haskell/documentation"
        \, "h": ["SpaceNeovimHaskellHoogle", "search-hoogle"]
        \, "H": ["SpaceNeovimHaskellHoogleInfo", "search-hoogle-info"]
        \, "C": ["HoogleClose", "close-hoogle"]
      \ },
    \"g": { "name": "haskell/navigation"
        \, "G": ["echo 'Not Implemented yet!'", "jump-to-definition-other-window"]
        \, "i": ["echo 'Not Implemented yet!'", "haskell-navigate-imports"]
      \ },
    \"s": { "name": "haskell/repl" }
    \}
" }}}

" Configuration {{{
  " Set the default indentation for haskell
  SpSpaceIndent 'haskell', 2

  " Using the Stack REPL for neovim-ghci.
  let g:ghci_command = 'stack repl'
  "let g:ghci_command_line_options = '--ghci-options="-fobject-code"'

  " Backend specific configuration {{{
    if g:sp_haskell_backend == 'intero'
      let g:intero_start_immediately = 1
      let g:ghci_start_immediately = 0
      augroup haskellLinter
        au!
        " Automatically reload on save
        au BufWritePost *.hs InteroReload
      augroup END

    elseif g:sp_haskell_backend == 'both'
      let g:intero_start_immediately = 1
      let g:ghci_start_immediately = 1
      let g:necoghc_use_stack = 1
      augroup haskellLinter
        au!
        " Automatically reload on save.
        au BufWritePost *.hs GhciReload
        " au BufWritePost *.hs GhcModCheckAndLintAsync
      augroup END

    elseif g:sp_haskell_backend == 'ghc-mod'
    " If we are using 'ghc-mod', then don't start Intero, but use regular GHCi instead.
      let g:intero_start_immediately = 0
      let g:ghci_start_immediately = 1
      augroup haskellLinter
        autocmd!
        " Automatically reload on save.
        au BufWritePost *.hs GhciReload
        " au BufWritePost *.hs GhcModCheckAndLintAsync
      augroup END
    else " 'lsp'
      let g:intero_start_immediately = 0
      let g:ghci_start_immediately = 1
      if  (g:spLspBackend !=? 'coc-lsp')
        " Add ghcide as the Haskell language server if we are not using coc.nvim.
        let g:LanguageClient_serverCommands = get(g:, 'LanguageClient_serverCommands', {})
        let g:LanguageClient_serverCommands.haskell = ['stack', 'exec', 'ghcide', '--', '--lsp']
      endif

      augroup haskellLinter
        au!
        " Automatically reload on save.
        au BufWritePost *.hs silent !GhciReload
      augroup END
    endif

    " Display type information on hover (off by default). This was the legacy way of doing it before
    " coc.nvim came around.
    let g:sp_haskell_show_type_on_hover = get(g:, 'spHaskellTypeOnHover', 0)
    if (g:spLspBackend !=? 'coc-lsp') && g:sp_haskell_show_type_on_hover && (g:sp_haskell_backend == 'both' || g:sp_haskell_backend == 'intero' || g:sp_haskell_backend == 'ghc-mod' || g:sp_haskell_backend == 'ghcmod' || g:sp_haskell_backend == 'lsp')
      " Make the update time shorter, so the info will trigger faster.
      set updatetime=1000
      " Get type information when you hold the cursor still for some time.
      augroup haskellTypeInfoOnHold
        au!
        au CursorHold *.hs SpaceNeovimHaskellTypeOnHold
      augroup END
    endif
  " }}}

  " Stop the quickfix window from always opening.
  let g:ghcmod_open_quickfix_function = 'GhcModQuickFix'
  function! GhcModQuickFix()
    " Do nothing!
  endfunction

  let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
  let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
  let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
  let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
  let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
  let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
  let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
" }}}

" Set layer specific configurations {{{
  if SpaceNeovimIsLayerEnabled('+completion/nvim-completion-manager')
    " TODO: SpaceNeovimHaskellInteroCompletion is a very experimental Intero completion mode,
    " so for now we go with neco-ghc.
    au User CmSetup call cm#register_source({'name' : 'intcompl',
        \ 'priority': 9,
        \ 'scopes': ['haskell'],
        \ 'abbreviation': 'hs',
        \ 'word_pattern': '[\w\-]+',
        \ 'cm_refresh_patterns':['[\w\-]+\s*:\s+'],
        \ 'cm_refresh': {'omnifunc': 'necoghc#omnifunc'},
        \ })
  endif

  if SpaceNeovimIsLayerEnabled('+completion/coc')
    if g:spCocHoverInfo
      augroup HaskellCocHoverBehaviour
        au!
        " Show documentation on hover.
        au CursorHold *.hs,*.lhs silent SpCocHover
      augroup end
    endif
    if g:sp_format_on_save
      augroup HaskellCocFormatBehaviour
        au!
        " Setup formatexpr specified filetype(s).
        au FileType haskell setl formatexpr=CocAction('formatSelected')
      augroup end
    endif

    if g:sp_haskell_lsp_use_stack
      let s:haskell_coc = {
      \  'command': 'stack',
      \  'args': ['exec', 'ghcide', '--', '--lsp'],
      \  'rootPatterns': [
      \    '.stack.yaml',
      \    '.hie-bios',
      \    'BUILD.bazel',
      \    'cabal.config',
      \    'package.yaml'
      \  ],
      \  'filetypes': ['hs', 'lhs', 'haskell'],
      \  'settings': {
      \    'languageServerHaskell': {
      \      'hlintOn': "true",
      \      'maxNumberOfProblems': 10,
      \      'completionSnippetsOn': "true"
      \    }
      \  }
      \}
    else
      let s:haskell_coc = {
      \  'command': 'ghcide',
      \  'args': ['--lsp'],
      \  'rootPatterns': [
      \    '.stack.yaml',
      \    '.hie-bios',
      \    'BUILD.bazel',
      \    'cabal.config',
      \    'package.yaml'
      \  ],
      \  'filetypes': ['hs', 'lhs', 'haskell'],
      \  'settings': {
      \    'languageServerHaskell': {
      \      'hlintOn': "true",
      \      'maxNumberOfProblems': 10,
      \      'completionSnippetsOn': "true"
      \    }
      \  }
      \}
    endif
    let g:coc_user_config = get(g:, 'coc_user_config', {})
    let g:coc_user_config.languageserver = get(g:coc_user_config, 'languageserver', {})
    let g:coc_user_config.languageserver.haskell = get(g:coc_user_config.languageserver, 'haskell', s:haskell_coc)
  endif

  if SpaceNeovimIsLayerEnabled('+completion/deoplete')
    " Disable haskell-vim omnifunc
    let g:haskellmode_completion_ghc = 0

    if g:sp_haskell_backend != 'lsp'
      if exists('g:sp_necoghc_enable_detailed_browse')
        let g:necoghc_enable_detailed_browse = g:sp_necoghc_enable_detailed_browse
      else
        let g:necoghc_enable_detailed_browse = 0
      endif

      let g:deoplete#sources#haskell#show_duplicates=0
      augroup haskellDeopleteConfig
        au!
        au FileType haskell setlocal omnifunc=necoghc#omnifunc
        au FileType haskell let b:deoplete_ignore_sources = ['tag']
      augroup END
    endif
  endif

  if SpaceNeovimIsLayerEnabled('+checkers/neomake')
    if g:sp_haskell_backend == 'intero'
      let g:neomake_haskell_enabled_makers = get(g:, 'sp_neomake_haskell_enabled_makers', ['hlint'])
    else
      let g:neomake_haskell_enabled_makers = get(g:, 'sp_neomake_haskell_enabled_makers', ['ghcmod', 'hlint'])
    endif
  endif

  if SpaceNeovimIsLayerEnabled('+checkers/ale')
    let g:intero_use_neomake = 0
  endif
" }}}
