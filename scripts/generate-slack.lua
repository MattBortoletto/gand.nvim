-- Run with: nvim --headless -u NONE -i NONE -l scripts/generate-slack.lua
local script = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p")
local root = vim.fn.fnamemodify(script, ":h:h")
local c = dofile(root .. "/lua/gand/palette.lua").get()

-- Slack's legacy import order, including the two top navigation colors.
local colors = {
  c.bg, -- Column background
  c.surface, -- Menu background
  c.gold, -- Active item background
  c.bg, -- Active item text
  c.select, -- Hover item background
  c.fg, -- Column text
  c.green, -- Active presence
  c.red, -- Mention badge
  c.surface, -- Top navigation background
  c.fg, -- Top navigation text
}

local output = root .. "/extras/slack/gand.txt"
assert(vim.fn.writefile({ table.concat(colors, ",") }, output) == 0, "Failed to write " .. output)
print("Generated " .. output)
