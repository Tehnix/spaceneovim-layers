# Buffers Layer

This layer provides common functionality for buffers.

- [Install](#install)

  - [Layer](#layer)

- [Key Bindings](#key-bindings)

## Install

Add the `+nav/buffers` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+nav/buffers'
  " ...
endfunction
```

## Key Bindings

Key Binding | Description
----------- | ----------------------------------------------
SPC b d     | Kill the current buffer
SPC b D     | Force kill the current buffer
SPC b o     | Kill all buffers except existing one
SPC b n     | Go to next buffer
SPC b p     | Go to previous buffer
SPC b N     | Open new empty buffer
SPC b V     | Open new empty buffer in a vertical split
SPC b l     | List all buffers
SPC b F     | Open first buffer
SPC b L     | Open last buffer
SPC b h     | Open start screen
SPC b C     | Copy whole contents of the buffer
SPC b f     | Reveal the current directory in Finder (macOS)
