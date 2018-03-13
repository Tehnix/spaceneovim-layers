# IDE Layer
This layer is an opinionated setup that works nicely with the [Vimr](https://github.com/qvacua/vimr) and [Oni](https://www.onivim.io) editors for Neovim.

This layer attempts to bring in some common functionality found in most editors. Many people use different editors for different jobs, depending on the language support in the respective editors. While VimR is macOS only, Oni is cross-platform. That said, these bindings have been set up mainly with macOS in mind, but any additions to improve them on Linux and Windows are more than welcome.

#### Table of Contents
- [Install](#install)
- [Functionality](#functionality)
- [Key Bindings](#key-bindings)

## Install
Add the `+gui/ide` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+gui/ide'
  " ...
endfunction
```

## Functionality
GUIs mostly use tabs for the tabline, and as such we will be using tabs a lot, while still making it easy to use buffers inside the tab pages. This will bring a mix of both strengths from modern editors and Neovim. You will want to decide on a case-by-case basis if you want to open a file in a buffer or tab.

- In _CtrlP_ you can use `Ctrl-t` to open a file in a tab, else it'll open in the current buffer.
- In _NERDTree_ you can use `t` to open the file in a tab, else it'll open in the current buffer.

A recommendation is to open the files you switch back to often in a tab, and open quick one-offs in the current buffer.

Out of the box, Neovim has a horrible setup for a file explorer experience that you find in most editors nowadays. This layer attempts to bring some of this functionality into SpaceNeovim by contorting NERDTree a bit.

An overview of functionality with configuration can be seen here:

<table>
  <thead><th>Config</th><th>Default</th><th>Autocommand</th></thead>
  <tbody>
    <!-- spIdeUseTabs -->
    <tr>
      <td><code>g:spIdeUseTabs</code></td>
      <td><code>1</code></td>
      <td>N/A</td>
    </tr>
    <tr>
      <td colspan="3">
        Set up the keybindings to work on tabs, instead of buffers (such as <code>CMD+n</code> opening a new tab).
      </td>
    </tr>
    <!-- spIdeOpenNERDTree -->
    <tr>
      <td><code>g:spIdeOpenNERDTree</code></td>
      <td><code>1</code></td>
      <td><code>VimEnter + TabNew</code></td>
    </tr>
    <tr>
      <td colspan="3">
        NERDTree will open the file browser on startup, and when opening a new tab (relies on <code>g:spIdeUseTabs = 1</code>), to mimic having a consistent file explorer in the side.
      </td>
    </tr>
    <!-- spIdeSyncNERDTreeAutomatically -->
    <tr>
      <td><code>g:spIdeSyncNERDTreeAutomatically</code></td>
      <td><code>1</code></td>
      <td><code>BufEnter</code></td>
    </tr>
    <tr>
      <td colspan="3">
        Automatically synchronize NERDTree to be the root of the project you are working in.
      </td>
    </tr>
    <!-- spIdeFindFileNERDTreeAutomatically -->
    <tr>
      <td><code>g:spIdeFindFileNERDTreeAutomatically</code></td>
      <td><code>1</code></td>
      <td><code>BufEnter</code></td>
    </tr>
    <tr>
      <td colspan="3">
        Automatically locate the currently open file in the NERDTree file tree.
      </td>
    </tr>
    <!-- spIdeOpenBufferWhenNERDTreeIsLast -->
    <tr>
      <td><code>g:spIdeOpenBufferWhenNERDTreeIsLast</code></td>
      <td><code>0</code></td>
      <td><code>BufEnter</code></td>
    </tr>
    <tr>
      <td colspan="3">
        If NERDTree is the only window left, open a new buffer in a split on the left side.
      </td>
    </tr>
    <!-- spIdeCloseNERDTreeIfIsLast -->
    <tr>
      <td><code>g:spIdeCloseNERDTreeIfIsLast</code></td>
      <td><code>0</code></td>
      <td><code>BufEnter</code></td>
    </tr>
    <tr>
      <td colspan="3">
        Close NERDTree if it's the last open window in the tab page, but not the last tab open.
      </td>
    </tr>
    <!-- spIdeUseTabsInCtrlP -->
    <tr>
      <td><code>g:spIdeUseTabsInCtrlP</code></td>
      <td><code>0</code></td>
      <td>N/A</td>
    </tr>
    <tr>
      <td colspan="3">
        Make <i>CtrlP</i> open files in a new tab, on return and mouse-click.
      </td>
    </tr>
  </tbody>
</table>


## Key Bindings
Key Binding | Description
----------- | -------------------------------
Cmd p       | Open `CtrlP`
Cmd s       | Save file (with `:w`)
Cmd w       | Close the current tab/buffer
Cmd q       | Quit the buffer/window/file (with `:q`)
Cmd z       | Undo
Cmd Shift z | Redo
Cmd n       | Open new tab/buffer
Cmd [1-9]   | Switch to tab/buffer at location _n_ (1 to 9)
