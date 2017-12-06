# Dynamic Cursor Layer

This layer makes the cursor change dynamically depending on which mode you are in.

- [Install](#install)

## Install

Add the `+ui/dynamic-cursor` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+ui/dynamic-cursor'
  " ...
endfunction
```

By default the cursor is reset to a horizontal bar with no blinking. You can configure this by setting, `g:dotspaceneovim_restore_cursor_to_style` and `g:dotspaceneovim_restore_cursor_to_blink` in your `UserInit`,

```viml
function! UserInit()
  " ...
  let g:dotspaceneovim_restore_cursor_to_style = 'horizontal'
  let g:dotspaceneovim_restore_cursor_to_style = 'off'
  " ...
endfunction
```

Possible values are for the style of `g:dotspaceneovim_restore_cursor_to_style` are,

- 'block'
- 'vertical'
- 'horizontal' (default)

and for blink,

- 'on'
- 'off' (default)
