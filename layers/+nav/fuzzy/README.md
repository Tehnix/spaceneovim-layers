# Fuzzy search Layer

## Table of contents

* [Description](#description)
* [Install](#install)
  * [Layer](#layer)
* [Key Bindings](#key-bindings)


## Description

This layer provides fuzzy search functionality for files, buffers and methods.


## Install

### Layer

To use this configuration layer, add it to your `./config/nvim/init.vim`. You will need to add `+nav/fuzzy` to the existing dotspacevim_configuration_layers list in this file.


## Key Bindings

| Key Binding | Description                            |
|-------------|----------------------------------------|
| SPC f b     | Find open buffer                       |
| SPC f f     | Find file                              |
| SPC f m     | Find method in file                    |
| SPC f M     | Find method under cursor in file       |
| SPC f r     | Find recently used file                |
