" Check which terminal is being used, and if we are inside tmux or not.

let s:restoreCursorToStyle = get(g:, 'dotspaceneovim_restore_cursor_to_style', 'horizontal')
let s:restoreCursorToBlink = get(g:, 'dotspaceneovim_restore_cursor_to_blink', 'off')


" Set the cursor to:
" - vertical bar, blinking, in insert mode/visual mode with selection
" - block in normal/visual mode
" - horizontal bar in replace mode
" - horizontal bar in operator pending mode
" - Cursor/lCursor style cursor in all modes (orange color)
" - block, blinking, in showmatch in insert mode
let originalGuiCursor = &guicursor
set guicursor=n-v-c:block,
             \i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250,
             \r-cr:hor20,
             \o:hor50,
		        "  \a:Cursor/lCursor,
		         \sm:block-blinkwait175-blinkoff150-blinkon175

" Try to restore the cursor on exit.
augroup resetCursor
  if s:restoreCursorToBlink == 'on'
    if s:restoreCursorToStyle == 'block'
      au VimLeave * set guicursor=a:block-blinkon250-blinkwait250-blinkoff400
    elseif s:restoreCursorToStyle == 'vertical'
      au VimLeave * set guicursor=a:hor25-blinkon250-blinkwait250-blinkoff400
    elseif s:restoreCursorToStyle == 'horizontal'
      au VimLeave * set guicursor=a:hor20-blinkon250-blinkwait250-blinkoff400
    elseif s:restoreCursorToStyle == 'horisontal'
      au VimLeave * set guicursor=a:hor20-blinkon250-blinkwait250-blinkoff400
    else
      au VimLeave * set guicursor=a:hor20-blinkon250-blinkwait250-blinkoff400
    endif
  else
    if s:restoreCursorToStyle == 'block'
      au VimLeave * set guicursor=a:block-blinkon0
    elseif s:restoreCursorToStyle == 'vertical'
      au VimLeave * set guicursor=a:hor25-blinkon0
    elseif s:restoreCursorToStyle == 'horizontal'
      au VimLeave * set guicursor=a:hor20-blinkon0
    elseif s:restoreCursorToStyle == 'horisontal'
      au VimLeave * set guicursor=a:hor20-blinkon0
    else
      au VimLeave * set guicursor=a:hor20-blinkon0
    endif
  end
augroup END
