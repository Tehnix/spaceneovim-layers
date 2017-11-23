# Comments Layer

This layer provides common functionality for manipulating comments in code, using the following packages:

- [scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)

Note: In the following inverted means that each line will be toggled instead of the default which is just to look at the first line, and then toggle the rest of the comments based on that.

--- 

- [Install](#install)

  - [Layer](#layer)

- [Key Bindings](#key-bindings)

## Install

Add the `+nav/comments` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+nav/comments'
  " ...
endfunction
```

## Key Bindings

Key Binding | Description
----------- | -------------------------------
SPC c l     | Comment or uncomment lines
SPC c L     | Comment or uncomment lines (inverted)
SPC c y     | Copy and comment lines
SPC c Y     | Copy and comment lines (inverted)
SPC c p     | Comment or uncomment paragraphs
SPC c P     | Comment or uncomment paragraphs (inverted)
