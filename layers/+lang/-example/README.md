# Example Language Layer
This layer provides support for the Haskell language with the following packages:

- [`neovimhaskell/haskell-vim`](https://github.com/neovimhaskell/haskell-vim)

#### Table of Contents
- [Install](#install)
  - [Binaries](#binaries)
  - [Indentation](#indentation)
  - [Checkers](#checkers)
- [Key Bindings](#key-bindings)
  - [Documentation](#documentation)

## Install
Add the `+lang/-example` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+lang/-example'
  " ...
endfunction
```

### Binaries
To utilize this layer you need `ghc-mod`, `hlint` and `apply-refact` on your path. This can be done with,

```bash
$ stack install apply-refact ghc-mod hlint
```

### Indentation
You can configure the indentation by setting `g:sp_haskell_indentation` in your user-init block (i.e. before loading the plugin). By default it is set to `2`.

### Checkers
By default `g:neomake_haskell_enabled_makers` is set to use all makers. This can be overwritten by setting the desired makers with `g:sp_neomake_haskell_enabled_makers`.

## Key Bindings
Key Binding | Description
----------- | ---------------------------
SPC m c     | Check and lint with ghc-mod

### Documentation
Key Binding | Description
----------- | ---------------------------
SPC m d h   | Start a Hoogle search query
