# Elm Layer

## Table of contents

-   [Description](#description)
-   [Install](#install)
    -   [Layer](#layer)
    -   [Checkers](#checkers)
-   [Key Bindings](#key-bindings)

## Description

This layer provides support for the Elm language with the following packages:

-   `elmcast/elm-vim`

## Install

To utilize this layer you need `elm`, `elm-test`, `elm-format` and `elm-oracle` on your path. This can be done with,

```bash
$ npm install -g elm elm-test elm-format elm-oracle
```

### Layer

To use this configuration layer, add it to your `init.vim`/`.vimrc` with `Layer '+lang/elm'`.

### Checkers

Is configured for `Neomake`, `Syntastic` and `YouCompleteMe`.

## Key Bindings

| Key Binding | Description |
| ----------- | ----------- |
