-- Run with: nvim --headless -u NONE -i NONE -l scripts/generate-slack.lua
local script = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p")
local root = vim.fn.fnamemodify(script, ":h:h")
local c = dofile(root .. "/lua/gand/palette.lua").get()

-- Keep the four-color theme selected in Slack, including its steel background.
local colors = { "#6B7B88", c.gold, c.green, c.red }
local output = root .. "/extras/slack/gand.txt"
assert(vim.fn.writefile({ table.concat(colors, ",") }, output) == 0, "Failed to write " .. output)
print("Generated " .. output)
