local M = {}

function M.get(c)
  local groups = {}

  groups["FlashLabel"] = { fg = c.bg, bg = c.gold, bold = true }

  return groups
end

return M
