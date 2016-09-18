# Syntastic Syntax Checking Layer

## Table of contents

* [Description](#description)
* [Install](#install)
  * [Layer](#layer)
* [Key Bindings](#key-bindings)

## Description

This layer provides on the fly syntax checking using [Syntastc](https://github.com/scrooloose/syntastc).

## Install

### Layer

To use this configuration layer, add it to your `./config/nvim/init.vim`. You will need to add `+checkers/syntastc` to the existing dotspaceneovim_configuration_layers list in this file.

By default it will populate the loclist. For performance reasons aggregate errors and checking on open is disabled (since it runs synchronously).

## Key Bindings

| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|
| SPC e r     | Run Syntastic                                                  |
| SPC e v     | Syntastic version info                                         |
| SPC e l     | Open the Syntastic error list (loclist)                        |
| SPC e c     | Close the Syntastic error list (loclist)                       |
| SPC e n     | Jump to next Syntastic error                                   |
| SPC e p     | Jump to previous Syntastic error                               |
| SPC e L     | Open the Quickfix error list                                   |
| SPC e C     | Close the Quickfix error list                                  |
| SPC e N     | Jump to next Quickfix error                                    |
| SPC e P     | Jump to previous Quickfix error                                |
