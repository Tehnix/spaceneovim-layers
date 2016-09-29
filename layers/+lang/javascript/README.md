# javascript Layer

## Table of contents

* [Description](#description)
* [Install](#install)
  * [Layer](#layer)
  * [Checkers](#checkers)
* [Key Bindings](#key-bindings)

## Description

This layer provides support for the javascript language with the following packages:

* `jelera/vim-javascript-syntax`

## Install

To utilize this layer you need `eslint` on your path. This can be done with,

```bash
$ npm install -g eslint
```

### Layer

To use this configuration layer, add it to your `init.vim`/`.vimrc`. You will need to add `+lang/javascript` to the existing `g:dotspaceneovim_configuration_layers` list in this file.

### indentation

You can configure the indentation by setting `g:sp_javascript_indentation` in your user-init block (i.e. before loading the plugin). By default it is set to `2`.

### Checkers

By default `g:neomake_javascript_enabled_makers` is set to use all makers. This can be overwritten by setting the desired makers with `g:sp_neomake_javascript_enabled_makers`.

## Key Bindings

| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|
