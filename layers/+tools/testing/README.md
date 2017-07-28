# Testing Layer

## Table of contents

* [Description](#description)
* [Install](#install)
  * [Layer](#layer)
* [Key Bindings](#key-bindings)

## Description

This layer provides common functionality for running tests (specs) from the editor.

## Install

### Layer

To use this configuration layer, add it to your `./config/nvim/init.vim`. You will need to add `+tools/testing` to the existing dotspaceneovim_configuration_layers list in this file.

## Key Bindings

| Key Binding | Description                                            |
|-------------|--------------------------------------------------------|
| SPC s a     | Run all tests for the project                          |
| SPC s f     | Run tests from file                                    |
| SPC s s     | Run latest test again                                  |
| SPC s t     | Run nearest test                                       |
| SPC s v     | Visit the test file from which you last run your tests |
