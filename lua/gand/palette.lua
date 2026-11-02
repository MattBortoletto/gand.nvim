-- All Gand colors live here. Return a fresh palette for each load so overrides
-- never mutate the defaults. Future variants can be selected here.
local M = {}

local colors = {
  bg = "#191C20", -- Deepstone
  surface = "#252A2E", -- Iron
  select = "#343D42",
  border = "#3F4649", -- Granite
  fg = "#DAD3C2", -- Parchment
  muted = "#92928C", -- Ash
  gold = "#E0B567", -- Dwarven Gold
  copper = "#C98759", -- Forge Copper
  rune = "#83C0B6", -- Runestone
  green = "#A1BD88", -- Moss
  purple = "#B29ACB", -- Amethyst
  red = "#D47E78", -- Ember
  blue = "#91ADD0", -- Tempered Steel
  diff_add = "#29382F",
  diff_change = "#383326",
  diff_delete = "#402C2B",
  diff_text = "#54452C",
  bright = "#F2EADB",
}

function M.get(overrides)
  return vim.tbl_extend("force", {}, colors, overrides or {})
end

return M
