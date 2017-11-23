" Remove default mappings {{{
  let g:NERDCreateDefaultMappings = 0
" }}

let g:lmap.c = get(g:lmap, 'c', { 'name': '+compile/comments' })
SpNMap 'cl', 'comment-or-uncomment-lines', 'SpaceNeovimToggleComment'
SpNMap 'cL', 'comment-or-uncomment-lines-inverted', 'SpaceNeovimInvertToggleComment'
SpNMap 'cy', 'copy-and-comment-lines', 'SpaceNeovimYankComment'
SpNMap 'cY', 'copy-and-comment-lines-inverse', 'SpaceNeovimInvertYankComment'
SpNMap 'cp', 'comment-or-uncomment-paragraphs', 'SpaceNeovimParagraphComment'
SpNMap 'cP', 'comment-or-uncomment-paragraphs-invert', 'SpaceNeovimInvertParagraphComment'
