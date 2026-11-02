# 🏔️ Gand

A color palette inspired by Gand, the dwarf I played in fantasy games growing up.
Whenever a game let me play a dwarf, I played Gand.

![Gand color palette](assets/gand-palette.png)

## 📦 Installation

### lazy.nvim

Add this plugin spec to your lazy.nvim configuration:

```lua
{
  "MattBortoletto/gand.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("gand")
  end,
}
```

### LazyVim

Create `~/.config/nvim/lua/plugins/gand.lua` with:

```lua
return {
  { "MattBortoletto/gand.nvim", lazy = false, priority = 1000 },
  { "LazyVim/LazyVim", opts = { colorscheme = "gand" } },
}
```

Restart Neovim and run `:Lazy sync` to install Gand.

### Native Neovim packages

Add this to your `init.lua`:

```lua
vim.cmd.colorscheme("gand")
```

## 🍭 Extras 

More coming!
