call SpaceNeovimLoadFunc(expand('<sfile>:p'), 'func.vim')

let g:lmap.t = { 'name': '+toggles' }
call SpaceNeovimNMap('tn', 'line-numbers', 'setlocal invnumber')
call SpaceNeovimNMap('tr', 'relateive-line-numbers', 'setlocal invrelativenumber')
call SpaceNeovimNMap('tl', 'truncate-lines', 'setlocal invwrap')
call SpaceNeovimNMap('ts', 'syntax-checking', 'call SpaceNeovimToggleSyntax()')
call SpaceNeovimNMap('tS', 'spell-checking', 'setlocal invspell')

let g:lmap.t.h = { 'name': '+highlight' }
call SpaceNeovimNMap('thh', 'highlight-current-line-globally', 'setlocal invcursorline')
call SpaceNeovimNMap('thc', 'highlight-indentation-current-column', 'setlocal invcursorcolumn')
call SpaceNeovimNMap('thp', 'parenthesis-highlight-mode', 'setlocal invshowmatch')
