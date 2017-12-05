" Remove default mappings {{{
  let g:NERDCreateDefaultMappings = 1
" }}

let g:lmap.c = get(g:lmap, 'c', { 'name': '+compile/comments' })
SpMap 'cl', 'comment-or-uncomment-lines', 'SpaceNeovimToggleComment'
SpMap 'cL', 'comment-or-uncomment-lines-inverted', 'SpaceNeovimInvertToggleComment'
" FIXME: Yanks and comment only work on 1 line.
SpMap 'cy', 'copy-and-comment-lines', 'SpaceNeovimYankComment'
SpMap 'cY', 'copy-and-comment-lines-inverse', 'SpaceNeovimInvertYankComment'
SpMap 'cp', 'comment-or-uncomment-paragraphs', 'SpaceNeovimParagraphComment'
SpMap 'cP', 'comment-or-uncomment-paragraphs-invert', 'SpaceNeovimInvertParagraphComment'

