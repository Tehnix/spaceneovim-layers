# Go Layer
This layer provides support for the Go language with the following packages:

- [`fatih/vim-go`](https://github.com/fatih/vim-go)
- [`neoclide/coc.nvim`](https://github.com/neoclide/coc.nvim)

#### Table of Contents
- [Install](#install)
  - [Binaries](#binaries)
  - [Indentation](#indentation)
- [Language Server](#language-server)
- [Key Bindings](#key-bindings)

## Install
Add the `+lang/go` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+lang/go'
  " ...
endfunction
```

### Binaries
Run `:GoInstallBinaries` to install the binaries needed for `vim-go`.


### Indentation
You can configure the indentation by setting `g:sp_go_indentation` in your user-init block (i.e. before loading the plugin). By default it is set to `4`.

## Language Server
This layer sets up the `gopls` language server for usage with coc.nvim.

## Key Bindings
Key Binding | Description
----------- | ---------------------------
            |

