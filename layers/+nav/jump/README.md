# Navigation Layer
This layer provides common functionality for navigating smoothly around Neovim, using

- [`easymotion/vim-easymotion`](https://github.com/easymotion/vim-easymotion)

#### Table of Contents
- [Install](#install)
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

## Key Bindings
Key Binding | Description
----------- | -------------------------------
SPC j j     | Go to location with <char>
SPC j J     | Go to location with <char> <char>
SPC j w     | Go to location of any word
SPC j l     | Go to line
