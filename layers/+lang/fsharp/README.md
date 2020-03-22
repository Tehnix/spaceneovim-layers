# F# Layer
This layer provides support for the F# language with the following packages:

- [`neoclide/coc.nvim`](https://github.com/neoclide/coc.nvim)

#### Table of Contents
- [Install](#install)
  - [Indentation](#indentation)
- [Language Server](#language-server)
- [Key Bindings](#key-bindings)

## Install
Add the `+lang/fsharp` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+lang/fsharp'
  " ...
endfunction
```

### Indentation
You can configure the indentation by setting `g:sp_fsharp_indentation` in your user-init block (i.e. before loading the plugin). By default it is set to `4`.

## Language Server
This layer sets up the `F# Compiler Service` language server for usage with coc.nvim.

## Key Bindings
Key Binding | Description
----------- | ---------------------------
            |

