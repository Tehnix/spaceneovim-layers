" Remove default mappings {{{
  let g:hlintRefactor#disableDefaultKeybindings = 1
" }}}

let g:sp_haskell_backend = get(g:, 'spHaskellBackend', 'ghc-mod')

" Intero backend specific bindings.
let s:sp_haskell_intero_backend = { "name": "+haskell/intero"
     \, "d": ["InteroReload", "intero/devel-reload"]
     \, "k": ["InteroKill", "intero/destroy"]
     \, "r": ["InteroStart", "intero/start"]
     \, "t": ["SpaceNeovimHaskellInteroTarget", "intero/targets"]
  \ }
let s:sp_haskell_intero_jump_to_definition = {'g': ["InteroGoToDef", "intero/jump-to-definition"]}
let s:sp_haskell_intero_repl = { "name": "+haskell/repl"
     \, "b": ["SpaceNeovimHaskellInteroRepl", "repl-load"]
     \, "S": ["InteroOpen", "pop-to-repl"]
     \, "s": ["InteroOpen", "display-repl"]
     \, "H": ["InteroHide", "hide-repl"]
     \, "r": ["InteroReload", "reload-repl"]
  \ }
let s:sp_haskell_intero_documentation = {
     \  "t": ["InteroType", "intero/type-at"]
     \, "g": ["InteroGenericType", "intero/generic-type"]
     \, "T": ["InteroTypeInsert", "intero/insert-type"]
  \ }
let s:sp_haskell_intero_refactor = {}

" ghc-mod backend specific bindings.
let s:sp_haskell_ghcmod_backend = { "name": "+haskell/ghcmod"
     \, "c": ["GhcModCheckAndLintAsync", "ghcmod/check"]
  \ }
let s:sp_haskell_ghcmod_jump_to_definition = {'g': ["echo 'Not Implemented yet!'", "jump-to-definition"]}
let s:sp_haskell_ghcmod_repl = { "name": "+haskell/repl"
     \, "b": ["GhciLoadCurrentFile", "repl-load"]
     \, "S": ["GhciOpen", "pop-to-repl"]
     \, "s": ["GhciOpen", "display-repl"]
     \, "H": ["GhciHide", "hide-repl"]
     \, "r": ["GhciReload", "reload-repl"]
     \, "e": ["SpaceNeovimHaskellGhciExpression", "eval-expression"]
  \ }
let s:sp_haskell_ghcmod_documentation = {
     \  "t": ["GhcModType", "ghcmod/type-at"]
     \, "i": ["GhcModInfo", "ghcmod/info"]
     \, "T": ["GhcModTypeInsert", "ghcmod/insert-type"]
     \, "c": ["GhcModTypeClear", "ghcmod/clear-type"]
  \ }
let s:sp_haskell_ghcmod_refactor = {
     \  "f": ["GhcModSplitFunCase", "ghcmod/split-fun"]
     \, "g": ["GhcModSigCodegen", "ghcmod/sig-gen-code"]
     \, "e": ["GhcModExpand", "ghcmod/expand"]
  \ }

" LSP backend (HIE).
let s:sp_haskell_lsp_jump_to_definition = {'g': ["call LanguageClient_textDocument_definition()", "lsp/jump-to-definition"]}
let s:sp_haskell_lsp_refactor = {'R': ["call LanguageClient_textDocument_rename()", "lsp/rename"]}

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
  let s:sp_haskell_repl = extend(s:sp_haskell_ghcmod_repl, s:sp_haskell_intero_repl)
  let s:sp_haskell_documentation = extend(s:sp_haskell_ghcmod_documentation, s:sp_haskell_intero_documentation)
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

" Set layer specific configurations {{{
  " Set the default indentation for haskell
  SpSpaceIndent 'haskell', 2

  " Using the Stack REPL for neovim-ghci.
  let g:ghci_command = 'stack repl'
  let g:ghci_command_line_options = '--ghci-options="-fobject-code"'

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
    let g:ghci_start_immediately = 0
    augroup haskellLinter
      au!
      " Automatically reload on save
      au BufWritePost *.hs GhcModCheckAndLintAsync
      au BufWritePost *.hs InteroReload
    augroup END
  elseif g:sp_haskell_backend == 'lsp'
    let g:intero_start_immediately = 0
    let g:ghci_start_immediately = 1
    " Add HIE as the Haskell language server.
    let g:LanguageClient_serverCommands = get(g:, 'LanguageClient_serverCommands', {})
    let g:LanguageClient_serverCommands.haskell = ['hie', '--lsp']
    augroup haskellLinter
      au!
      " Automatically reload on save
      au BufWritePost *.hs GhciReload
      " au BufWritePost *.hs SpaceNeovimHLSPUpdateSymbolList
      au BufEnter *.hs :LanguageClientStart
      " FIXME: Currently not very ergonomic, since multi lines will
      " prompt the "Enter to continue".
      " au CursorMoved *.hs SpaceNeovimHLSPDisplayInfo
      " au CursorMovedI *.hs SpaceNeovimHLSPDisplayInfo
    augroup END
  else
    let g:intero_start_immediately = 0
    let g:ghci_start_immediately = 1
    augroup haskellLinter
      autocmd!
      au BufWritePost *.hs GhcModCheckAndLintAsync
      au BufWritePost *.hs GhciReload
    augroup END
  endif

  let g:ghcmod_open_quickfix_function = 'GhcModQuickFix'
  function! GhcModQuickFix()
    " Do nothing!
  endfunction


  if SpaceNeovimIsLayerEnabled('+completion/deoplete')
    " Disable haskell-vim omnifunc
    let g:haskellmode_completion_ghc = 0
    if g:sp_haskell_backend == 'lsp'
      " Use the auto completion info from HIE.
    else
      if exists('g:sp_necoghc_enable_detailed_browse')
        let g:necoghc_enable_detailed_browse = g:sp_necoghc_enable_detailed_browse
      else
        let g:necoghc_enable_detailed_browse = 0
      endif
      augroup haskellDeopleteConfig
        au!
        au FileType haskell setlocal omnifunc=necoghc#omnifunc
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
