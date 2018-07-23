# Jump Layer
This layer provides common functionality for navigating smoothly around Neovim, using

- [`easymotion/vim-easymotion`](https://github.com/easymotion/vim-easymotion)

#### Table of Contents
- [Install](#install)
- [Configuration](#configuration)
- [Key Bindings](#key-bindings)

## Install
Add the `+nav/jump` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+nav/jump'
  " ...
endfunction
```

## Configuration
If you prefer to use the 2 character easymotion by default, you can switch the 1 char and 2 char bindings around with `let g:spJumpSwitchGotoChar = 1`.

## Key Bindings
Key Binding | Description
----------- | -------------------------------
SPC j j     | Go to location with _char_
SPC j J     | Go to location with _char_ _char_
SPC j w     | Go to location of any word
SPC j l     | Go to line
