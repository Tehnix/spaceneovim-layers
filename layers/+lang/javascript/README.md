# JavasSript Layer
This layer provides support for the javascript language, using

- [`elzr/vim-json`](https://github.com/elzr/vim-json)
- [`mxw/vim-jsx`](https://github.com/mxw/vim-jsx)


#### Table of Contents
- [Install](#install)
  - [Configuration](#configuration)
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

### Configuration
To enable concealing of double quotes (`"`) in your JSON files, set `let g:vim_json_syntax_conceal = 2` in `UserConfig`.

### Binaries
To utilize this layer you need `eslint` on your path. This can be done with,

```bash
$ npm install -g eslint
```

### Indentation
You can configure the indentation by setting `g:sp_javascript_indentation` in your user-init block (i.e. before loading the plugin). By default it is set to `2`.

### Checkers
By default `g:neomake_javascript_enabled_makers` is set to use all makers. This can be overwritten by setting the desired makers with `g:sp_neomake_javascript_enabled_makers`.
