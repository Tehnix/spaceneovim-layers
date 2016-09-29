# python Layer

## Table of contents

* [Description](#description)
* [Install](#install)
  * [Layer](#layer)
  * [Checkers](#checkers)
* [Key Bindings](#key-bindings)

## Description

This layer provides support for the python language with the following packages:

* `vim-scripts/indentpython.vim'`

## Install

To utilize this layer you need `flake8` on your path. This can be done with,

```bash
$ pip install flake8
```

### Layer

To use this configuration layer, add it to your `init.vim`/`.vimrc`. You will need to add `+lang/python` to the existing `g:dotspaceneovim_configuration_layers` list in this file.

### indentation

You can configure the indentation by setting `g:sp_python_indentation` in your user-init block (i.e. before loading the plugin). By default it is set to `4`.

### Checkers

By default `g:neomake_python_enabled_makers` is set to use all makers. This can be overwritten by setting the desired makers with `g:sp_neomake_python_enabled_makers`.

## Key Bindings

| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|
