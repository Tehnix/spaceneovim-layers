# Testing Layer
This layer provides common functionality for running tests (specs) from the editor, using [`janko-m/vim-test`](https://github.com/janko-m/vim-test).

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

## Install
Add the `+specs/testing` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+specs/testing'
  " ...
endfunction
```

## Key Bindings
Key Binding | Description
----------- | ------------------------------------------------------
SPC s a     | Run all tests for the project
SPC s f     | Run tests from file
SPC s s     | Run latest test again
SPC s t     | Run nearest test
SPC s v     | Visit the test file from which you last run your tests
