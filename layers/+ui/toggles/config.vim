call SpaceNeovimLoadFunc(expand('<sfile>:p'), 'func.vim')

if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
     set listchars=extends:>,precedes:<,tab:▶\ ,trail:•
else
     set listchars=extends:>,precedes:<,tab:>\ ,trail:~
endif

let g:lmap.t = { 'name': '+toggles' }
call SpaceNeovimNMap('tn', 'line-numbers', 'setlocal invnumber')
call SpaceNeovimNMap('tr', 'relative-line-numbers', 'setlocal invrelativenumber')
call SpaceNeovimNMap('tl', 'truncate-lines', 'setlocal invwrap')
call SpaceNeovimNMap('ts', 'syntax-checking', 'call SpaceNeovimToggleSyntax()')
call SpaceNeovimNMap('tS', 'spell-checking', 'setlocal invspell')
call SpaceNeovimNMap('tH', 'hidden-symbols', 'set list!')

let g:lmap.t.h = { 'name': '+highlight' }
call SpaceNeovimNMap('thh', 'highlight-current-line-globally', 'setlocal invcursorline')
call SpaceNeovimNMap('thc', 'highlight-indentation-current-column', 'setlocal invcursorcolumn')
call SpaceNeovimNMap('thp', 'parenthesis-highlight-mode', 'setlocal invshowmatch')
call SpaceNeovimNMap('ths', 'highlight-search', 'set hlsearch!')
