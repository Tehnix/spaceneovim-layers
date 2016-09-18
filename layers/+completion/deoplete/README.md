# Syntax Checking Layer

## Table of contents

* [Description](#description)
* [Install](#install)
  * [Layer](#layer)
* [Key Bindings](#key-bindings)


## Description

This layer provides on the fly syntax checking using [Neomake](https://github.com/neomake/neomake).


## Install

### Layer

To use this configuration layer, add it to your `./config/nvim/init.vim`. You will need to add `+checkers/syntax-checking` to the existing dotspaceneovim_configuration_layers list in this file.


## Key Bindings

| Key Binding | Description |
|-------------|-------------|
| SPC e l     | Run Neomake |
