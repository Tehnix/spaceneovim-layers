# buffers Layer

## Table of contents

* [Description](#description)
* [Install](#install)
  * [Layer](#layer)
* [Key Bindings](#key-bindings)


## Description

This layer provides common functionality for buffers.


## Install

### Layer

To use this configuration layer, add it to your `./config/nvim/init.vim`. You will need to add `+nav/buffers` to the existing dotspacevim_configuration_layers list in this file.


## Key Bindings

| Key Binding | Description                            |
|-------------|----------------------------------------|
| SPC b N     | Open new empty buffer                  |
| SPC b V     | Open new empty buffer to the left      |
| SPC b d     | Kill the current buffer                |
| SPC b D     | Force kill the current buffer          |
| SPC b n     | Go to next buffer                      |
| SPC b p     | Go to previous buffer                  |
| SPC b l     | List all buffers                       |
| SPC b F     | Open first buffer                      |
| SPC b L     | Open last buffer                       |
| SPC b h     | Open start screen                      |
| SPC b C     | Copy whole contents of the buffer      |
| SPC b f     | Reveal the current directory in Finder |
