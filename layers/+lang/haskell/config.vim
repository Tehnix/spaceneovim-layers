" Remove default mappings {{{
  let g:hlintRefactor#disableDefaultKeybindings = 1
" }}}

" Set the key mappings for the various commands {{{
  au FileType haskell let g:lmap.m = { "name": "+major-mode-cmd",
    \"i": { "name": "+haskell/ghcmod"
         \, "c": ["GhcModCheckAndLintAsync", "ghcmod/check"]
      \ },
    \"r": { "name": "+haskell/refactor"
         \, "b": ["call ApplyAllSuggestion()", "hlint/refactor-buffer"]
         \, "r": ["all ApplyOneSuggestion()", "hlint/refactor-at-point"]
         \, "f": ["GhcModSplitFunCase", "ghcmod/split-fun"]
         \, "g": ["GhcModSigCodegen", "ghcmod/sig-gen-code"]
         \, "e": ["GhcModExpand", "ghcmod/expand'"]
      \ },
    \"h": { "name": "+haskell/documentation"
         \, "h": ["SpaceNeovimHaskellHoogle", "search-hoogle"]
         \, "H": ["SpaceNeovimHaskellHoogleInfo", "search-hoogle-info"]
         \, "C": ["HoogleClose", "close-hoogle"]
         \, "t": ["GhcModType", "ghcmod/type-at"]
         \, "i": ["GhcModInfo", "ghcmod/info"]
         \, "T": ["GhcModTypeInsert", "ghcmod/insert-type"]
         \, "c": ["GhcModTypeClear", "ghcmod/clear-type"]
      \ },
    \"g": { "name": "+haskell/navigation"
         \, "G": ["echo 'Not Implemented yet!'", "jump-to-definition-other-window"]
         \, "g": ["echo 'Not Implemented yet!'", "jump-to-definition"]
         \, "i": ["echo 'Not Implemented yet!'", "haskell-navigate-imports"]
      \ },
    \"s": { "name": "+haskell/repl"
         \, "b": ["GhciLoadCurrentFile", "repl-load"]
         \, "S": ["GhciOpen", "pop-to-repl"]
         \, "s": ["GhciOpen", "display-repl"]
         \, "H": ["GhciHide", "hide-repl"]
         \, "r": ["GhciReload", "reload-repl"]
         \, "e": ["SpaceNeovimHaskellGhciExpression", "eval-expression"]
      \ },
    \}
" }}}

" Set layer specific configurations {{{
  " Set the default indentation for haskell
  SpSpaceIndent 'haskell', 2

  " Using the Stack REPL for neovim-ghci.
  let g:ghci_command = 'stack repl'
  let g:ghci_command_line_options = '--ghci-options="-fobject-code"'

  augroup spaceneovim_haskell_check
    autocmd!
    au BufWritePost *.hs GhcModCheckAndLintAsync
    au BufWritePost *.hs GhciReload
  augroup END

  if SpaceNeovimIsLayerEnabled('+completion/deoplete')
    " Disable haskell-vim omnifunc
    let g:haskellmode_completion_ghc = 0
    if exists('g:sp_necoghc_enable_detailed_browse')
      let g:necoghc_enable_detailed_browse = g:sp_necoghc_enable_detailed_browse
    else
      let g:necoghc_enable_detailed_browse = 1
    endif
    augroup haskellDeopleteConfig
      au!
      au FileType haskell setlocal omnifunc=necoghc#omnifunc
    augroup END
  endif

  if SpaceNeovimIsLayerEnabled('+checkers/neomake')
    let g:neomake_haskell_enabled_makers = get(g:, 'sp_neomake_haskell_enabled_makers', ['ghcmod', 'hlint'])
  endif
" }}}
