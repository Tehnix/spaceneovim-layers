# Git Layer

This layer provides common functionality for git.

- [Install](#install)
- [Key Bindings](#key-bindings)

## Description

## Install

Add the `+scm/git` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+scm/git'
  " ...
endfunction
```

## Key Bindings

Key Binding | Description
----------- | -------------------
SPC gc      | Commit a change
SPC gl      | Log latest changes
SPC gL      | Log current file
SPC gp      | Push current branch
SPC gs      | Status
