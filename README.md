# adjust-indent.nvim
A neovim plugin to adjust indent type automatically.

## Features
This plugin adjusts `expandtab` and `shiftwidth` as suggested by buffer.

If there is a line beginning with spaces, set `expandtab` as `true` and set `shiftwidth` as the number of spaces.
If there is a line beginning with tab, set `expandtab` as `false`.
Otherwise, do nothing.

## Requirements
This plugin (may) only works in Neovim 0.7 or newer.

## Installation
Using packer:

```lua
use {'sinotca529/adjust-indent.nvim'}
require('adjust-indent').setup()
```

## Settings
### Example
```lua
use {'sinotca529/adjust-indent.nvim'}
require('adjust-indent').setup({
    max_sw = 4,
})
```

### Config
#### `max_sw`
The parameter sets max `shiftwidth`.
Any lines in which the number of leading spaces is more than `max_sw` are ignored when detecting indent width.

(default is 8)

