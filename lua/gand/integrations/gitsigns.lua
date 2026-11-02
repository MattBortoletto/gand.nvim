local M = {}

function M.get(c)
  local groups = {}

  groups["GitSignsAdd"] = { fg = c.green }
  groups["GitSignsChange"] = { fg = c.gold }
  groups["GitSignsDelete"] = { fg = c.red }

  return groups
end

return M
