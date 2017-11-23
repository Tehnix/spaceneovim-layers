command! -nargs=0 -bar SpaceNeovimToggleComment call s:nerd_toggle_comment()
command! -nargs=0 -bar SpaceNeovimInvertToggleComment call s:nerd_invert_toggle_comment()
command! -nargs=0 -bar SpaceNeovimYankComment call s:nerd_yank_comment()
command! -nargs=0 -bar SpaceNeovimInvertYankComment call s:nerd_invert_yank_comment()
command! -nargs=0 -bar SpaceNeovimParagraphComment call s:nerd_paragraph_comment()
command! -nargs=0 -bar SpaceNeovimInvertParagraphComment call s:nerd_invert_paragraph_comment()

function! s:nerd_toggle_comment()
  call NERDComment(0, "Toggle")
endfunction

function! s:nerd_invert_toggle_comment()
  call NERDComment(0, "Invert")
endfunction

function! s:nerd_yank_comment()
  call NERDComment(0, "Yank")
  " Paste the yanked contents to mimic spacemacs behaviour.
  normal! p
endfunction

function! s:nerd_invert_yank_comment()
  " Yank the selection.
  normal! y
  " Reselect the selection.
  normal! gv
  " Toggle the comments using inverted.
  call NERDComment(0, "Invert")
  " Paste the yanked contents to mimic spacemacs behaviour.
  normal! p
endfunction

function! s:nerd_paragraph_comment()
  " Select the paragraph ({ goes to start, v selects and } goes to the end).
  normal! {v}
  " Toggle the comments using inverted.
  call NERDComment(0, "Toggle")
endfunction

function! s:nerd_invert_paragraph_comment()
  " Select the paragraph ({ goes to start, v selects and } goes to the end).
  normal! {v}
  " Toggle the comments using inverted.
  call NERDComment(0, "Invert")
endfunction
