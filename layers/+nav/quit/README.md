# Quit Layer

This layer provides common functionality to quit things.

- [Install](#install)

  - [Layer](#layer)

- [Key Bindings](#key-bindings)

## Install

### Layer

Add the `+nav/quit` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+nav/quit'
  " ...
endfunction
```

## Key Bindings

Key Binding | Description
----------- | -----------------------------------------
SPC q q     | Quit Neovim
SPC q Q     | Quit Neovim
SPC q s     | Save current open buffers and quit Neovim
SPC q S     | Save all open buffers and quit Neovim
SPC q z     | Save and quit Neovim
SPC q !     | Force quit Neovim
