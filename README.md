# SpaceNeovim Layers [![Build Status](https://travis-ci.org/Tehnix/spaceneovim-layers.svg?branch=master)](https://travis-ci.org/Tehnix/spaceneovim-layers)

Managing layers to use with [SpaceNeovim](https://github.com/Tehnix/spaceneovim).

- [Current Layers](#current-layers)
- [Adding a New Layer](#adding-a-new-layer)
  - [API](#api)
  - [Add a Keybinding](#add-a-keybinding)
  - [Adding Packages](#adding-packages)
  - [Including Files](#including-files)
- [Adding a New Language Layer](#adding-a-new-language-layer)
  - [Add a Language Keybinding](#add-a-language-keybinding)

## Current Layers

| Name                                                        | Description                                         |
| ----------------------------------------------------------- | --------------------------------------------------- |
| [+core/behavior](layers/+core/behavior)                     | Core functionality for SpaceNeovim                  |
| [+core/sensible](layers/+core/sensible)                     | Sensible default settings                           |
| [+completion/asyncomplete](layers/+completion/asyncomplete) | Auto-completion with asyncomplete                   |
| [+completion/coc](layers/+completion/coc)                   | Auto-completion with coc.nvim                       |
| [+completion/deoplete](layers/+completion/deoplete)         | Auto-completion with deoplete                       |
| [+completion/ncm2](layers/+completion/ncm2)                 | Auto-completion with NCM2                           |
| [+completion/snippets](layers/+completion/snippets)         | Snippet support                                     |
| [+checkers/ale](layers/+checkers/ale)                       | Syntax checking with Ale                            |
| [+checkers/neomake](layers/+checkers/neomake)               | Syntax checking with Neomake                        |
| [+checkers/syntastic](layers/+checkers/syntastic)           | Syntax checking with Syntastic                      |
| [+docs/dash](layers/+docs/dash)                             | Browse offline documentation with Dash              |
| [+docs/zeal](layers/+docs/zeal)                             | Browse offline documentation with Zeal              |
| [+gui/ide](layers/+gui/ide)                                 | An opinionated setup with VimR/Oni                  |
| [+nav/buffers](layers/+nav/buffers)                         | Common buffer functionality                         |
| [+nav/comments](layers/+nav/comments)                       | Manipulating comments                               |
| [+nav/files](layers/+nav/files)                             | Common file operations                              |
| [+nav/fuzzy](layers/+nav/fuzzy)                             | Fuzzy search for files, buffers and methods         |
| [+nav/fzf](layers/+nav/fzf)                                 | Fuzzy search using FZF                              |
| [+nav/jump](layers/+nav/jump)                               | Easy navigation inside files                        |
| [+nav/navigation](layers/+nav/navigation)                   | Easy navigation on screen                           |
| [+nav/quit](layers/+nav/quit)                               | Common quit functionality                           |
| [+nav/start-screen](layers/+nav/start-screen)               | Add start screen when opening Neovim                |
| [+nav/text](layers/+nav/text)                               | Common text operations                              |
| [+nav/tmux](layers/+nav/tmux)                               | Navigate between VIM and TMUX panes                 |
| [+nav/windows](layers/+nav/windows)                         | Common window functionality                         |
| [+scm/git](layers/+scm/git)                                 | Git and fugitive support                            |
| [+specs/testing](layers/+specs/testing)                     | Run tests directly from the editor                  |
| [+tools/format](layers/+tools/format)                       | Format files                                        |
| [+tools/language-server](layers/+tools/language-server)     | Language server support                             |
| [+tools/multicursor](layers/+tools/multicursor)             | Support for multiple cursors                        |
| [+tools/terminal](layers/+tools/terminal)                   | Defaults and keybindings for the terminal           |
| [+ui/airline](layers/+ui/airline)                           | Replace the status bar with airline                 |
| [+ui/dynamic-cursor](layers/+ui/dynamic-cursor)             | Dynamically change the cursor depending on the mode |
| [+ui/toggles](layers/+ui/toggles)                           | Toggles for common components                       |

Language layers

| Name                                        | Description                                 |
| ------------------------------------------- | ------------------------------------------- |
| [+lang/-example](layers/+lang/-example)     | A template for creating new language layers |
| [+lang/elm](layers/+lang/elm)               | Support for Elm                             |
| [+lang/haskell](layers/+lang/haskell)       | Support for Haskell                         |
| [+lang/javascript](layers/+lang/javascript) | Support for JavaScript                      |
| [+lang/python](layers/+lang/python)         | Support for python                          |
| [+lang/ruby](layers/+lang/ruby)             | Support for ruby                            |
| [+lang/vim](layers/+lang/vim)               | Support for vim                             |

## Adding a New Layer

A layer consists of, as minimum:

- a `README.md` describing the layer (configuration, keybindings etc),
- either a `config.vim`, adding the layer key bindings, or
- a `packages.vim`, adding the packages that needs to be installed
- optionally, if a `func.vim` is present, it is loaded first (define commands and helper functions in this to keep things clean)

These files are grouped under a `+category/layer-name` directory hierarchy. As an example, the layer `buffers` is located under the group `+nav` (short for navigation).

A layer is only ever run if it is enabled, so there is no need to check for it. However, if you want to check if another layer is enabled, before doing anything, it can be done with,

```viml
if SpaceNeovimIsLayerEnabled('+checkers/neomake')
  " Make specific configuration for neomake here...
endif
```

This can especially be useful in the `+lang` layers, to add information to checkers and completions.

### API

The API available to layers are (`<arg>` are required, `[arg]` are optional), for keybindings,

| Command        | Arguments                                                          | Description                                                                                                                                                                                                                          | Example                                                         |
| -------------- | ------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------- |
| SpBind         | `<map>`, `<binding>`, `<name>`, `<value>`, `<isCmd>`               | Map a key to a specific mapping type, with a description and command to execute. The `<isCmd>` argument adds `<CR>` on the end if `1` and nothing if `0`.                                                                            | `SpBind 'tmap', 'wj', 'window-down', 'wincmd j', 1`             |
| SpMap          | `<binding>`, `<name>`, `<value>`, `[isCmd]`                        | Map a key with `map`/`noremap`, with a description and command to execute. `<isCmd>` defaults to `1` (i.e. adds `<CR>`).                                                                                                             | `SpMap 'wk', 'window-up', 'wincmd k'`                           |
| SpMap          | `<binding>`, `<name>`, `<value>`, `[isCmd]`                        | Map a key with `nmap`/`nnoremap`, with a description and command to execute. `<isCmd>` defaults to `1` (i.e. adds `<CR>`).                                                                                                           | `SpMap 'wk', 'window-up', 'wincmd k'`                           |
| SpVMap         | `<binding>`, `<name>`, `<value>`, `[isCmd]`                        | Map a key with `vmap`/`vnoremap`, with a description and command to execute. `<isCmd>` defaults to `1` (i.e. adds `<CR>`).                                                                                                           | `SpVMap 'wk', 'window-up', 'wincmd k'`                          |
| SpFileTypeBind | `<filetype>`, `<map>`, `<binding>`, `<name>`, `<value>`, `<isCmd>` | Map a key, only shown under a specific filetype, to a specific mapping type, with a description and command to execute. The `<isCmd>` argument adds `<CR>` on the end if `1` and nothing if `0`. | `SpBind 'tmap', 'wj', 'window-down', 'wincmd j', 1`             |
| SpFileTypeMap  | `<filetype>`, `<binding>`, `<name>`, `<value>`, `[isCmd]`          | Map a key with `map`/`noremap`, only shown under a specific filetype, with a description and command to execute. `<isCmd>` defaults to `1` (i.e. adds `<CR>`).                                   | `SpFileTypeMap 'haskell', 'mgt', 'show-type-at', 'GhcModType'`  |
| SpFileTypeNMap | `<filetype>`, `<binding>`, `<name>`, `<value>`, `[isCmd]`          | Map a key with `nmap`/`nnoremap`, only shown under a specific filetype, with a description and command to execute. `<isCmd>` defaults to `1` (i.e. adds `<CR>`).                                 | `SpFileTypeNMap 'haskell', 'mgt', 'show-type-at', 'GhcModType'` |

And the API for various helper functions,

| Command       | Arguments                         | Description                                                                       | Example                                                                                                |
| ------------- | --------------------------------- | --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| SpAddPlugin   | `<PluginName>`, `[Configuration]` | Adds a plugin to load with `vim-plug` optionally with a `vim-plug` configuration. | `SpAddPlugin 'Shougo/vimproc.vim', { 'for': 'haskell', 'do' : 'make' }`                                |
| SpSpaceIndent | `<filetype>`, `<indentation>`     | Set the amount of spaces a certain filetype is indented.                          | `SpSpaceIndent 'haskell', 2`                                                                           |
| SpTabsIndent  | `<filetype>`, `<indentation>`     | Set the amount of tabs a certain filetype is indented.                            | `SpTabsIndent 'go', 8`                                                                                 |
| SpLoadFunc    | `<path-to-script>`, `<file-name>` | Load (source) a file into Vim.                                                    | `SpLoadFunc expand('<sfile>:p') 'other-file.vim'`' for loading 'other-file.vim' in the layer directory |

### Add a Keybinding

To add a keybinding, first make sure that the vim-leader-guide grouping exists with

```viml
" Top level grouping (i.e. SPC e)
let g:lmap.e = get(g:lmap, 'e', { 'name': 'errors' })
" Deeper level Grouping under SPC e m
let g:lmap.e.m = get(g:lmap.e, 'm', { 'name': 'more' })
```

**NOTE:** It is important to use `get()` to avoid overwriting the mapping if it exists in another layer already.

**ANOTHER NOTE:** if you are adding a new language, you don't have to add the grouping, since `let g:lmap.m = { 'name': 'major-mode-cmd' }` already exists.

The `e` in `g:lmap.e` denotes the key that the group is under. Then add your keybinding by using `SpBind` or the shorter `SpMap`/`SpMap`,

```viml
SpBind 'map', 'eC', 'neomake-check-file', 'Neomake', 1
" Is equivalent to,
SpMap 'eC', 'neomake-check-file', 'Neomake'

SpBind 'nmap', 'eC', 'neomake-check-file', 'Neomake', 0
" Is equivalent to (default value is `1`, so we explicitly say `0` to not automatically add `<CR>` behind),
SpMap 'eC', 'neomake-check-file', 'Neomake', 0
```

which puts the keybinding at `SPC e l`. Note that the first `e` in `el` is necessary to put it under the `e` grouping.

For more check out the `+nav/buffers` layer for an example of usage, and `keybinding-helpers.vim` for the helper functions.

### Adding Packages

This time we use `SpAddPlugin` to add the plugin and its vim-plug configuration,

```viml
SpAddPlugin 'neomake/neomake'
SpAddPlugin 'Shougo/vimproc.vim', { 'for': 'haskell', 'do' : 'make' }
```

which will add the package 'neomake/neomake' to be installed with the configuration `{}` (default value), and 'Shougo/vimproc.vim' with the more complex configuration `{ 'for': 'haskell', 'do' : 'make' }`. The configuration can be used for post-installation commands or to lazy-load the plugin (e.g. only loading a language plugin when that language filetype is active).

### Including Files

To keep the files a bit more clean, your functions should reside in separate files, such as `func.vim`. If `func.vim` is found in your layer, it is **automaticaly included** as the first item. To easily include other files, use,

```viml
" Load `func.vim` in the current layer directory
SpLoadFunc expand('<sfile>:p')

" Load `other-file.vim` in current layer directory
SpLoadFunc expand('<sfile>:p'), 'other-file.vim'
```

The `expand('<sfile>:p')` bit is to include the path of the current layer that is calling the `SpLoadFunc` function. If no second argument is given it defaults to `func.vim`, since that is the normal convention.

For more check out the `+nav/files` layer for an example of usage, and `helpers.vim` for the helper functions.

## Adding a New Language Layer

Most of adding a new language layer is just like adding a normal layer, except for keybindings and groupings, as described below.

### Add a language keybinding

Adding a language keybinding is a bit different, since we only want it shown when the language is actually active. All language keybindings should be under `SPC m`, and if you use the helper functions, that's also where they'll go.

It consist of two combined steps:

1. Add your groupings
2. Add your mappings

**Step 1.** and **step 2.** is done using `au FileType MYFILETYPE`, for example, a snippet of the `haskell` keybindings,

```viml
au FileType haskell let g:lmap.m = { "name": "major-mode-cmd",
\"c": ["GhcModCheckAndLintAsync", "ghcmod/check"],
\"r": { "name": "haskell/refactor"
     \, "b": ["call ApplyAllSuggestion()", "hlint/refactor-buffer"]
     \, "r": ["all ApplyOneSuggestion()", "hlint/refactor-at-point"]
  \ },
\"h": { "name": "haskell/documentation"
     \, "h": ["SpaceNeovimHaskellHoogle", "search-hoogle"]
     \, "t": ["GhcModType", "ghcmod/type-at"]
     \, "i": ["GhcModInfo", "ghcmod/info"]
  \ },
\}
```

We simply construct a new dictionary mapping for `g:lmap.m` which is only valid under our filetype, and contains the commands we want to bind. A `"name": "haskell/grouping"` defines a simple grouping and a `["GhcModCheckAndLintAsync", "ghcmod/check"]` defines a command and description respectively.

Note: The reason it's defined under a filetype in this tedious way, is so that we get unique mappings for each filetype and that the change happens automatically.

For more check out the `+lang/haskell` layer for an example of usage, and `bindings.vim` for the helper functions.

## Pre-commit linting

It is recommended to add the following to `.git/hooks/pre-commit`,

```bash
# Get the current dir
startDir=$(pwd)
# Get the project root
rootDir=$(git rev-parse --show-toplevel)

cd $rootDir

# Run vint
vint auto-layers.vim keybinding-helpers.vim helpers.vim
```
