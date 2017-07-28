" FIXME: Currently deletes the content in the buffer
"call SpaceNeovimNMap('<Tab>', 'last buffer', 'b#')

let g:lmap.b = { 'name': '+buffers' }
call SpaceNeovimNMap('bd', 'kill-this-buffer', 'bd')
call SpaceNeovimNMap('bD', 'force-kill-this-buffer', 'bd!')
call SpaceNeovimNMap('bo', 'kill-other-buffers', 'BufOnly')
call SpaceNeovimNMap('bn', 'next-buffer', 'bnext!')
call SpaceNeovimNMap('bp', 'previous-buffer', 'bprevious!')
call SpaceNeovimNMap('bN', 'new-empty-buffer', 'new')
call SpaceNeovimNMap('bV', 'new-empty-vertical-buffer', 'vnew')
call SpaceNeovimNMap('bl', 'list-all-buffers', 'buffers')
call SpaceNeovimNMap('bF', 'open-first-buffer', 'bfirst!')
call SpaceNeovimNMap('bL', 'open-last-buffer', 'blast!')
call SpaceNeovimNMap('bC', 'copy-whole-buffer', '%y *')
call SpaceNeovimNMap('bf', 'reveal-in-osx-finder', '! open %:p:h')
call SpaceNeovimNMap('bh', 'home', 'Startify')
