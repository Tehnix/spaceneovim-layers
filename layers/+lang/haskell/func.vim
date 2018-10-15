command! -nargs=0 -bar SpaceNeovimHaskellHoogle call feedkeys(":Hoogle ")
command! -nargs=0 -bar SpaceNeovimHaskellHoogleInfo call feedkeys(":HoogleInfo ")
command! -nargs=0 -bar SpaceNeovimHaskellGhciExpression call feedkeys(":GhciEvaluate ")
command! -nargs=0 -bar SpaceNeovimHaskellInteroTarget call feedkeys(":InteroSetTargets ")
command! -nargs=0 -bar SpaceNeovimHaskellInteroRepl call s:open_intero_repl()
command! -nargs=0 -bar SpaceNeovimHaskellGhcmodType call s:ghcmod_type()
command! -nargs=0 -bar SpaceNeovimHaskellInteroType call s:intero_type()
command! -nargs=0 -bar SpaceNeovimHaskellTypeOnHold call s:display_info_on_cursor_hold()


function! s:open_intero_repl()
  :InteroOpen
  :InteroLoadCurrentFile
endfunction

function! s:ghcmod_type()
  :GhcModType
  :GhcModTypeClear
endfunction

function! g:SpaceNeovimHaskellTypeHandler(lines)
  "let l:message = join(a:lines, '\n')
  if len(a:lines) > 0
    let l:message = a:lines[0]
    echohl Haskell | echon l:message | echohl None
  endif
endfunction

function! s:intero_type()
  let l:ident = intero#util#get_haskell_identifier()
  call intero#process#add_handler(function('g:SpaceNeovimHaskellTypeHandler'))
  call intero#repl#send(':type ' . l:ident)
endfunction

" FIXME: Whenever this is merged https://github.com/neovim/neovim/pull/6619, we could
" use that to display the type information instead.
let g:spLspBackend = get(g:, 'spLSPBackend', 'nvim-lsp')
let s:word_under_cursor = ""
function! s:display_info_on_cursor_hold()
  let l:new_word_under_cursor = expand("<cword>")
  if s:word_under_cursor  !=# l:new_word_under_cursor
    if g:sp_haskell_backend == 'intero' || g:sp_haskell_backend == 'both'
      if g:intero_started
        call s:intero_type()
      endif
    elseif g:sp_haskell_backend == 'ghcmod' || g:sp_haskell_backend == 'ghc-mod'
      call s:ghcmod_type()
    elseif g:sp_haskell_backend == 'lsp'
      " LSP Supports this via `call LanguageClient#textDocument_hover()`, but
      " that needs a way to cut off the output after the first line.
      if (g:spLspBackend ==? 'nvim-lsp')
        call LanguageClient#textDocument_hover()
      else
        :LspHover
      endif
    endif
    let s:word_under_cursor = l:new_word_under_cursor
  endif
endfunction

function! SpaceNeovimHaskellInteroCompletion(findstart, base)
  if a:findstart
	    " Locate the start of the word
	    let line = getline('.')
	    let start = col('.') - 1
	    while start > 0 && line[start - 1] =~ '\a'
	      let start -= 1
	    endwhile
	    return start
  else
    call intero#process#add_handler(function('SpaceNeovimHaskellHandleInteroCompletion'))
    call intero#repl#send(':complete repl "' . a:base . '"')
  endif
  return []
endfunction

function! SpaceNeovimHaskellHandleInteroCompletion(lines)
  echom join(a:lines, '\n')
  if len(a:lines) > 0
    for m in a:lines[1:-1]
      call complete_add(m)
    endfor
  endif
endfunction
