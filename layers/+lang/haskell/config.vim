" Remove default mappings {{{
  let g:hlintRefactor#disableDefaultKeybindings = 1
" }}}

" Backend keymappings {{{
  let g:sp_haskell_backend = get(g:, 'spHaskellBackend', 'ghc-mod')

  " Intero backend specific bindings {{{
    let s:sp_haskell_intero_backend = { "name": "+haskell/intero"
        \, "d": ["InteroReload", "intero/devel-reload"]
        \, "k": ["InteroKill", "intero/destroy"]
        \, "r": ["InteroStart", "intero/start"]
        \, "t": ["SpaceNeovimHaskellInteroTarget", "intero/targets"]
      \ }
    let s:sp_haskell_intero_jump_to_definition = {'g': ["InteroGoToDef", "intero/jump-to-definition"]}
    let s:sp_haskell_intero_repl = { "name": "+haskell/repl"
        \, "b": ["SpaceNeovimHaskellInteroRepl", "intero/repl-load"]
        \, "S": ["InteroOpen", "intero/pop-to-repl"]
        \, "s": ["InteroOpen", "intero/display-repl"]
        \, "h": ["InteroHide", "intero/hide-repl"]
        \, "r": ["InteroReload", "intero/reload-repl"]
      \ }
    let s:sp_haskell_intero_documentation = {
        \  "t": ["SpaceNeovimHaskellInteroType", "intero/type-at"]
        \, "i": ["InteroInfo", "intero/info"]
        \, "g": ["InteroGenericType", "intero/generic-type"]
        \, "T": ["InteroTypeInsert", "intero/insert-type"]
      \ }
    let s:sp_haskell_intero_refactor = {}
  " }}}
  " ghc-mod backend specific bindings {{{
    let s:sp_haskell_ghcmod_backend = { "name": "+haskell/ghcmod"
        \, "c": ["GhcModCheckAndLintAsync", "ghcmod/check"]
      \ }
    let s:sp_haskell_ghcmod_jump_to_definition = {'g': ["echo 'Not Implemented yet!'", "jump-to-definition"]}
    let s:sp_haskell_ghcmod_repl = { "name": "+haskell/repl"
        \, "b": ["GhciLoadCurrentFile", "ghci/repl-load"]
        \, "S": ["GhciOpen", "ghci/pop-to-repl"]
        \, "s": ["GhciOpen", "ghci/display-repl"]
        \, "h": ["GhciHide", "ghci/hide-repl"]
        \, "r": ["GhciReload", "ghci/reload-repl"]
        \, "e": ["SpaceNeovimHaskellGhciExpression", "ghci/eval-expression"]
      \ }
    let s:sp_haskell_ghcmod_documentation = {
        \  "t": ["SpaceNeovimHaskellGhcmodType", "ghcmod/type-at"]
        \, "i": ["GhcModInfo", "ghcmod/info"]
        \, "T": ["GhcModTypeInsert", "ghcmod/insert-type"]
        \, "c": ["GhcModTypeClear", "ghcmod/clear-type"]
      \ }
    let s:sp_haskell_ghcmod_refactor = {
        \  "f": ["GhcModSplitFunCase", "ghcmod/split-fun"]
        \, "g": ["GhcModSigCodegen", "ghcmod/sig-gen-code"]
        \, "e": ["GhcModExpand", "ghcmod/expand"]
      \ }
  " }}}
  " LSP backend (HIE) {{{
    let s:sp_haskell_lsp_jump_to_definition = {'g': ["call LanguageClient_textDocument_definition()", "lsp/jump-to-definition"]}
    let s:sp_haskell_lsp_refactor = {'R': ["call LanguageClient_textDocument_rename()", "lsp/rename"]}
  " }}}
  " both backend specific bindings {{{
    let s:sp_haskell_both_repl = { "name": "+haskell/repl"
      \, "B": ["GhciLoadCurrentFile", "ghci/repl-load"]
      \, "S": ["GhciOpen", "ghci/display-repl"]
      \, "H": ["GhciHide", "ghci/hide-repl"]
      \, "R": ["GhciReload", "ghci/reload-repl"]
      \, "e": ["SpaceNeovimHaskellGhciExpression", "ghci/eval-expression"]
    \ }
    let s:sp_haskell_both_documentation = {'G' : { "name": "+ghcmod",
        \  "t": ["SpaceNeovimHaskellGhcmodType", "ghcmod/type-at"]
        \, "i": ["GhcModInfo", "ghcmod/info"]
        \, "T": ["GhcModTypeInsert", "ghcmod/insert-type"]
        \, "c": ["GhcModTypeClear", "ghcmod/clear-type"]
      \ }}
  " }}}

  " Stitch together the correct keymappings based on the backends.
  if g:sp_haskell_backend == 'intero'
    let s:sp_haskell_backend = s:sp_haskell_intero_backend
    let s:sp_haskell_jump_to_definition = s:sp_haskell_intero_jump_to_definition
    let s:sp_haskell_repl = s:sp_haskell_intero_repl
    let s:sp_haskell_documentation = s:sp_haskell_intero_documentation
    let s:sp_haskell_refactor = s:sp_haskell_intero_refactor
  elseif g:sp_haskell_backend == 'both'
    let s:sp_haskell_backend = extend(s:sp_haskell_ghcmod_backend, s:sp_haskell_intero_backend)
    let s:sp_haskell_jump_to_definition = extend(s:sp_haskell_ghcmod_jump_to_definition, s:sp_haskell_intero_jump_to_definition)
    let s:sp_haskell_repl = extend(s:sp_haskell_intero_repl, s:sp_haskell_both_repl)
    let s:sp_haskell_documentation = extend(s:sp_haskell_both_documentation, s:sp_haskell_intero_documentation)
    let s:sp_haskell_refactor = extend(s:sp_haskell_intero_refactor, s:sp_haskell_ghcmod_refactor)
  elseif g:sp_haskell_backend == 'lsp'
    let s:sp_haskell_backend = s:sp_haskell_ghcmod_backend
    let s:sp_haskell_jump_to_definition = s:sp_haskell_lsp_jump_to_definition
    let s:sp_haskell_repl = s:sp_haskell_ghcmod_repl
    let s:sp_haskell_documentation = s:sp_haskell_ghcmod_documentation
    let s:sp_haskell_refactor = extend(s:sp_haskell_ghcmod_refactor, s:sp_haskell_lsp_refactor)
  else
    let s:sp_haskell_backend = s:sp_haskell_ghcmod_backend
    let s:sp_haskell_jump_to_definition = s:sp_haskell_ghcmod_jump_to_definition
    let s:sp_haskell_repl = s:sp_haskell_ghcmod_repl
    let s:sp_haskell_documentation = s:sp_haskell_ghcmod_documentation
    let s:sp_haskell_refactor = s:sp_haskell_ghcmod_refactor
  endif
" }}}

" Set the key mappings for the various commands {{{
  au FileType haskell let g:lmap.m = { "name": "+major-mode-cmd",
    \"i": s:sp_haskell_backend,
    \"r": extend({ "name": "+haskell/refactor"
         \, "b": ["call ApplyAllSuggestion()", "hlint/refactor-buffer"]
         \, "r": ["all ApplyOneSuggestion()", "hlint/refactor-at-point"]
      \ }, s:sp_haskell_refactor),
    \"h": extend({ "name": "+haskell/documentation"
         \, "h": ["SpaceNeovimHaskellHoogle", "search-hoogle"]
         \, "H": ["SpaceNeovimHaskellHoogleInfo", "search-hoogle-info"]
         \, "C": ["HoogleClose", "close-hoogle"]
      \ }, s:sp_haskell_documentation),
    \"g": extend({ "name": "+haskell/navigation"
         \, "G": ["echo 'Not Implemented yet!'", "jump-to-definition-other-window"]
         \, "i": ["echo 'Not Implemented yet!'", "haskell-navigate-imports"]
      \ }, s:sp_haskell_jump_to_definition),
    \"s": s:sp_haskell_repl
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

    elseif g:sp_haskell_backend == 'lsp'
      let g:intero_start_immediately = 0
      let g:ghci_start_immediately = 1
      " Add HIE as the Haskell language server.
      let g:LanguageClient_serverCommands = get(g:, 'LanguageClient_serverCommands', {})
      let g:LanguageClient_serverCommands.haskell = ['hie', '--lsp']
      augroup haskellLinter
        au!
        " Automatically reload on save.
        au BufWritePost *.hs GhciReload
        " Start the language server when entering a Haskell buffer.
        au BufEnter *.hs :LanguageClientStart
      augroup END

    else " 'ghc-mod'
      " If we are using 'ghc-mod', then don't start Intero, but use regular GHCi instead.
      let g:intero_start_immediately = 0
      let g:ghci_start_immediately = 1
      augroup haskellLinter
        autocmd!
        " Automatically reload on save.
        au BufWritePost *.hs GhciReload
        " au BufWritePost *.hs GhcModCheckAndLintAsync
      augroup END

    endif

    " Display type information on hover (off by default).
    let g:sp_haskell_show_type_on_hover = get(g:, 'spHaskellTypeOnHover', 0)
    if g:sp_haskell_show_type_on_hover && (g:sp_haskell_backend == 'both' || g:sp_haskell_backend == 'intero' || g:sp_haskell_backend == 'ghc-mod' || g:sp_haskell_backend == 'ghcmod')
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
