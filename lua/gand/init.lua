local M = {}

local defaults = {
  palette = {},
  integrations = {
    snacks = true,
    blink = true,
    gitsigns = true,
    ["which-key"] = true,
    ["indent-blankline"] = true,
    flash = true,
  },
}

local config = vim.deepcopy(defaults)

-- Call before :colorscheme gand. Setup only stores options; load applies them.
function M.setup(opts)
  config = vim.tbl_deep_extend("force", vim.deepcopy(defaults), opts or {})
end

function M.load()
  local c = require("gand.palette").get(config.palette)
  local groups = require("gand.highlights").get(c)
  for name in pairs(defaults.integrations) do
    if config.integrations[name] then
      groups = vim.tbl_extend("force", groups, require("gand.integrations." .. name).get(c))
    end
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "gand"

  for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  local terminal = {
    c.bg, c.red, c.green, c.gold, c.blue, c.purple, c.rune, c.fg,
    c.muted, c.red, c.green, c.gold, c.blue, c.purple, c.rune, c.bright,
  }
  for i, color in ipairs(terminal) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

return M
