# Haskell Layer

This layer provides support for the Haskell language with the following packages:

- [`neovimhaskell/haskell-vim`](https://github.com/neovimhaskell/haskell-vim)
- [`vmchale/cabal-project-vim`](https://github.com/vmchale/cabal-project-vim)
- [`vmchale/ghci-syntax`](https://github.com/vmchale/ghci-syntax)
- [`Twinside/vim-hoogle`](https://github.com/Twinside/vim-hoogle)
- [`mpickering/hlint-refactor-vim`](https://github.com/mpickering/hlint-refactor-vim)
- [`eagletmt/neco-ghc`](https://github.com/eagletmt/neco-ghc)
- [`Shougo/vimproc.vim'`](https://github.com/Shougo/vimproc.vim')
- [`parsonsmatt/intero-neovim`](https://github.com/parsonsmatt/intero-neovim)
- [`owickstrom/neovim-ghci`](https://github.com/owickstrom/neovim-ghci)
- [`eagletmt/ghcmod-vim`](https://github.com/eagletmt/ghcmod-vim)
- [`ndmitchell/ghcid'](https://github.com/ndmitchell/ghcid/tree/master/plugins/nvim)

#### Table of Contents

- [Install](#install)
  - [Binaries](#binaries)
  - [Completion](#completion)
  - [Checkers](#checkers)
- [Key Bindings](#key-bindings)
  - [REPL](#repl)
  - [Navigation](#navigation)
  - [Refactor](#refactor)
  - [Documentation](#documentation)
  - [Backend](#backend)

## Install

Add the `+lang/haskell` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+lang/haskell'
  " ...
endfunction
```

The available backends are:

- `lsp`
- `ghc-mod`
- `intero` (default)
- `both`

You can change it to `intero` etc with `let g:spHaskellBackend 'intero'` in your `UserInit`. The backend called `both` will try to enable both `intero` and `ghc-mod` in a compatible way.

To enable type info on hover (i.e. holding the cursor for ~1 second), put `let g:spHaskellTypeOnHover = 1` in your `UserInit`.

### Binaries

To utilize this layer you need `ghc-mod`, `hlint` and `apply-refact` on your path. This can be done with,

```bash
$ stack install ghcid hlint
```

### Indentation

You can configure the indentation by setting `g:sp_haskell_indentation` in your user-init block (i.e. before loading the plugin). By default it is set to `2`.

### Completion

By default `g:necoghc_enable_detailed_browse` is enabled. It can be disabled by setting `g:sp_necoghc_enable_detailed_browse` to either 1 or 0.

### Checkers

By default `g:neomake_haskell_enabled_makers` is set to use all makers. This can be overwritten by setting the desired makers with `g:sp_neomake_haskell_enabled_makers`.

## Key Bindings

| Key Binding | Description |
| ----------- | ----------- |
| SPC m d     | Ghcid       |

### REPL

With `ghc-mod` backend enabled,

| Key Binding | Description                     |
| ----------- | ------------------------------- |
| SPC m s b   | Load current buffer into repl   |
| SPC m s S   | Jump to repl                    |
| SPC m s s   | Open repl                       |
| SPC m s H   | Hide repl                       |
| SPC m s r   | Reload the repl                 |
| SPC m s e   | Evaluate expression in the repl |

With `intero` backend enabled,

| Key Binding | Description                   |
| ----------- | ----------------------------- |
| SPC m s b   | Load current buffer into repl |
| SPC m s S   | Jump to repl                  |
| SPC m s s   | Open repl                     |
| SPC m s H   | Hide repl                     |
| SPC m s r   | Reload the repl               |

### Navigation

With `intero` or `lsp` backend enabled,

| Key Binding | Description      |
| ----------- | ---------------- |
| SPC m g g   | Go to definition |

### Refactor

| Key Binding | Description                              |
| ----------- | ---------------------------------------- |
| SPC m r r   | Apply Hlint refector suggestion at point |
| SPC m r b   | Apply all Hlint refactor suggestions     |

Additionally some commands depend on the backend. With `ghc-mod`,

| Key Binding | Description                                                |
| ----------- | ---------------------------------------------------------- |
| SPC m r f   | Split the function case by examining a type's constructors |
| SPC m r g   | Insert initial code from the given signature               |
| SPC m r e   | You can see the expansion of splices                       |

Additionally some commands depend on the backend. With `lsp`,

| Key Binding | Description                      |
| ----------- | -------------------------------- |
| SPC m r R   | Rename the item under the cursor |

### Documentation

| Key Binding | Description                             |
| ----------- | --------------------------------------- |
| SPC m h h   | Start a Hoogle search query             |
| SPC m h H   | Start a Hoogle search query with --info |
| SPC m h C   | Close Hoogle window                     |

Additionally some commands depend on the backend. With `ghc-mod`,

| Key Binding | Description                                                  |
| ----------- | ------------------------------------------------------------ |
| SPC m h t   | Display the type of the identifier under the cursor          |
| SPC m h i   | Display the info of the identifier under the cursor          |
| SPC m h T   | Insert the type signature of the identifier under the cursor |
| SPC m h c   | Clear ghc-mod type highlights                                |

With `intero`,

| Key Binding | Description                                                  |
| ----------- | ------------------------------------------------------------ |
| SPC m h t   | Display the type of the identifier under the cursor          |
| SPC m h g   | Display the generic type of the identifier under the cursor  |
| SPC m h T   | Insert the type signature of the identifier under the cursor |

### Backend

With `ghc-mod` backend enabled,

| Key Binding | Description             |
| ----------- | ----------------------- |
| SPC m i c   | Check file with ghc-mod |

With `intero` backend enabled,

| Key Binding | Description        |
| ----------- | ------------------ |
| SPC m i d   | Reload intero      |
| SPC m i k   | Destroy intero     |
| SPC m i r   | Start intero       |
| SPC m i t   | Set intero targets |
