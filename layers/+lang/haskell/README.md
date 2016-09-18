# Haskell Layer

## Table of contents

* [Description](#description)
* [Install](#install)
  * [Layer](#layer)
  * [Completion](#completion)
  * [Checkers](#checkers)
* [Key Bindings](#key-bindings)

## Description

This layer provides support for the Haskell language with the following packages:

* `neovimhaskell/haskell-vim`
* `mpickering/hlint-refactor-vim`
* `Twinside/vim-hoogle`
* `bitc/vim-hdevtools`
* `eagletmt/neco-ghc`

## Install

To utilize this layer you need `ghc-mod`, `hlint` and `apply-refact` on your path. This can be done with,

```bash
$ stack install apply-refact ghc-mod hlint
```

### Layer

To use this configuration layer, add it to your `./config/nvim/init.vim`. You will need to add `+lang/haskell` to the existing dotspaceneovim_configuration_layers list in this file.

### Completion

By default `g:necoghc_enable_detailed_browse` is enabled. It can be disabled by setting `g:sp_necoghc_enable_detailed_browse` to either 1 or 0.

### Checkers

By default `g:neomake_haskell_enabled_makers` is set to use all makers. This can be overwritten by setting the desired makers with `g:sp_neomake_haskell_enabled_makers`.

## Key Bindings

| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|
| SPC m g     | Run ghc-mod check and lint                                     |

### HLint refactor

| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|
| SPC m r r   | Apply Hlint refector suggestion at point                       |
| SPC m r b   | Apply all Hlint refactor suggestions                           |

### Documentation

| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|
| SPC m d h   | Start a Hoogle search query                                    |
| SPC m d H   | Start a Hoogle search query with --info                        |
| SPC m d c   | Close Hoogle window                                            |
| SPC m d t   | Show type at cursor (using hdevtools)                          |
