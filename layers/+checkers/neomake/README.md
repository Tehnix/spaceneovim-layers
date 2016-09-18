# Neomake Syntax Checking Layer

## Table of contents

* [Description](#description)
* [Install](#install)
  * [Layer](#layer)
* [Key Bindings](#key-bindings)


## Description

This layer provides on the fly syntax checking using [Neomake](https://github.com/neomake/neomake).


## Install

### Layer

To use this configuration layer, add it to your `./config/nvim/init.vim`. You will need to add `+checkers/neomake` to the existing dotspaceneovim_configuration_layers list in this file.


## Key Bindings

| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|
| SPC e C     | Run Neomake                                                    |
| SPC e v     | Neomake version info                                           |
| SPC e l     | Open the Neomake error list (loclist)                          |
| SPC e c     | Close the Neomake error list (loclist)                         |
| SPC e n     | Jump to next Neomake error                                     |
| SPC e p     | Jump to previous Neomake error                                 |
| SPC e L     | Open the Quickfix error list                                   |
| SPC e N     | Jump to next Quickfix error                                    |
| SPC e P     | Jump to previous Quickfix error                                |
