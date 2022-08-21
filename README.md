# adjust-indent.nvim
A neovim plugin to adjust indent type automatically.

## Features
This plugin adjusts `expandtab` and `shiftwidth` as suggested by buffer.

If there is a line beginning with spaces, set `expandtab` as `true` and set `shiftwidth` as the number of spaces.
If there is a line beginnign with tab, set `expandtab` as `false`.
Otherwise, do nothing.

## Requirements
This plugin (may) only works in Neovim 0.7 or newer.

## Installation
Using packer:

```lua
use {'sinotca529/adjust-indent.nvim'}
require('adjust-indent').setup()
```

