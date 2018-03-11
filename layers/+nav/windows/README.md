# Windows Layer
This layer provides common functionality for window operations.

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

## Install
Add the `+nav/windows` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+nav/windows'
  " ...
endfunction
```

## Key Bindings
Key Binding | Description
----------- | ------------------------------------
SPC w s     | Split window below
SPC w v     | Split window to the right
SPC w o     | Make the current window the only one
SPC w j     | Go to window below
SPC w k     | Go to window above
SPC w h     | Go to window on the left
SPC w l     | Go to window on the right
SPC w w     | Go to the other window
SPC w d     | Close current window

Key Binding | Description
----------- | --------------
SPC w 0     | Go to window 0
SPC w 1     | Go to window 1
SPC w 2     | Go to window 2
SPC w 3     | Go to window 3
SPC w 4     | Go to window 4
SPC w 5     | Go to window 5
SPC w 6     | Go to window 6
SPC w 7     | Go to window 7
SPC w 8     | Go to window 8
SPC w 9     | Go to window 9
