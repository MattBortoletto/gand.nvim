local M = {}

local defaults = {
  variant = "dark",
  palette = {},
  transparent = false,
  bold = true,
  italic = true,
  dim_inactive = false,
  styles = {
    comments = { italic = true },
    keywords = {},
  },
  diagnostics = { style = "underline" },
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
  local next_config = vim.tbl_deep_extend("force", vim.deepcopy(defaults), opts or {})
  if next_config.variant ~= "dark" and next_config.variant ~= "light" then
    error("gand: variant must be 'dark' or 'light'")
  end
  local style = next_config.diagnostics.style
  if style ~= "underline" and style ~= "background" and style ~= "text" then
    error("gand: diagnostics.style must be 'underline', 'background', or 'text'")
  end
  config = next_config
end

function M.load()
  local c = require("gand.palette").get(config.palette, config.variant)
  local groups = require("gand.highlights").get(c, config)
  for name in pairs(defaults.integrations) do
    if config.integrations[name] then
      groups = vim.tbl_extend("force", groups, require("gand.integrations." .. name).get(c))
    end
  end

  -- Global switches also cover plugin integrations and per-group styles.
  for _, opts in pairs(groups) do
    if not config.bold then
      opts.bold = nil
    end
    if not config.italic then
      opts.italic = nil
    end
  end

  vim.o.termguicolors = true
  vim.o.background = config.variant
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
