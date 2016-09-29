# css Layer

## Table of contents

* [Description](#description)
* [Install](#install)
  * [Layer](#layer)
  * [Checkers](#checkers)
* [Key Bindings](#key-bindings)

## Description

This layer provides support for the css language with the following packages:

* `hail2u/vim-css3-syntax`
* `cakebaker/scss-syntax.vim`
* `groenewege/vim-less`

## Install

To utilize this layer you need `stylelint` and `sass-lint` on your path. This can be done with,

```bash
$ npm install -g stylelint sass-lint
```

### Layer

To use this configuration layer, add it to your `init.vim`/`.vimrc`. You will need to add `+lang/css` to the existing `g:dotspaceneovim_configuration_layers` list in this file.

### indentation

You can configure the indentation by setting `g:sp_css_indentation` in your user-init block (i.e. before loading the plugin). By default it is set to `2`.

### Checkers

By default `g:neomake_css_enabled_makers` is set to use all makers. This can be overwritten by setting the desired makers with `g:sp_neomake_css_enabled_makers`.

## Key Bindings

| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|

### Ghc-mod

| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|
| SPC m g c   | Check and lint with ghc-mod                                    |

### Documentation

| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|
| SPC m d h   | Start a Hoogle search query                                    |
