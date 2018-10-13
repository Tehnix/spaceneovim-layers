# Asyncomplete
This layer provides an asynchronous keyword completion system in the current buffer, using

- [`asyncomplete.vim`](https://github.com/prabirshrestha/asyncomplete.vim).

This layer works best in tandem with the `vim-lsp` backend of `+tools/language-server`.

#### Table of Contents
- [Install](#install)

## Install
Add the `+completion/asyncomplete` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+completion/asyncomplete'
  " ...
endfunction
```
