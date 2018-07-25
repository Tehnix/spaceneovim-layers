let g:spOniSwapFileTree = get(g:, 'spOniSwapFileTree', 0)

let g:lmap.f = get(g:lmap, 'f', { 'name': '+files' })
SpNMap 'fr', 'nerdtree-reveal', 'NERDTreeFind'
SpNMap 'fs', 'save-buffer', ':w'
SpNMap 'fS', 'save-buffer', ':w'
SpNMap 'fn', 'nerdtree-sync', 'SyncNERDTree'

if exists('g:gui_oni')
  " Swap nerdtree and Oni sidbar keybindings, if enabled.
  if g:spOniSwapFileTree
    SpNMap 'ft', 'nerdtree-toggle', 'NERDTreeToggle'
    SpNMap 'fT', 'oni-sidebar-toggle', 'call OniCommand(\"sidebar.toggle\")'
  else
    SpNMap 'ft', 'nerdtree-toggle', 'NERDTreeToggle'
    SpNMap 'fT', 'oni-sidebar-toggle', 'call OniCommand(\"sidebar.toggle\")'
  endif
else
  SpNMap 'ft', 'nerdtree-toggle', 'NERDTreeToggle'
endif

let g:lmap.f.e = get(g:lmap.f, 'e', { 'name': '+spaceneovim' })
SpNMap 'fed', 'find-dotfile', 'e $MYVIMRC'
SpNMap 'fes', 'find-spaceneovim-layers', 'e $HOME/.config/nvim/spaceneovim-layers'
SpNMap 'feu', 'update-spaceneovim-layers', 'SpaceNeovimUpdateLayers'
SpNMap 'feU', 'update-plugins', 'PlugUpdate!'
SpNMap 'feC', 'clean-plugins', 'PlugClean!'
SpNMap 'feR', 'sync-configuration', 'SpaceNeovimSyncConfiguration'

" NERDTree Git
let g:NERDTreeIndicatorMapCustom = {
\ "Modified"  : "·",
\ "Staged"    : "+",
\ "Untracked" : "*",
\ "Renamed"   : " ",
\ "Unmerged"  : " ",
\ "Deleted"   : "x",
\ "Dirty"     : "·",
\ "Clean"     : "√",
\ "Ignored"   : " ",
\ "Unknown"   : " "
\ }

let g:NERDTreeShowIgnoredStatus = 1  "enables ignored highlighting
let g:NERDTreeGitStatusNodeColorization = 1  "enables colorization
let g:NERDTreeGitStatusWithFlags = 1  "enables flags, (may be default), required for colorization

highlight link NERDTreeDir Question  "custom color
highlight link NERDTreeGitStatusIgnored Comment  "custom color
highlight link NERDTreeGitStatusModified cssURL  "custom color

" NERDTree
set hidden
let g:NERDTreeDirArrowExpandable = nr2char(8200)  "sets expandable character
let g:NERDTreeDirArrowCollapsible = nr2char(8200)  "sets collapsible character
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '  "removes padding after devicon glyph
let g:WebDevIconsUnicodeDecorateFolderNodes = 1  "enables decorating folder nodes

augroup NERDTreeConfig
  au!
  " If you show hidden characters, this hides them in NERDTree.
  au FileType nerdtree setlocal nolist
augroup END
