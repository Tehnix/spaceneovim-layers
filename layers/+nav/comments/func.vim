command! -range -nargs=0 -bar SpaceNeovimToggleComment <line1>,<line2>call s:nerd_toggle_comment()
command! -range -nargs=0 -bar SpaceNeovimInvertToggleComment <line1>,<line2>call s:nerd_invert_toggle_comment()
command! -range -nargs=0 -bar SpaceNeovimYankComment <line1>,<line2>call s:nerd_yank_comment()
command! -range -nargs=0 -bar SpaceNeovimInvertYankComment <line1>,<line2>call s:nerd_invert_yank_comment()
command! -range -nargs=0 -bar SpaceNeovimParagraphComment <line1>,<line2>call s:nerd_paragraph_comment()
command! -range -nargs=0 -bar SpaceNeovimInvertParagraphComment <line1>,<line2>call s:nerd_invert_paragraph_comment()

function! s:nerd_toggle_comment()
  call NERDComment(1, 'toggle')
endfunction

function! s:nerd_invert_toggle_comment()
  call NERDComment(1, 'invert')
endfunction

function! s:nerd_yank_comment()
  call NERDComment(1, 'yank')
  " Paste the yanked contents to mimic spacemacs behaviour.
  normal! p
endfunction

function! s:nerd_invert_yank_comment()
  " Yank the selection.
  normal! y
  " Reselect the selection.
  normal! gv
  " Toggle the comments using inverted.
  call NERDComment(1, 'invert')
  " Paste the yanked contents to mimic spacemacs behaviour.
  normal! p
endfunction

function! s:nerd_paragraph_comment()
  " Select the paragraph ({ goes to start, v selects and } goes to the end).
  normal! {v}
  " Toggle the comments using inverted.
  call NERDComment(1, 'toggle')
endfunction

function! s:nerd_invert_paragraph_comment()
  " Select the paragraph ({ goes to start, v selects and } goes to the end).
  normal! {v}
  " Toggle the comments using inverted.
  call NERDComment(1, 'invert')
endfunction
