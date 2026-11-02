local M = {}

function M.get(c)
  local groups = {}

  groups["SnacksPickerDir"] = { fg = c.muted }
  groups["SnacksPickerMatch"] = { fg = c.gold, bold = true }
  groups["SnacksPickerBorder"] = { fg = c.border }
  groups["SnacksPickerTitle"] = { fg = c.gold, bold = true }
  groups["SnacksDashboardHeader"] = { fg = c.gold }
  groups["SnacksDashboardKey"] = { fg = c.copper }

  return groups
end

return M
