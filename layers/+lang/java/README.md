# Java Layer
This layer provides support for the Java language with the following packages:

- [`neoclide/coc.nvim`](https://github.com/neoclide/coc.nvim)

#### Table of Contents
- [Install](#install)
  - [Binaries](#binaries)
  - [Indentation](#indentation)
- [Language Server](#language-server)
- [Key Bindings](#key-bindings)

## Install
Add the `+lang/java` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+lang/java'
  " ...
endfunction
```

### Binaries
The language server manages the binaries for you, but you need at least to have the JDK installed. See more info at [coc-java](https://github.com/neoclide/coc-java).

### Indentation
You can configure the indentation by setting `g:sp_java_indentation` in your user-init block (i.e. before loading the plugin). By default it is set to `4`.

## Language Server
This layer sets up the `jdt.ls` language server for usage with coc.nvim.

## Key Bindings
Key Binding | Description
----------- | ---------------------------
            |

