# Code snippets Layer
This layer brings snippets support to SpaceNeovim, using

- [`Shougo/neosnippet.vim`](https://github.com/Shougo/neosnippet.vim).

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

## Install
Add the `+core/snippets` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+core/snippets'
  " ...
endfunction
```

## Key Bindings
Key Binding | Description
----------- | --------------
CTRL k      | Expand or jump
