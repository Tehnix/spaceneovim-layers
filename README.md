# SpaceNeovim Layers [![Build Status](https://travis-ci.org/Tehnix/spaceneovim-layers.svg?branch=master)](https://travis-ci.org/Tehnix/spaceneovim-layers)

Managing layers to use with [SpaceNeovim](https://github.com/Tehnix/spaceneovim).

* [Current Layers](#current-layers)
* [Adding a New Layer](#adding-a-new-layer)
  * [Add a Keybinding](#add-a-keybinding)
  * [Adding Packages](#adding-packages)
  * [Including Files (e.g. func.vim)](#including-files)
* [Adding a New Language Layer](#adding-a-new-language-layer)
  * [Add a Language Keybinding](#add-a-language-keybinding)

## Current Layers

| Name                      | Description                                |
|---------------------------|--------------------------------------------|
| +checkers/neomake         | Syntax checking with Neomake               |
| +completion/deoplete      | Auto-completion with deoplete              |
| +nav/buffers              | Common buffer functionality                |
| +nav/files                | Common file operations                     |
| +nav/quit                 | Common quit functionality                  |
| +nav/start-screen         | Add start screen when opening Neovim       |
| +nav/text                 | Common text operations                     |
| +nav/windows              | Common window functionality                |
| +tools/terminal           | Defaults and keybindings for the terminal  |
| +ui/airline               | Replace the status bar with airline        |
| +ui/toggles               | Toggles for common components              |
| +lang/haskell             | Support for the Haskell language           |

## Adding a New Layer

A layer consists of, as minimum:

* `README.md` describing the layer (configuration, keybindings etc)
* `config.vim` adding the layer key bindings
* `packages.vim` adding the packages that needs to be installed

These files are grouped under a `+category/layer-name` directory hierachy. As an example, the layer `buffers` is located under the group `+nav` (short for navigation).

A layer is only ever run if it is enabled, so there is no need to check for it. However, if you want to check if another layer is enabled, before doing anything, it can be done with,

```viml
if SpaceNeovimIsLayerEnabled('+checkers/neomake')
  " Make specific configuration for neomake here...
endif
```

This can especially be useful in the `+lang` layers, to add information to checkers and completions.

### Add a Keybinding

To add a keybinding, first make sure that the vim-leader-guide grouping exists with

```viml
let g:lmap.e = { 'name': '+errors' }
```

__NOTE:__ if you are adding a new language, you don't have to add the grouping, since `let g:lmap.m = { 'name': '+major-mode-cmd' }` already exists.

The `e` in `g:lmap.e` denotes the key that the group is under. Then add your keybinding by using `SpaceNeovimBind` or the shorter `SpaceNeovimNMap`/`SpaceNeovimMap`,

```viml
call SpaceNeovimBind('map', 'eC', 'neomake-check-file', 'Neomake', 1)
" Is equivalent to
SpaceNeovimMap('eC', 'neomake-check-file', 'Neomake')

call SpaceNeovimBind('nmap', 'eC', 'neomake-check-file', 'Neomake', 0)
" Is equivalent to
SpaceNeovimNMap('eC', 'neomake-check-file', 'Neomake', 0)
```

which puts the keybinding at `SPC e l`. Note that the first `e` in `el` is necessary to put it under the `e` grouping.

For more check out the `+nav/buffers` layer for an example of usage, and `bindings.vim` for the helper functions.

### Adding Packages

This time we use `SpaceNeovimAddPlugin` to add the plugin and its vim-plug configuration,

```viml
call SpaceNeovimAddPlugin('neomake/neomake', {})
```

which will add the package 'neomake/neomake' to be installed with the configuration `{}`. The configuration can be used for post-installation commands or to lazy-load the plugin (e.g. only loading a language plugin when that language filetype is active).

### Including Files

To keep the files a bit more clean, your functions should reside in separate files, such as `func.vim`. To easily include them use

```viml
" Load `func.vim` in the current layer directory
call SpaceNeovimLoadFunc(expand('<sfile>:p'))

" Load `other-file.vim` in current layer directory
call SpaceNeovimLoadFunc(expand('<sfile>:p'), 'other-file.vim')
```

The `expand('<sfile>:p')` bit is to include the path of the current layer that is calling the `SpaceNeovimLoadFunc` function. If no second argument is given it defaults to `func.vim`, since that is the normal convention.

For more check out the `+nav/files` layer for an example of usage, and `helpers.vim` for the helper functions.

## Adding a New Language Layer

Most of adding a new language layer is just like adding a normal layer, except for keybindings, as described below.

### Add a language keybinding

Adding a language keybinding is a bit different, since we only want it shown when the language is actually active. All language keybindings should be under `SPC m`, and if you use the helper functions, that's also where they'll go.

It consist of three steps:

1. Add your groupings
1. Add your mappings
1. Add clean up autocmd

__Step 1.__ is done using `au FileType haskell`, for example to add the group `SPC m g`, `SPC m r` and `SPC m d` when using `haskell`,

```viml
" Start by resetting the major-mode and then add the new groups
au FileType haskell let g:lmap.m = { "name": "+major-mode-cmd" }
                 \| let g:lmap.m.g = { "name": "haskell/ghc-mod" }
                 \| let g:lmap.m.r = { "name": "haskell/refactor" }
                 \| let g:lmap.m.d = { "name": "haskell/documentation" }
```

Note: you need to reset to `let g:lmap.m = { "name": "+major-mode-cmd" }` at the start, to clear any other filetype specific groupings.

Going to __step 2.__, you either use the longer `SpaceNeovimFTBind` or the wrappers `SpaceNeovimFTNMap`/`SpaceNeovimFTMap` depending on what you want, as such,

```viml
call SpaceNeovimFTNMap('haskell', 'mdh', 'search-hoogle', 'call feedkeys(":Hoogle ")')
```

Finally for __step 3.__, we call `SpaceNeovimCleanupFileTypeGroups` as such,

```viml
call SpaceNeovimCleanupFileTypeGroups('haskell')
```

Which will clear the mappings upon leaving the buffer (`BufLeave`).

For more check out the `+lang/haskell` layer for an example of usage, and `bindings.vim` for the helper functions.
