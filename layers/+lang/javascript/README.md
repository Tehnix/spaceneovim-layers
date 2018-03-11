# JavasSript Layer
This layer provides support for the javascript language.


#### Table of Contents
- [Install](#install)
  - [Binaries](#binaries)
  - [Indentation](#indentation)
  - [Checkers](#checkers)

## Install
Add the `+lang/javascript` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+lang/javascript'
  " ...
endfunction
```

### Binaries
To utilize this layer you need `eslint` on your path. This can be done with,

```bash
$ npm install -g eslint
```

### Indentation
You can configure the indentation by setting `g:sp_javascript_indentation` in your user-init block (i.e. before loading the plugin). By default it is set to `2`.

### Checkers
By default `g:neomake_javascript_enabled_makers` is set to use all makers. This can be overwritten by setting the desired makers with `g:sp_neomake_javascript_enabled_makers`.
