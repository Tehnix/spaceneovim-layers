command! -nargs=0 -bar SpaceNeovimHLSPEnableAutoStart call s:setup_language_server_autostart()
command! -nargs=0 -bar SpaceNeovimHLSPDisplayInfo call s:display_info_on_cursor_hold()
command! -nargs=0 -bar SpaceNeovimHLSPUpdateSymbolList call s:update_symbol_list()

let g:has_enabled_language_server = 0
function! s:setup_language_server_autostart()
  if g:has_enabled_language_server == 0
    let g:LanguageClient_autoStart = 1
    :LanguageClientStart
    let g:has_enabled_language_server = 1
  endif
endfunction

let s:lsp_info_word_under_cursor = ""
function! s:display_info_on_cursor_hold()
  let l:wordUnderCursor = expand("<cword>")
  if s:lsp_info_word_under_cursor  !=# l:wordUnderCursor
    redir => s:messages
    call LanguageClient_textDocument_hover()
    redir END
    let hoverInfo = split(s:messages)
    if len(hoverInfo) > 0
      echo hoverInfo
    endif
    let s:lsp_info_word_under_cursor = l:wordUnderCursor
  endif
endfunction

function! s:update_symbol_list()
  call LanguageClient_textDocument_documentSymbol()
endfunction

