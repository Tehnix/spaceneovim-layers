" Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Ag command with preview window, if the silver searcher is available
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
if executable('ag')
  function! s:ag(query, bang)
    let l:query = a:query
    if empty(a:query)
      call inputsave()
      let l:query = input('Query: ')
      call inputrestore()
    endif
    call fzf#vim#ag(l:query,
      \             a:bang ? fzf#vim#with_preview('up:60%')
      \                    : fzf#vim#with_preview('right:50%:hidden', '?'),
      \             a:bang)
  endfunction

  command! -bang -nargs=* Ag call s:ag(<q-args>, <bang>0)
endif

" Rg command with preview window, if ripgrep is available
"   :Rg  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Rg! - Start fzf in fullscreen and display the preview window above
if executable('rg')
  function! s:rg(query, bang)
    let l:query = a:query
    if empty(a:query)
      call inputsave()
      let l:query = input('Query: ')
      call inputrestore()
    endif
    call fzf#vim#grep(
      \ 'rg --column --line-number --no-heading --color=always '.shellescape(l:query), 1,
      \ a:bang ? fzf#vim#with_preview('up:60%')
      \        : fzf#vim#with_preview('right:50%:hidden', '?'),
      \ a:bang)
  endfunction

  command! -bang -nargs=* Rg call s:rg(<q-args>, <bang>0)
endif

" GGrep command for git grep, if the '+scm/git' layer is enabled
if SpaceNeovimIsLayerEnabled('+scm/git')
  function! s:git_grep(query, bang)
    let l:query = a:query
    if empty(a:query)
      call inputsave()
      let l:query = input('Query: ')
      call inputrestore()
    endif
    call fzf#vim#grep('git grep --line-number '.shellescape(l:query), 0, a:bang)
  endfunction

  command! -bang -nargs=* GGrep call s:git_grep(<q-args>, <bang>0)
endif
