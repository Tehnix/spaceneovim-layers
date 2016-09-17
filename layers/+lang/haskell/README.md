# Haskell Layer

## Table of contents

* [Description](#description)
* [Install](#install)
  * [Layer](#layer)
* [Key Bindings](#key-bindings)


## Description

This layer provides support for the Haskell language with the following packages:

* `neovimhaskell/haskell-vim`
* `mpickering/hlint-refactor-vim`
* `Twinside/vim-hoogle`
* `bitc/vim-hdevtools`
* `eagletmt/neco-ghc`
* `parsonsmatt/intero-neovim`


## Install

### Layer

To use this configuration layer, add it to your `./config/nvim/init.vim`. You will need to add `+lang/haskell` to the existing dotspacevim_configuration_layers list in this file.


## Key Bindings

### HLint refactor

| Key Binding | Description                            |
|-------------|----------------------------------------|
| SPC m r a   | Hlint refector: Apply one suggestion   |
| SPC m r A   | Hlint refector: Apply all suggestions  |


### Documentation

| Key Binding | Description                            |
|-------------|----------------------------------------|
| SPC m d h   | Run hoogle query                       |
| SPC m d c   | Close hoogle window                    |
