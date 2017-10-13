# Vim Layer

This layer provides support for the vim language, viml.

- [Install](#install)

  - [Binaries](#binaries)
  - [Indentation](#indentation)
  - [Checkers](#checkers)

## Install

Add the `+lang/ruby` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+lang/ruby'
  " ...
endfunction
```

### Binaries

To utilize this layer you need `vim-vint` on your path. This can be done with,

```bash
$ pip install vim-vint
```

### Indentation

You can configure the indentation by setting `g:sp_vim_indentation` in your user-init block (i.e. before loading the plugin). By default it is set to `2`.

### Checkers

By default `g:neomake_vim_enabled_makers` is set to use all makers. This can be overwritten by setting the desired makers with `g:sp_neomake_vim_enabled_makers`.
