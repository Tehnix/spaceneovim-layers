" Show invisible characters
set list

if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
  set listchars=extends:>,precedes:<,tab:▶\ ,trail:•
else
  set listchars=extends:>,precedes:<,tab:>\ ,trail:~
endif

let g:lmap.t = get(g:lmap, 't', { 'name': 'toggles' })
SpNMap 'tn', 'line-numbers', 'setlocal invnumber'
SpNMap 'tr', 'relative-line-numbers', 'setlocal invrelativenumber'
SpNMap 'tl', 'truncate-lines', 'setlocal invwrap'
SpNMap 'ts', 'syntax-highlighting', 'call SpaceNeovimToggleSyntax()'
SpNMap 'tS', 'spell-checking', 'setlocal invspell'
SpNMap 'tH', 'hidden-symbols', 'set list!'

let g:lmap.t.h = get(g:lmap.t, 'h', { 'name': 'highlight' })
SpNMap 'thc', 'highlight-indentation-current-column', 'setlocal invcursorcolumn'
SpNMap 'thh', 'highlight-current-line-globally', 'setlocal invcursorline'
SpNMap 'thp', 'parenthesis-highlight-mode', 'setlocal invshowmatch'
SpNMap 'ths', 'highlight-search', 'set hlsearch!'
