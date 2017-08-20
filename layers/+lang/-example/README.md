# Example Language Layer

## Table of contents

-   [Description](#description)
-   [Install](#install)
    -   [Layer](#layer)
    -   [Checkers](#checkers)
-   [Key Bindings](#key-bindings)

## Description

This layer provides support for the Haskell language with the following packages:

-   `neovimhaskell/haskell-vim`

## Install

To utilize this layer you need `ghc-mod`, `hlint` and `apply-refact` on your path. This can be done with,

```bash
$ stack install apply-refact ghc-mod hlint
```

### Layer

To use this configuration layer, add it to your `init.vim`/`.vimrc`. You will need to add `+lang/haskell` to the existing `g:dotspaceneovim_configuration_layers` list in this file.

### indentation

You can configure the indentation by setting `g:sp_haskell_indentation` in your user-init block (i.e. before loading the plugin). By default it is set to `2`.

### Checkers

By default `g:neomake_haskell_enabled_makers` is set to use all makers. This can be overwritten by setting the desired makers with `g:sp_neomake_haskell_enabled_makers`.

## Key Bindings

| Key Binding | Description |
| ----------- | ----------- |

### Ghc-mod

| Key Binding | Description                 |
| ----------- | --------------------------- |
| SPC m g c   | Check and lint with ghc-mod |

### Documentation

| Key Binding | Description                 |
| ----------- | --------------------------- |
| SPC m d h   | Start a Hoogle search query |
