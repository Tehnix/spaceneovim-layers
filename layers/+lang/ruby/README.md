# Ruby Layer

## Table of contents

* [Description](#description)
* [Install](#install)
  * [Layer](#layer)
* [Key Bindings](#key-bindings)

## Description

This layer provides support for the Ruby language with the following packages:

* `fishbullet/deoplete-ruby`

## Install

### Layer

To use this configuration layer, add it to your `init.vim`/`.vimrc`. You will need to add `+lang/ruby` to the existing `g:dotspaceneovim_configuration_layers` list in this file.

## Key Bindings

| Key Binding | Description                         |
|-------------|-------------------------------------|
| SPC m :     | Replace `:symbol =>` with `symbol:` |
| SPC m b     | Convert blocks                      |
| SPC m l     | Extract variable to let             |
| SPC m s     | Convert Struct to Class             |
