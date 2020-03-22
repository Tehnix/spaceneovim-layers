# Rust Layer
This layer provides support for the Rust language with the following packages:

- [`neoclide/coc.nvim`](https://github.com/neoclide/coc.nvim)

#### Table of Contents
- [Install](#install)
  - [Binaries](#binaries)
  - [Indentation](#indentation)
- [Language Server](#language-server)
- [Key Bindings](#key-bindings)

## Install
Add the `+lang/rust` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+lang/rust'
  " ...
endfunction
```

### Binaries
This assumes that you have rust installed via [rustup](https://rustup.rs). The rust-analyzer language server will take care of managing the binaries for you.

### Indentation
You can configure the indentation by setting `g:sp_rust_indentation` in your user-init block (i.e. before loading the plugin). By default it is set to `4`.

## Language Server
This layer sets up the `rust-analyzer` language server for usage with coc.nvim.

## Key Bindings
Key Binding | Description
----------- | ---------------------------
            |

