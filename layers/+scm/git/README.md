# Git Layer
This layer provides common functionality for git, using

- [`airblade/vim-gitgutter`](https://github.com/airblade/vim-gitgutter)
- [`junegunn/gv.vim`](https://github.com/junegunn/gv.vim) (only when the `'+nav/fzf'` layer is not enabled)
- [`tpope/vim-fugitive`](https://github.com/tpope/vim-fugitive)

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

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
