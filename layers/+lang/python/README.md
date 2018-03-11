# Python Layer

This layer provides support for the python language with the following packages:

- [`zchee/deoplete-jedi`](https://github.com/zchee/deoplete-jedi)

#### Table of Contents
- [Install](#install)
  - [Binaries](#binaries)
  - [Indentation](#indentation)
  - [Checkers](#checkers)

## Install
Add the `+lang/python` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+lang/python'
  " ...
endfunction
```

### Binaries
To utilize this layer you need `flake8` on your path. This can be done with,

```bash
$ pip install flake8
```

### Indentation
You can configure the indentation by setting `g:sp_python_indentation` in your user-init block (i.e. before loading the plugin). By default it is set to `4`.

### Checkers
By default `g:neomake_python_enabled_makers` is set to use all makers. This can be overwritten by setting the desired makers with `g:sp_neomake_python_enabled_makers`.
