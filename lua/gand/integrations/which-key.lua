local M = {}

function M.get(c)
  local groups = {}

  groups["WhichKey"] = { fg = c.gold }
  groups["WhichKeyGroup"] = { fg = c.rune }

  return groups
end

return M
