# SpaceNeovim Layers

Managing layers to use with [SpaceNeovim](https://github.com/Tehnix/spaceneovim).

* [Current Layers](#current-layers)
* [Adding a New Layer](#adding-a-new-layer)
  * [Add a keybinding](#add-a-keybinding)
  * [Adding Packages](#adding-packages)


## Current Layers

| Name                      | Description                                |
|---------------------------|--------------------------------------------|
| +nav/quit                 | Common quit functionality                  |
| +nav/buffers              | Common buffer functionality                |
| +nav/windows              | Common window functionality                |
| +nav/text                 | Common text operations                     |
| +nav/start-screen         | Add start screen when opening Neovim       |
| +checkers/syntax-checking | Syntax checking with Neomake               |


## Adding a New Layer

A layer consists of, as minimum:

* `README.md` describing the layer (configuration, keybindings etc)
* `config.vim` adding the layer key bindings
* `packages.vim` adding the packages that needs to be installed

These files are grouped under a `+category/layer-name` directory hierachy. As an example, the layer `buffers` is located under the group `+nav` (short for navigation).

In the `config.vim` and `packages.vim` you want to check if the layer is enabled, before doing anything. This can be done with,

```viml
if spacevim#is_layer_enabled('+checkers/syntax-checking')
  " Configuration/Package setup goes here...
endif
```

### Add a Keybinding

To add a keybinding, first make sure that the vim-leader-guide grouping exists with

```viml
let g:lmap.e = { 'name': '+syntax-checking' }
```

The `e` in `g:lmap.e` denotes the key that the group is under. Then add your keybinding by using `spacevim#bind`,

```viml
call spacevim#bind('map', 'el', 'lint-file', 'Neomake!', 1)
```

which puts the keybinding at `SPC e l`. Note that the first `e` in `el` is necessary to put it under the `e` grouping.


### Adding Packages

This time we use `spacevim#add_plugin` to add the plugin and its vim-plug configuration,

```viml
call spacevim#add_plugin('neomake/neomake', {})
```

which will add the package 'neomake/neomake' to be installed with the configuration `{}`. The configuration can be used for post-installation commands or to lazy-load the plugin (e.g. only loading a language plugin when that language filetype is active).
