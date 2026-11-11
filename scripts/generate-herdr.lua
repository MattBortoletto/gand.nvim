-- Run with: nvim --headless -u NONE -i NONE -l scripts/generate-herdr.lua
local script = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p")
local root = vim.fn.fnamemodify(script, ":h:h")
local c = dofile(root .. "/lua/gand/palette.lua").get()

local terminal = {
  c.bg, c.red, c.green, c.gold, c.rune, c.purple, c.rune, c.fg,
  c.muted, c.red, c.green, c.gold, c.rune, c.purple, c.rune, c.bright,
}
local colors = {
  { "background", c.bg },
  { "canvas", c.bg },
  { "chrome", c.surface },
  { "surface", c.surface },
  { "popover", c.surface },
  { "raised", c.select },
  { "hover", c.select },
  { "selected", c.select },
  { "border", c.border },
  { "input", c.muted },
  { "foreground", c.fg },
  { "muted", c.muted },
  { "dim", c.muted },
  { "accent", c.gold },
  { "accent_foreground", c.bg },
  { "solid", c.gold },
  { "solid_foreground", c.bg },
  { "selection", c.select },
  { "working", c.gold },
  { "blocked", c.red },
  { "done", c.green },
  { "idle", c.muted },
  { "unknown", c.muted },
}

local lines = {
  "{",
  ('  "background": %q,'):format(c.bg),
  ('  "foreground": %q,'):format(c.fg),
  ('  "selection": %q,'):format(c.select),
  ('  "cursor": %q,'):format(c.gold),
  '  "ansi": [',
}
for i, color in ipairs(terminal) do
  lines[#lines + 1] = ('    %q%s'):format(color, i < #terminal and "," or "")
end
lines[#lines + 1] = "  ],"
lines[#lines + 1] = '  "colors": {'
for i, entry in ipairs(colors) do
  lines[#lines + 1] = ('    %q: %q%s'):format(entry[1], entry[2], i < #colors and "," or "")
end
lines[#lines + 1] = "  }"
lines[#lines + 1] = "}"

local directory = root .. "/extras/herdr"
vim.fn.mkdir(directory, "p")
local output = directory .. "/gand.json"
assert(vim.fn.writefile(lines, output) == 0, "Failed to write " .. output)
print("Generated " .. output)
