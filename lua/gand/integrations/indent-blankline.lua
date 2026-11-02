local M = {}

function M.get(c)
  local groups = {}

  groups["IblIndent"] = { fg = c.border }
  groups["IblScope"] = { fg = c.copper }

  return groups
end

return M
