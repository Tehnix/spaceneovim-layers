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

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
