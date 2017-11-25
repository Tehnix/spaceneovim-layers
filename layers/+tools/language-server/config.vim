" Set the key mappings for the various commands {{{
  let g:lmap.l = get(g:lmap, 'l', { 'name': '+lsp' })
  SpNMap 'li', 'show-info', 'call LanguageClient_textDocument_hover()'
  SpNMap 'lg', 'go-to-definition', 'call LanguageClient_textDocument_definition()'
  SpNMap 'lR', 'rename', 'call LanguageClient_textDocument_rename()'
  SpNMap 'lf', 'format', 'call LanguageClient_textDocument_formatting()'
  SpNMap 'lF', 'format-selection', 'call LanguageClient_textDocument_rangeFormatting()'
  let g:lmap.l.l = get(g:lmap.l, 'l', { 'name': '+list' })
  SpNMap 'lls', 'list-symbols', 'call LanguageClient_textDocument_documentSymbol()'
  SpNMap 'llr', 'list-references', 'call LanguageClient_textDocument_references()'
  SpNMap 'llS', 'list-project-symbols', 'call LanguageClient_workspace_symbol()'
" }}}


" Layer specific configurations {{{
  " Set up a default 'LanguageClient_serverCommands' dictionary.
  let g:LanguageClient_serverCommands = get(g:, 'LanguageClient_serverCommands', {})
  " Required for operations modifying multiple buffers like rename.
  set hidden
  " Make the command line higher for echodoc.
  set cmdheight=2
  set shortmess=a
  " Do not automatically start language clients.
  let g:LanguageClient_autoStart = 0
  " augroup autoStartLanguageServer
  "   autocmd!
  "   au BufWinEnter * SpaceNeovimHLSPEnableAutoStart
  " augroup END 
" }}}
