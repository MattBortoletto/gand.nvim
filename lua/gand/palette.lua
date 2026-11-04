-- All Gand colors live here. Return a fresh palette for each load so overrides
-- never mutate the defaults. Extras use the dark palette unless specified.
local M = {}

local dark = {
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

local light = {
  bg = "#F3ECDD", -- Parchment
  surface = "#E8DFCE", -- Warm stone
  select = "#D9CEB8",
  border = "#A79D8B", -- Weathered granite
  fg = "#343A3D", -- Deepstone ink
  muted = "#69675E", -- Ash
  gold = "#815611", -- Dwarven Gold
  copper = "#914C2E", -- Forge Copper
  rune = "#286B63", -- Runestone
  green = "#4D6C37", -- Moss
  purple = "#76528D", -- Amethyst
  red = "#A33F3B", -- Ember
  blue = "#3E628F", -- Tempered Steel
  diff_add = "#DDE5CF",
  diff_change = "#EAE0C6",
  diff_delete = "#EED7D0",
  diff_text = "#D9C697",
  bright = "#1F2529",
}

function M.get(overrides, variant)
  variant = variant or "dark"
  assert(variant == "dark" or variant == "light", "gand: variant must be 'dark' or 'light'")
  return vim.tbl_extend("force", {}, variant == "light" and light or dark, overrides or {})
end

return M
