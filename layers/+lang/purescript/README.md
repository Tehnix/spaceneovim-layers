# PureScript Layer
This layer provides support for the PureScript language with the following packages:

- [`neoclide/coc.nvim`](https://github.com/neoclide/coc.nvim)

#### Table of Contents
- [Install](#install)
  - [Binaries](#binaries)
  - [Indentation](#indentation)
- [Language Server](#language-server)
- [Key Bindings](#key-bindings)

## Install
Add the `+lang/purescript` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+lang/purescript'
  " ...
endfunction
```

### Binaries
Install the language server with `npm i -g purescript-language-server`.

### Indentation
You can configure the indentation by setting `g:sp_purescript_indentation` in your user-init block (i.e. before loading the plugin). By default it is set to `2`.

## Language Server
This layer sets up the `purescript-language-server` language server for usage with coc.nvim.

## Key Bindings
Key Binding | Description
----------- | ---------------------------
            |

