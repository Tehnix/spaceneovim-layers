# Tmux Layer
This layer provides extra functionality for running VIM inside tmux, using

- [`christoomey/vim-tmux-navigator`](https://github.com/christoomey/vim-tmux-navigator)

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

## Install
Add the `+nav/tmux` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+nav/tmux'
  " ...
endfunction
```

## Key Bindings
Key Binding | Description
----------- | ---------------------------
CTRL + h    | Switch to pane on the left
CTRL + j    | Switch to pane below
CTRL + k    | Switch to pane above
CTRL + l    | Switch to pane on the right
