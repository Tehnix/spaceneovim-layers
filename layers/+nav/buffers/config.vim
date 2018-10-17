let g:lmap.b = get(g:lmap, 'b', { 'name': 'buffers' })

nnoremap <leader><C-I> :b#<CR>
let g:lmap['<C-I>'] = "last-buffer"
SpNMap 'bd', 'kill-this-buffer', 'bd'
SpNMap 'bD', 'force-kill-this-buffer', 'bd!'
SpNMap 'bo', 'kill-other-buffers', 'BufOnly'
SpNMap 'bn', 'next-buffer', 'bnext!'
SpNMap 'bp', 'previous-buffer', 'bprevious!'
SpNMap 'bN', 'new-empty-buffer', 'new'
SpNMap 'bV', 'new-empty-vertical-buffer', 'vnew'
SpNMap 'bl', 'list-all-buffers', 'buffers'
SpNMap 'bF', 'open-first-buffer', 'bfirst!'
SpNMap 'bL', 'open-last-buffer', 'blast!'
SpNMap 'bC', 'copy-whole-buffer', '%y *'
if has('macunix')
  SpNMap 'bf', 'reveal-in-finder', '! open %:p:h'
endif
SpNMap 'bh', 'home', 'Startify'
