-- Run with: nvim --headless -u NONE -i NONE -l scripts/generate-claude.lua
local script = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p")
local root = vim.fn.fnamemodify(script, ":h:h")
local c = dofile(root .. "/lua/gand/palette.lua").get()

local function blend(background, foreground, amount)
  local channels = {}
  for offset = 2, 6, 2 do
    local a = tonumber(background:sub(offset, offset + 1), 16)
    local b = tonumber(foreground:sub(offset, offset + 1), 16)
    channels[#channels + 1] = math.floor(a + (b - a) * amount + 0.5)
  end
  return ("#%02X%02X%02X"):format(unpack(channels))
end

-- Claude Code's documented theme tokens. The terminal owns the main background.
local overrides = {
  { "claude", c.gold },
  { "claudeShimmer", blend(c.gold, c.bright, 0.35) },
  { "text", c.fg },
  { "inverseText", c.bg },
  { "inactive", c.muted },
  { "inactiveShimmer", blend(c.muted, c.fg, 0.35) },
  { "subtle", c.border },
  { "suggestion", c.rune },
  { "permission", c.gold },
  { "permissionShimmer", blend(c.gold, c.bright, 0.35) },
  { "remember", c.purple },
  { "success", c.green },
  { "error", c.red },
  { "warning", c.copper },
  { "warningShimmer", blend(c.copper, c.gold, 0.5) },
  { "merged", c.purple },
  { "promptBorder", c.gold },
  { "promptBorderShimmer", blend(c.gold, c.bright, 0.35) },
  { "planMode", c.rune },
  { "autoAccept", c.green },
  { "bashBorder", c.copper },
  { "ide", c.blue },
  { "fastMode", c.copper },
  { "fastModeShimmer", blend(c.copper, c.gold, 0.5) },
  { "effortUltra", c.purple },
  { "diffAdded", c.diff_add },
  { "diffRemoved", c.diff_delete },
  { "diffAddedDimmed", blend(c.bg, c.diff_add, 0.5) },
  { "diffRemovedDimmed", blend(c.bg, c.diff_delete, 0.5) },
  { "diffAddedWord", blend(c.diff_add, c.green, 0.2) },
  { "diffRemovedWord", blend(c.diff_delete, c.red, 0.2) },
  { "userMessageBackground", c.surface },
  { "userMessageBackgroundHover", c.select },
  { "bashMessageBackgroundColor", c.surface },
  { "memoryBackgroundColor", c.surface },
  { "selectionBg", blend(c.bg, c.gold, 0.5) },
  { "composerSidebarBackground", c.surface },
  { "rate_limit_fill", c.gold },
  { "rate_limit_empty", c.border },
  { "briefLabelYou", c.rune },
  { "briefLabelClaude", c.gold },
  { "red_FOR_SUBAGENTS_ONLY", c.red },
  { "blue_FOR_SUBAGENTS_ONLY", c.blue },
  { "green_FOR_SUBAGENTS_ONLY", c.green },
  { "yellow_FOR_SUBAGENTS_ONLY", c.gold },
  { "purple_FOR_SUBAGENTS_ONLY", c.purple },
  { "orange_FOR_SUBAGENTS_ONLY", c.copper },
  { "pink_FOR_SUBAGENTS_ONLY", blend(c.red, c.purple, 0.5) },
  { "cyan_FOR_SUBAGENTS_ONLY", c.rune },
}

-- Emit tokens in a stable order for readable generated diffs.
local lines = { "{", '  "name": "gand",', '  "base": "dark",', '  "overrides": {' }
for i, entry in ipairs(overrides) do
  local comma = i < #overrides and "," or ""
  lines[#lines + 1] = ("    %s: %s%s"):format(vim.json.encode(entry[1]), vim.json.encode(entry[2]), comma)
end
lines[#lines + 1] = "  }"
lines[#lines + 1] = "}"

local output = root .. "/extras/claude/gand.json"
assert(vim.fn.writefile(lines, output) == 0, "Failed to write " .. output)
print("Generated " .. output)
